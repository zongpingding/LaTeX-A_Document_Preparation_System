# # target
TARGET = LaTeX_A_Document_Preparing_System

# source
SRC_APPEND 	= appendix
SRC_FRONT 	= frontmatter
SRC_CHAPTER = chapters	
SRC_CHEATSHEET = cheatsheet
TEX_SOURCE_FILES = 	$(shell find $(SRC_APPEND) -name '*.tex') \
					$(shell find $(SRC_FRONT) -name '*.tex') \
					$(shell find $(SRC_CHAPTER) -name '*.tex') \
					$(shell find $(SRC_CHEATSHEET) -name '*.tex') \
					$(TARGET).tex \
					back_cover.tex \
					LaTeX_2e.sty 

# build
$(TARGET).pdf: $(TEX_SOURCE_FILES)
	pdflatex --shell-escape $(TARGET).tex
	biber $(TARGET)
	pdflatex --shell-escape $(TARGET)
	pdflatex --shell-escape $(TARGET).tex

temp:
	pdflatex --shell-escape $(TARGET).tex

clean:
	latexmk -c

Clean:
	latexmk -C
	rm -f *.bbl