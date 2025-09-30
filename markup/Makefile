TYPST := typst compile --root .
SRCS := $(wildcard slides/*.typ) $(wildcard exercises/*.typ) syllabus.typ
OUTPUT_DIR := ../docs
OUTPUT := $(SRCS:%.typ=$(OUTPUT_DIR)/%.pdf) $(OUTPUT_DIR)/index.html
DEPDIR := .deps

all: $(OUTPUT)

clean:
ifeq ($(OS),Windows_NT)
	powershell 'Remove-Item "$(OUTPUT)".Split()'
else
	rm $(OUTPUT)
endif

$(OUTPUT_DIR)/%.pdf: %.typ
	$(TYPST) --make-deps $(DEPDIR)/$*.d $< $@

$(OUTPUT_DIR)/index.html: index.typ
	cp css/exercise.css ../docs/css/
	typst compile --features html --format html index.typ $@

DEPFILES := $(SRCS:%.typ=$(DEPDIR)/%.d)
$(DEPFILES):

include $(wildcard $(DEPFILES))
