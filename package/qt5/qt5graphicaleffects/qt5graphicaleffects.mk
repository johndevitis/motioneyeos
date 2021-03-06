################################################################################
#
# qt5graphicaleffects
#
################################################################################

QT5GRAPHICALEFFECTS_VERSION = $(QT5_VERSION)
QT5GRAPHICALEFFECTS_SITE = $(QT5_SITE)
QT5GRAPHICALEFFECTS_SOURCE = qtgraphicaleffects-opensource-src-$(QT5GRAPHICALEFFECTS_VERSION).tar.xz
QT5GRAPHICALEFFECTS_DEPENDENCIES = qt5base qt5declarative
QT5GRAPHICALEFFECTS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
QT5GRAPHICALEFFECTS_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
else
QT5GRAPHICALEFFECTS_LICENSE = Commercial license
QT5GRAPHICALEFFECTS_REDISTRIBUTE = NO
endif

define QT5GRAPHICALEFFECTS_CONFIGURE_CMDS
	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
endef

define QT5GRAPHICALEFFECTS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define QT5GRAPHICALEFFECTS_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
endef

define QT5GRAPHICALEFFECTS_INSTALL_TARGET_CMDS
	cp -dpfr $(STAGING_DIR)/usr/qml/QtGraphicalEffects $(TARGET_DIR)/usr/qml
endef

$(eval $(generic-package))
