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
ASSET5=$(OUTDIR)/Basel_III_capital.pdf

all: note1 note2 note3 note4 note5 clean

clean:
	latexmk -c

cleanall:
	rm -rf $(OUTDIR)

.PHONY: all clean cleanall note1 note2 note3 note4 note5 assets

note1: assets
	mkdir -p $(OUTDIR)
	latexmk -pdf $(SRC1)
	mv $(SRC1).pdf $(OUTDIR)

note2: assets
	mkdir -p $(OUTDIR)
	latexmk -pdf $(SRC2)
	mv $(SRC2).pdf $(OUTDIR)

note3: assets
	mkdir -p $(OUTDIR)
	latexmk -pdf $(SRC3)
	mv $(SRC3).pdf $(OUTDIR)

note4: assets
	mkdir -p $(OUTDIR)
	latexmk -pdf $(SRC4)
	mv $(SRC4).pdf $(OUTDIR)

note5: assets
	mkdir -p $(OUTDIR)
	latexmk -pdf $(SRC5)
	mv $(SRC5).pdf $(OUTDIR)

assets:
	mkdir -p $(OUTDIR)
	dot -Tpdf assets/Basel_III_capital.dot -o $(ASSET5)