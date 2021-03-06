# Default target.
all : commands

## commands : show all commands.
commands :
	@grep -h -E '^##' ${MAKEFILE_LIST} | sed -e 's/## //g' | column -t -s ':'

## site : rebuild GitHub Pages site locally.
site : _data/glossary.yml
	rm -rf .jekyll-cache .jekyll-metadata _site
	bundle exec jekyll build

## serve : serve GitHub Pages site locally.
serve : _data/glossary.yml
	rm -rf _site
	bundle exec jekyll serve -I

## clean : clean up unneeded files.
clean :
	@rm -rf _site
	@find . -name '*~' -exec rm {} \;
	@rm -f _data/glossary.yml

# Create copy of glossary file for GitHub Pages site.
_data/glossary.yml : ./glossary.yml
	@mkdir -p _data
	@cp $< $@
