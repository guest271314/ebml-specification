$(info RFC rendering has been tested with mmark version 2.0.40 and xml2rfc 2.5.1, please ensure these are installed and recent enough.)

VERSION := 10
STATUS := draft-
OUTPUT := $(STATUS)ietf-cellar-ebml-$(VERSION)

all: $(OUTPUT).html $(OUTPUT).txt $(OUTPUT).xml

$(OUTPUT).md: specification.markdown rfc_frontmatter.markdown
	cat rfc_frontmatter.markdown $< > $(OUTPUT).md

%.xml: %.md
	mmark -2 $< $@

%.html: %.xml
	xml2rfc --html $< -o $@

%.txt: %.xml
	xml2rfc $< -o $@

clean:
	rm -f $(OUTPUT).txt $(OUTPUT).html $(OUTPUT).md $(OUTPUT).xml
