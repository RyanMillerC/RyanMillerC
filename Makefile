# ==============================
# Render Markdown file into HTML
# ==============================

# Markdown file to render into HTML document under ./output.
FILENAME := personal-user-manual.md

# "make" should remove ./output, generate new HTML, and open it
# in a browser window.
.PHONY: all
all: clean generate open

# Remove output directory
.PHONY: clean
clean:
	-rm -rf ./output

# Generate HTML from Markdown file
.PHONY: generate
generate:
	generate-md \
		--layout github \
		--input "${FILENAME}" \
		--output output
	mv ./output/*.html ./output/index.html
	cp -r ./pics ./output/pics

# Open output in a browser window.
.PHONY: open
open:
	open ./output/index.html
