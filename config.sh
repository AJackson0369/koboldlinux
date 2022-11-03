#!/bin/bash
#================
# FILE          : config.sh
#----------------
# PROJECT       : OpenSuSE KIWI Image System
# COPYRIGHT     : (c) 2006 SUSE LINUX Products GmbH. All rights reserved
#               :
# AUTHOR        : Marcus Schaefer <ms@suse.de>
#               :
# BELONGS TO    : Operating System images
#               :
# DESCRIPTION   : configuration script for SUSE based
#               : operating systems
#----------------
#======================================
# Functions...
#--------------------------------------
test -f /.kconfig && . /.kconfig
test -f /.profile && . /.profile

#======================================
# Greeting...
#--------------------------------------
echo "Configure image: [$kiwi_iname]..."

#======================================
# Setup baseproduct link
#--------------------------------------
suseSetupProduct

#======================================
# Activate services
#--------------------------------------
suseInsertService sshd
baseInsertService NetworkManager
baseInsertService alsasound


#======================================
# Setup LightDM
#--------------------------------------
#======================================
# Setup default target, multi-user
#--------------------------------------
baseUpdateSysConfig /etc/sysconfig/windowmanager DEFAULT_WM budgie
 baseUpdateSysConfig /etc/sysconfig/displaymanager DISPLAYMANAGER lightdm
 baseSetRunlevel 5
 suseConfig
