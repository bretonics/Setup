# .bash_functions - User bash functions

# Template from https://gist.github.com/bretonics/894d8c2d1d4813c36b7d36e9a97aedd6

#-------------------------------------------------------------------------------
# SYSTEM
mkcd() { 
    mkdir $1; cd $1 
}

get-git-branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

drpx-ignore() {
    xattr -w com.dropbox.ignored 1 $@
}

