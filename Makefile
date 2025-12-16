PROJECT_NAME = CP 
CORE = esp32:esp32:esp32doit-devkit-v1
PORT = /dev/ttyUSB0
CONFIG_FILE = arduino-cli.yaml

all: compile upload 

compile:
	arduino-cli --config-file $(CONFIG_FILE) compile --fqbn $(CORE) $(PROJECT_NAME)

upload:
	arduino-cli --config-file $(CONFIG_FILE) upload --fqbn $(CORE) --port $(PORT) $(PROJECT_NAME)

monitor:
	arduino-cli --config-file$(CONFIG_FILE) monitor --port $(PORT)

clean:
	rm -rf $(PROJECT_NAME).hex $(PROJECT_NAME).ino.d $(PROJECT_NAME).ino.o 

.PHONY: all compile upload monitor clean

# Core:
# core update-index
# core list --all 
#
# About fqbn:
# board listall
# arduino-cli board listall | grep -i devkit
