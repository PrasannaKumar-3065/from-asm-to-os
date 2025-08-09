file="$1"                     # First script argument (file path)
filename=$(basename "$file" .img)
name_wiout_ext=${filename%.*}
echo "build nasm  $name_wiout_ext"
nasm -f bin "src/$file" -o "img/$name_wiout_ext".img

echo "starting QEMU bootloader" 

qemu-system-i386 -fda img/"$name_wiout_ext".img
