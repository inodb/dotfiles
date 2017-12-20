export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
# z
. /usr/local/etc/profile.d/z.sh

# cluster open/etc
ccd() {
    cd /media/*$1
}
copen() {
    open /media/*$1
}
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
