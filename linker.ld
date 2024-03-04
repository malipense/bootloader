/*x86_64 ELF64 output*/
OUTPUT_FORMAT(elf64-x86-x=64)
OUTPUT_ARCH(i386:x86-64)

/*symbol _start to be the entry point*/
ENTRY(_start)

PHDRS
{
    text    PT_LOAD     FLAGS((1 << 0) | (1 << 2)); /*Execute + Read*/
    rodata  PT_LOAD     FLAGS((1 << 2));            /*Read only*/
    data    PT_LOAD     FLAGS((1 << 1) | (1 << 2)); /*Write + Read*/
}

SECTIONS
{
    . = 0xffffffff80000000;

    .text : {
        *(.text .text.*)
    } :text

    . += CONSTANT(MAXPAGESIZE); /*+4 kb | 2 MB*/

    .rodata : {
        *(.rodata .rodata.*)
    } :rodata

    . += CONSTANT(MAXPAGESIZE);

    .data : {
        *(.data .data.*)
    } :data

    .bss : {
        *(COMMON)
        *(.bss .bss.*)
    } :data

    /DISCARD/ : {
        *(.eh_frame)
        *(.note .note.*)
    }
}