TIMESYNC_RC:=timesync
TIMESYNC_WRAPPER:=timesync-wrapper
TIMESYNC_LOGROTATE:=timesync-logrotate
TIMESYNC_BIN:=timesync

#SRC_PATH:=../../../software/build/bin
INSTALL_PATH:=/usr/local/bin

.PHONY: all install clean uninstall tidy

all:
	@echo "usage: make <install | uninstall>"


install: #$(SRC_PATH)/$(TIMESYNC_BIN)
	@rm -f /tmp/.$(TIMESYNC_WRAPPER);
	sed -e "s|XXX_MY_LCM_DEFAULT_URL_XXX|$(MY_LCM_DEFAULT_URL)|" usr-local-bin-timesync-wrapper > /tmp/.$(TIMESYNC_WRAPPER);
	@cp -vf /tmp/.$(TIMESYNC_WRAPPER) $(INSTALL_PATH)/$(TIMESYNC_WRAPPER)
	@chmod a+x $(INSTALL_PATH)/$(TIMESYNC_WRAPPER)
	@if [ -d /etc/init.d ]; then \
		cp -vf $(TIMESYNC_RC) /etc/init.d/$(TIMESYNC_RC); \
		update-rc.d $(TIMESYNC_RC) defaults; \
		chmod a+x /etc/init.d/$(TIMESYNC_RC); \
	fi;

uninstall:
	@if [ -e /etc/init.d/$(TIMESYNC_RC) ]; then \
		rm -f /etc/init.d/$(TIMESYNC_RC); \
		update-rc.d -f $(TIMESYNC_RC) remove; \
	fi;
	@if [ -e /etc/logrotate.d/$(TIMESYNC_LOGROTATE) ]; then \
		rm -f /etc/logrotate.d/$(TIMESYNC_LOGROTATE); \
	fi;
	rm -f $(INSTALL_PATH)/$(TIMESYNC_WRAPPER)
