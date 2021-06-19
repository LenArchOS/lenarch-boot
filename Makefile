OUTDIR ?= build

GRUB_OUT := $(wildcard $(OUTDIR)/lenarch-grub-*.pkg.tar.zst)
GRUB_SILENT_OUT := $(wildcard $(OUTDIR)/lenarch-grub-silent*.pkg.tar.zst)
GRUB_TOOLS_OUT := $(wildcard $(OUTDIR)/lenarch-grub-tools*.pkg.tar.zst)
GRUB_THEME_DEFAULT_OUT := $(wildcard $(OUTDIR)/grub2-theme-default*.pkg.tar.zst)

.PHONY:all
all: GRUB_OUT GRUB_SILENT_OUT GRUB_TOOLS_OUT GRUB_THEME_DEFAULT_OUT


.PHONY:grub
grub: GRUB_OUT GRUB_SILENT_OUT GRUB_TOOLS_OUT GRUB_THEME_DEFAULT_OUT

.PHONY:themes
themes:GRUB_THEME_DEFAULT_OUT

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

GRUB_THEME_DEFAULT_OUT:grub2-theme-default/PKGBUILD grub2-theme-default/src
	mkdir -p $(OUTDIR)
	(cd grub2-theme-default && makepkg -fs)
	mv grub2-theme-default/*.pkg.tar.zst $(OUTDIR)/


.PHONY:clean
clean:
	rm -rf build/
	rm -rf */pkg/
	rm -rf lenarch*/src/
	rm -rf lenarch-grub/grub
	rm -rf lenarch-grub/grub-extras
	rm -rf lenarch-grub/gnulib
	rm -rf lenarch-grub/unifont-*
	rm -rf lenarch-grub-silent/*.tar.xz
	rm -rf lenarch-grub-silent/*.tar.gz
	rm -rf grub2-theme-default/grub2-theme-default