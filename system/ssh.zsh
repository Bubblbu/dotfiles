# Mount & umount remote drives
alias mnt_sfu="sshfs sfu:/home/aenkhbay /mnt/sfu"
alias mnt_sfu_gate="sshfs sfu_gate:/home/aenkhbay /mnt/sfu"
alias mnt_scl="sshfs scl:/home/scholcom /mnt/scholcommlab"

alias umnt_sfu="fusermount -u /mnt/sfu"
alias umnt_scl="fusermount -u /mnt/scholcommlab"

# Alias to append ZSH as startup bash for ssh-ing
alias -g 'scholcomm=scholcomm -t zsh'
alias -g 'scholcomm_gate=scholcomm_gate -t zsh'

# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"