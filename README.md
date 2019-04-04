# Packer
Packer template collection for Packer GitHub Actions test.

Actions tested
- packer validate sample-template.json
- packer validate -var-file=global-vars.json sample-template.json
- Single template

`global-vars.json` contains the global variables used as `-var-file=` argument for packer commands.

