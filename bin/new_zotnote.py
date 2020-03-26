#!/usr/bin/env python
# # -*- coding: utf-8 -*-
import argparse
import datetime
import json
import sqlite3
from pathlib import Path

ZOTERO = Path("/home/asura/Zotero/")
NOTES = Path("/home/asura/Documents/notes/")

AUTHOR = "Asura Enkhbayar"


class MarkdownTemplate():
    def __init__(self, citekey, fieldValues):
        self.citekey = citekey
        self.fieldValues = fieldValues
        self.ts = datetime.datetime.now()
        self.ts_iso = self.ts.isoformat(timespec="seconds")
        self.ts_day = self.ts.strftime("%m.%d.%y")

        self.author = AUTHOR

    def __str__(self):
        template = f"""---
key: {self.citekey}
date: {self.ts_iso}
author: {self.author}
---

# {self.fieldValues['title']}

*Reading Notes by {self.author} | {self.ts_day}*

| Zotero field | Value |
| --- | --- |
| Creators | {self.fieldValues['creator']} |
| Citekey | {self.citekey} |
| Type | {self.fieldValues['type']} |
| DOI | [{self.fieldValues['DOI']}](https://doi.org/{self.fieldValues['DOI']}) |
| Date | {self.fieldValues['date']} |

*Keywords*:

---

## Short summary

## Quotes

## Further reading

---

## Detailed notes
"""
        return template


class ZoteroDBConnector():
    def __init__(self, citekey):
        self.__citekey = citekey
        self.__itemID = None

        self.__fieldIDs = {
            'title': 110,
            'DOI': 26,
            'date': 14
        }

        self.__zotero = None

        self.fieldValues = {
            'title': "",
            'type': "",
            'DOI': "",
            'date': "",
            'creator': ""
        }

        self.__get_item_id()

    def __get_item_id(self):
        better_bibtex = sqlite3.connect(str(ZOTERO / "better-bibtex.sqlite.bak"))
        keys_string = better_bibtex.execute(
            'SELECT data FROM "better-bibtex" WHERE name="better-bibtex.citekey"')
        keys_dict = json.loads(keys_string.fetchone()[0])
        k = {v['citekey']: v['itemID'] for v in keys_dict['data']}
        self.itemID = k[self.__citekey]
        better_bibtex.close()

    def __get_value_id(self):
        results = self.__zotero.execute(
            f"SELECT fieldID, valueID from itemData where itemID=\"{self.itemID}\"")
        return {f: v for (f, v) in results.fetchall()}

    def __get_value_labels(self, valueID):
        result = self.__zotero.execute(
            f"SELECT value from itemDataValues where valueID=\"{valueID}\"")
        return result.fetchone()[0]

    def __get_type_name(self):
        result = self.__zotero.execute(f"SELECT itemTypeID from items where itemID=\"{self.itemID}\"")
        itemTypeID = result.fetchone()[0]
        result = self.__zotero.execute(
            f"SELECT typeName from itemTypes where itemTypeID=\"{itemTypeID}\"")
        return result.fetchone()[0]

    def __get_creator_name(self):
        result = self.__zotero.execute(
            f"SELECT creatorID from itemCreators where itemID=\"{self.itemID}\"")
        creators = result.fetchall()
        creatorIDs = [_[0] for _ in creators]

        creators = []
        for creatorID in creatorIDs:
            result = self.__zotero.execute(
                f"SELECT firstName, lastName from creators where creatorID=\"{creatorID}\"")
            name = result.fetchone()
            creators.append(f"{name[1]}, {name[0]}")
        return "; ".join(creators)

    def get_field_values(self):
        self.__zotero = sqlite3.connect(str(ZOTERO / "zotero.sqlite.bak"))

        valueIDs = self.__get_value_id()
        for l, fID in self.__fieldIDs.items():
            try:
                self.fieldValues[l] = self.__get_value_labels(valueIDs[fID])
            except Exception:
                pass

        if self.fieldValues['date'] != "":
            self.fieldValues['date'] = self.fieldValues['date'].split(" ")[-1]

        # creator string
        self.fieldValues['creator'] = self.__get_creator_name()

        # item type
        self.fieldValues['type'] = self.__get_type_name()

        # Close the connection
        self.__zotero.close()
        return self.fieldValues


if __name__ == "__main__":
    # Arguments
    parser = argparse.ArgumentParser(
        description='This is a script that fetches data from local Zotero'
                    'databases and creates a template for reading notes.')
    parser.add_argument("cite_key", action="store", type=str)
    args = parser.parse_args()

    citekey = args.cite_key

    # Retrieve Information from Zotero
    zotero = ZoteroDBConnector(citekey)
    fieldValues = zotero.get_field_values()

    # Fill template
    md = MarkdownTemplate(citekey, fieldValues)

    # Write output file
    file = NOTES / f"{citekey}.md"
    file.write_text(str(md))
