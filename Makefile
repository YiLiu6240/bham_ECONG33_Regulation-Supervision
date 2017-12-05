SRC1=Regulation_class_set_note_1
SRC2=Regulation_class_set_note_2
SRC3=Regulation_class_set_note_3
SRC4=Regulation_class_set_note_4
SRC5=Regulation_class_set_note_5
OUTDIR=output
OUT1=$(OUTDIR)/$(SRC1).pdf
OUT2=$(OUTDIR)/$(SRC2).pdf
OUT3=$(OUTDIR)/$(SRC3).pdf
OUT4=$(OUTDIR)/$(SRC4).pdf
OUT5=$(OUTDIR)/$(SRC5).pdf

all: assets note1 note2 note3 note4 note5 clean

prebuild:
	mkdir -p prebuild
	cp -r $(OUTDIR)/Regulation_class_set_note_* prebuild

clean:
	latexmk -c

cleanall:
	rm -rf $(OUTDIR)
	rm -rf prebuild

.PHONY: all clean cleanall note1 note2 note3 note4 note5 assets prebuild

note1: assets
	mkdir -p $(OUTDIR)
	latexmk -pdf $(SRC1)
	mv $(SRC1).pdf $(OUTDIR)
	latexmk -c

note2:
	mkdir -p $(OUTDIR)
	latexmk -pdf $(SRC2)
	mv $(SRC2).pdf $(OUTDIR)

note3:
	mkdir -p $(OUTDIR)
	latexmk -pdf $(SRC3)
	mv $(SRC3).pdf $(OUTDIR)
	latexmk -c

note4:
	mkdir -p $(OUTDIR)
	latexmk -pdf $(SRC4)
	mv $(SRC4).pdf $(OUTDIR)
	latexmk -c

note5:
	mkdir -p $(OUTDIR)
	latexmk -pdf $(SRC5)
	mv $(SRC5).pdf $(OUTDIR)
	latexmk -c

assets:
	mkdir -p $(OUTDIR)
	dot -Tpdf assets/Basel_III_capital.dot -o output/Basel_III_capital.pdf
	pdflatex -output-directory output assets/note2_normal_pdf.tex
	pdflatex -output-directory output assets/note2_normal_cdf.tex
	pdflatex -output-directory output assets/note2_normal_pdf_losses.tex
	pdflatex -output-directory output assets/note2_normal_cdf_losses.tex
