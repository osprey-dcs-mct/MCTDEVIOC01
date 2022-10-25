#!../../bin/linux-x86_64/MCTDEVIOC01
#
# $File: //ASP/opa/mct/iocs/MCTDEVIOC01/iocBoot/iocMCTDEVIOC01/st.cmd $
# $Revision: #1 $
# $DateTime: 2022/02/21 12:05:01 $
# Last checked in by: $Author: pozara $
#

## You may have to change MCTDEVIOC01 to something else
## everywhere it appears in this file

< envPaths

# Usually set by epics.service script
epicsEnvSet ("IOCNAME", "MCTDEVIOC01")
epicsEnvSet ("IOCSH_PS1","MCTDEVIOC01> ")

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/MCTDEVIOC01.dbd"
MCTDEVIOC01_registerRecordDeviceDriver pdbbase

## Autosave set-up
#
< ${AUTOSAVESETUP}/crapi/save_restore.cmd

## Load record instances
#
# Set hash table size
#
dbPvdTableSize (4096)

# Allow epics service script to initiate clean shutdown by performing
#   caput MCTDEVIOC01:exit.PROC 1
#
dbLoadRecords ("${EPICS_BASE}/db/softIocExit.db", "IOC=${IOCNAME}")

# Load standard bundle build status and IOC (and host) monitoring records.
#
dbLoadRecords ("${BUNDLESTATUS}/db/build.template", "IOC=${IOCNAME}")
dbLoadRecords ("${IOCSTATUS}/db/IocStatus.template", "IOC=${IOCNAME}")

# Load the energy control database and start the calculation script as a service
#
dbLoadRecords ("db/dmm_energy_control.db")
register_service_name ("/beamline/perforce/opa/mct/iocs/MCTMSCIOC01/bin/linux-x86_64/mct_dmm_energy_control")

cd ${TOP}/iocBoot/${IOC}
iocInit

# Catch SIGINT and SIGTERM - do an orderly shutdown
#
catch_sigint
catch_sigterm

# Update the firewall to allow use of arbitary port number
#
system firewall_update

# Dump all record names
#
dbl > /asp/logs/ioc/${IOCNAME}/${IOC}.dbl

# end
