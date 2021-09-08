#add each topic folder to fpath so that they can add functions and completion scripts
for topic_folder ($ZSHDOT/*) if [ -d $topic_folder ]; then  fpath=($topic_folder $fpath); fi;

# shell functions
export fpath=($ZSHDOT/functions $fpath)
autoload -Uz $ZSHDOT/functions/*(:t)

# other built in functions
autoload zmv