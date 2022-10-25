# $File: //ASP/opa/mct/iocs/MCTDEVIOC01/MCTDEVIOC01App/Db/Makefile $
# $Revision: #1 $
# $DateTime: 2022/02/21 12:05:01 $
# Last checked in by: $Author: pozara $
#

TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#----------------------------------------------------
#  Optimization of db files using dbst (DEFAULT: NO)
#DB_OPT = YES

#----------------------------------------------------
# Create and install (or just install) into <top>/db
# databases, templates, substitutions like this
DB += dmm_energy_control.db

#----------------------------------------------------
# Call up all refraction files
# This will be installed into <top>/crapi/refractions
#
CRAPI += $(patsubst ../%, %, $(shell find ../refractions -type f ) )

#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_template = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE


# end
