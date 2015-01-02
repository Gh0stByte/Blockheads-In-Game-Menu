ARCHS = arm64 armv7

include theos/makefiles/common.mk

TWEAK_NAME = BlockheadsInventoryHack
BlockheadsInventoryHack_FILES = Tweak.xm
BlockheadsInventoryHack_FRAMEWORKS = UIKit
include $(THEOS_MAKE_PATH)/tweak.mk

BUNDLE_NAME = BlockheadsInventory
BlockheadsInventory_INSTALL_PATH = /Library/MobileSubstrate/DynamicLibraries/
include $(THEOS)/makefiles/bundle.mk

after-install::
	install.exec "killall -9 Blockheads; killall -9 Preferences"
SUBPROJECTS += blockheadsinventory
include $(THEOS_MAKE_PATH)/aggregate.mk
