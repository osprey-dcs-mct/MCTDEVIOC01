# $File: //ASP/opa/mct/iocs/MCTDEVIOC01/MCTDEVIOC01App/src/Makefile $
# $Revision: #1 $
# $DateTime: 2022/02/21 12:05:01 $
# Last checked in by: $Author: pozara $
#
TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = MCTDEVIOC01
# MCTDEVIOC01.dbd will be created and installed
DBD += MCTDEVIOC01.dbd

# MCTDEVIOC01.dbd will be made up from these files:
MCTDEVIOC01_DBD += base.dbd
MCTDEVIOC01_DBD += system.dbd

ifdef BASE_7_0
# We are using EPICS 7.0 or later - pull in PV Access dbd files and libraries.
#
MCTDEVIOC01_DBD += PVAServerRegister.dbd
MCTDEVIOC01_DBD += qsrv.dbd

MCTDEVIOC01_LIBS += nt
MCTDEVIOC01_LIBS += pvAccess
MCTDEVIOC01_LIBS += pvAccessCA
MCTDEVIOC01_LIBS += pvAccessIOC
MCTDEVIOC01_LIBS += pvData
MCTDEVIOC01_LIBS += pvDatabase
MCTDEVIOC01_LIBS += qsrv
endif

# Comment out Asyn, Autosave and or Sequencer support if not required.
#
# Asyn related dbd/libraries.
#
MCTDEVIOC01_DBD += asyn.dbd
MCTDEVIOC01_DBD += drvAsynIPPort.dbd
MCTDEVIOC01_DBD += drvAsynSerialPort.dbd
MCTDEVIOC01_LIBS += asyn

# Autosave related dbd/libraries.
#
MCTDEVIOC01_DBD += asSupport.dbd
MCTDEVIOC01_LIBS += autosave

# Sequencer related dbd/libraries.
#
MCTDEVIOC01_LIBS += seq pv

# Calc related dbd/libraries.
# Needed by and must preceed stream.
#
MCTDEVIOC01_DBD += calcSupport.dbd
MCTDEVIOC01_LIBS += calc

# Stream related dbd/libraries.
#
MCTDEVIOC01_DBD += stream.dbd
MCTDEVIOC01_LIBS += stream

# IOC Status related dbd/libraries.
#
MCTDEVIOC01_DBD += IocStat.dbd
MCTDEVIOC01_LIBS += IocStat

# Signal handling related dbd/libraries (Linux only)
#
MCTDEVIOC01_DBD += signal_catch.dbd
MCTDEVIOC01_LIBS += signal_catch

# Arbitary process status
#
MCTDEVIOC01_DBD += processStatus.dbd
MCTDEVIOC01_LIBS += processStatus

# Service control
#
MCTDEVIOC01_DBD += service_control.dbd
MCTDEVIOC01_LIBS += service_control

# Include dbd files and libraries from all support applications
# needed by this IOC:
#
SCRIPTS += mct_dmm_energy_control.service
SCRIPTS += mct_dmm_energy_control

# MCTDEVIOC01_registerRecordDeviceDriver.cpp derives from MCTDEVIOC01.dbd
MCTDEVIOC01_SRCS += MCTDEVIOC01_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
MCTDEVIOC01_SRCS_DEFAULT += MCTDEVIOC01Main.cpp
MCTDEVIOC01_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#MCTDEVIOC01_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
MCTDEVIOC01_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

# end
