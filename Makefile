.PHONY: all clean


CWD = $(shell pwd)
THIRDPARTY = $(shell cd ../thirdparty && pwd)
THIRDPARTYSOURCE = $(shell cd ../thirdparty-sources && pwd)
STAGING = $(CWD)/staging
FILEBEAT = filebeat-6.6.2-linux-x86_64
FILEBEAT_TAR = $(FILEBEAT).tar.gz


CD = cd
CP = cp -pdr
RM = rm -f -r
MD = mkdir
TAR = tar -xf
MV = mv


all: clean
	$(MD) $(STAGING)
	$(CD) $(STAGING) && $(MD) bin tmp
	$(CP) $(THIRDPARTYSOURCE)/sources/$(FILEBEAT_TAR) $(STAGING)/tmp/
	$(CD) $(STAGING)/tmp/ && $(TAR) $(FILEBEAT_TAR)
	$(MV) $(STAGING)/tmp/$(FILEBEAT)/* $(STAGING)/
	$(CP) $(CWD)/bin/* $(STAGING)/bin/
	$(CP) $(CWD)/etc/* $(STAGING)/
	$(RM) $(STAGING)/tmp/


clean:
	$(RM) $(STAGING)
