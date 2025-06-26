# Define the default target of this Makefile
all: blueprints/blueprint.json

# Get current directory
MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
MKFILE_DIR := $(dir $(MKFILE_PATH))

# Create a function to run command in the docker directory
DOCKER_IMAGE = ghcr.io/yliu-hashed/sm-eda-bundle:latest
DOCKER_ARGS = run --rm --mount type=bind,source="$(MKFILE_DIR)",target=/working $(DOCKER_IMAGE)
DOCKER_RUN = docker $(DOCKER_ARGS) bash -l -c "cd working && $(1)"

VERILOG_SRC_FILES := $(wildcard src/*.v)

# Argument for blueprint generation

# Synthesis for top ------------------------------------------------------------
## verilog --yosys-> synth
tmp/synth.json: resources/script.ys $(VERILOG_SRC_FILES)
	$(call DOCKER_RUN,yosys -s resources/script.ys src/top.v)

## synth --ys2sm-> model
tmp/model.json: tmp/synth.json
	$(call DOCKER_RUN,sm-eda ys2sm --clk clk tmp/synth.json tmp/model.json)

## model --place-> blueprint
blueprints/blueprint.json: tmp/model.json resources/config.json
	$(call DOCKER_RUN,sm-eda place -v --config resources/config.json tmp/model.json blueprints/blueprint.json > logs/place.log)

package-release.zip: tmp/model.json
	zip -r package-release.zip blueprints

# Subcommands
.PHONY: clean cleantmp

setup:
	mkdir -p tmp
	mkdir -p blueprints
	mkdir -p logs

clean:
	rm -rf tmp
	rm -rf blueprints
	rm -rf logs
	mkdir tmp
	mkdir blueprints
	mkdir logs

cleantmp:
	rm -rf tmp
	mkdir tmp

# This target creates a release package.
# By default, it contains every transient files.
package-debug:
	zip -r package-debug.zip tmp blueprints logs

# This target creates a release package.
# By default, it only contains the blueprints folder.
package-release: package-release.zip
