BUILD := \
	poster \


DEPS := \
	beamerthemegemini.sty \
	beamercolorthemegemini.sty \
	beamercolorthememit.sty \
	beamercolorthemelabsix.sty \


LATEX  := latexmk
BIBTEX := bibtex

LATEXOPTS := -f -pdf -lualatex -use-make
TARGETS := $(patsubst %, %.pdf, $(BUILD))

# phony targets

all: $(TARGETS)

clean:
	rm -rf *.aux *.bbl *.blg *.log *.nav *.out *.snm *.toc *.synctex* *.xdv *.fdb_latexmk *.fls

.PHONY: all clean

# main targets

poster.pdf: poster.tex poster.bib $(DEPS)
	$(eval SRC_$@ = $(patsubst %.tex, %, $<))
	$(LATEX) $(LATEXOPTS) $(SRC_$@)
	$(BIBTEX) $(SRC_$@)
	$(LATEX) $(LATEXOPTS) $(SRC_$@)
	$(LATEX) $(LATEXOPTS) $(SRC_$@)
