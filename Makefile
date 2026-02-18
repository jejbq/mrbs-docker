
mrbs_version := $(shell curl --silent "https://api.github.com/repos/meeting-room-booking-system/mrbs-code/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
sso_version := $(shell curl --silent "https://api.github.com/repos/simplesamlphp/simplesamlphp/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
theme_version := $(shell curl --silent "https://api.github.com/repos/dorianim/modern-mrbs-theme/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')

default: version

all: version

version:
	@sed -r -i "s/^(ARG MRBS_RELEASE)=.*/\1=$(mrbs_version)/" Dockerfile
	@sed -r -i "s/^(ARG SIMPLESAMLPHP_RELEASE)=.*/\1=$(sso_version)/" Dockerfile
	@sed -r -i "s/^(ARG MODERN_MRBS_THEME_RELEASE)=.*/\1=$(theme_version)/" Dockerfile

