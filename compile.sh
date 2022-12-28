export PATH="/mnt/c/gamepad-os/tools/i386-elf-7.5.0-Linux-x86_64/bin:$PATH"

asm="nasm"
i386_gcc="i386-elf-gcc"
i386_ld="i386-elf-ld"

clear

# Bootloader here
$asm src/bootloader/boot.asm -o tmp/bootloader.o
# End of bootloader

$asm src/kernel/entry.asm -f elf -o tmp/kernel_entry.o

# Kernel here
$i386_gcc -I src/kernel -ffreestanding -m32 -g -c "src/kernel/kernel.c" -o "tmp/kernel.o"
# End of kernel

$i386_ld -m elf_i386 -o "tmp/full_kernel.o" -Ttext 0x1000 "tmp/kernel_entry.o" "tmp/kernel.o" --oformat binary

cat "tmp/bootloader.o" "tmp/full_kernel.o" > "dist/system.bin"