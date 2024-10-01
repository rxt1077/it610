TYPST := typst compile --root .
OUTPUT_DIR := ../docs

all: $(OUTPUT_DIR)/slides/automation.pdf $(OUTPUT_DIR)/slides/buzz.pdf

$(OUTPUT_DIR)/slides/automation.pdf: slides/automation.typ templates/slides.typ images/python-logo.svg images/bash-logo.svg images/crontab.png images/push-pull.jpg images/ansible-logo.svg images/mindset.jpg
	typst compile --root . slides/automation.typ $(OUTPUT_DIR)/slides/automation.pdf

$(OUTPUT_DIR)/slides/buzz.pdf: slides/buzz.typ templates/slides.typ images/configure-icon.svg images/operate-icon.svg images/maintain-icon.svg images/devops.svg images/sre.jpg images/sysadmin-heroes.svg
	typst compile --root . slides/buzz.typ $(OUTPUT_DIR)/slides/buzz.pdf
