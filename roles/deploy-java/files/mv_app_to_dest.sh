src=$1
dest=$2

if test -d $src-boot-*; then
    echo "boot mv: " $src-boot-* $dest
    mv $src-boot-* $dest
else
    echo "non-boot mv: " $src $dest
    mv $src $dest
fi