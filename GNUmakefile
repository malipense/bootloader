override MAKEFLAGS += -rR

override KERNEL := myos.elf

define DEFAULT_VAR =
	ifeq ($(origin $1), default)
		override $(1) := $(2)
	endif
	ifeq ($(origin $1), undefined)
		override $(1) := $(2)
	endif
endef

override DEFAULT_CC := cc
$(eval $(call DEFAULT_VAR, CC, $(DEFAULT_CC)))

override DEFAULT_LD := ld
$(eval $(call DEFAULT_VAR, LD, $(DEFAULT_LD)))

override DEFAULT_CFLAGS := -g -02 -pipe
$(eval $(call DEFAULT_VAR, CFLAGS, $(DEFAULT_CFLAGS)))

override DEFAULT_CPPFLAGS := 
$(eval $(call DEFAULT_VAR, CPPFLAGS, $(DEFAULT_CPPFLAGS)))

override DEFAULT_NASMFLAGS := -F dwarf -g
$(eval $(call DEFAULT_VAR, NASMFLAGS, $(DEFAULT_NASMFLAGS)))

override DEFAULT_LDFLAGS := 
$(eval $(call DEFAULT_VAR, LDFLAGS, $(DEFAULT_LDFLAGS)))

override CFLAGS += \
	-Wall \
	-Wextra \
	-std=gnu11 \
	-ffreestanding \
	-fno-stack-protector \
	-fno-stack-check \
	-fno-lto \
	-fno-PIE \
	-fno-PIC \
	-m64 \
	-march=x86-64 \
	-mabi=sysv \
	-mno-80387 \
	-mno-mmx \
	-mno-sse \
	-mno-sse2 \
	-mno-red-zone \
	-mcmodel=kernel

