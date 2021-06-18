OUTDIR ?= build

GRUB_OUT := $(wildcard $(OUTDIR)/lenarch-grub-*.pkg.tar.zst)
GRUB_SILENT_OUT := $(wildcard $(OUTDIR)/lenarch-grub-silent*.pkg.tar.zst)
GRUB_TOOLS_OUT := $(wildcard $(OUTDIR)/lenarch-grub-tools*.pkg.tar.zst)

.PHONY:all
all: GRUB_OUT GRUB_SILENT_OUT GRUB_TOOLS_OUT


.PHONY:grub
grub: GRUB_OUT GRUB_SILENT_OUT GRUB_TOOLS_OUT

GRUB_OUT:lenarch-grub/*
	mkdir -p $(OUTDIR)
	(cd lenarch-grub && makepkg -fs)
	mv lenarch-grub/*.pkg.tar.zst $(OUTDIR)/

GRUB_SILENT_OUT:lenarch-grub-silent/*
	mkdir -p $(OUTDIR)
	(cd lenarch-grub-silent && makepkg -fs)
	mv lenarch-grub-silent/*.pkg.tar.zst $(OUTDIR)/

GRUB_TOOLS_OUT:lenarch-grub-tools/*
	mkdir -p $(OUTDIR)
	(cd lenarch-grub-tools && makepkg -fs)
	mv lenarch-grub-tools/*.pkg.tar.zst $(OUTDIR)/



.PHONY:clean
clean:
	rm -rf build/
	rm -rf */pkg/
	rm -rf */src/
	rm -rf lenarch-grub/grub
	rm -rf lenarch-grub/grub-extras
	rm -rf lenarch-grub/gnulib
	rm -rf lenarch-grub/unifont-*
	rm -rf lenarch-grub-silent/*.tar.xz
	rm -rf lenarch-grub-silent/*.tar.gz