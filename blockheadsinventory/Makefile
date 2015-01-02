ARCHS = arm64 armv7
include theos/makefiles/common.mk

BUNDLE_NAME = BlockheadsInventory
BlockheadsInventory_FILES = BlockheadsInventory.mm
BlockheadsInventory_INSTALL_PATH = /Library/PreferenceBundles
BlockheadsInventory_FRAMEWORKS = UIKit
BlockheadsInventory_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/BlockheadsInventory.plist$(ECHO_END)
