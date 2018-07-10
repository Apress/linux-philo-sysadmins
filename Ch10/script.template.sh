#!/bin/bash
################################################################################
#                              scriptTtemplate                                 #
#                                                                              #
# Use this template as the beginning of a new program. Place a short           #
# decription of the script here.                                               #
#                                                                              #
# Change History                                                               #
# 04/12/2017  David Both    Original code. This is a template for creating     #
#                           new Bash shell scripts.                            #
#                           Add new history entries as needed.                 #
#                                                                              #
#                                                                              #
################################################################################
################################################################################
################################################################################
#                                                                              #
#  Copyright (C) 2007, 2016 David Both                                         #
#  LinuxGeek46@both.org                                                        #
#                                                                              #
#  This program is free software; you can redistribute it and/or modify        #
#  it under the terms of the GNU General Public License as published by        #
#  the Free Software Foundation; either version 2 of the License, or           #
#  (at your option) any later version.                                         #
#                                                                              #
#  This program is distributed in the hope that it will be useful,             #
#  but WITHOUT ANY WARRANTY; without even the implied warranty of              #
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               #
#  GNU General Public License for more details.                                #
#                                                                              #
#  You should have received a copy of the GNU General Public License           #
#  along with this program; if not, write to the Free Software                 #
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA   #
#                                                                              #
################################################################################
################################################################################
################################################################################

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo "Add description of the script functions here."
   echo
   echo "Syntax: template <option list here>"
   echo "options:"
   echo "g     Print the GPL license notification."
   echo "h     Print this Help."
   echo "v     Verbose mode."
   echo "V     Print software version and exit."
   echo
}

################################################################################
# Print the GPL license header                                                 #
################################################################################
gpl()
{
   echo
   echo "################################################################################"
   echo "#  Copyright (C) 2007, 2016  David Both                                        #"
   echo "#  Millennium Technology Consulting LLC                                        #"
   echo "#  http://www.millennium-technology.com                                        #"
   echo "#                                                                              #"
   echo "#  This program is free software; you can redistribute it and/or modify        #"
   echo "#  it under the terms of the GNU General Public License as published by        #"
   echo "#  the Free Software Foundation; either version 2 of the License, or           #"
   echo "#  (at your option) any later version.                                         #"
   echo "#                                                                              #"
   echo "#  This program is distributed in the hope that it will be useful,             #"
   echo "#  but WITHOUT ANY WARRANTY; without even the implied warranty of              #"
   echo "#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               #"
   echo "#  GNU General Public License for more details.                                #"
   echo "#                                                                              #"
   echo "#  You should have received a copy of the GNU General Public License           #"
   echo "#  along with this program; if not, write to the Free Software                 #"
   echo "#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA   #"
   echo "################################################################################"
   echo
}

################################################################################
# Quit nicely with messages as appropriate                                     #
################################################################################
Quit()
{
   if [ $verbose = 1 ]
      then
      if [ $error = 0 ]
         then
         echo "Program terminated normally"
      else
         echo "Program terminated with error ID $ErrorMsg";
      fi
   fi
   exit $error
}

################################################################################
# Display verbose messages in a common format                                  #
################################################################################
PrintMsg()
{
   if  [ $verbose = 1 ] && [ -n "$Msg" ]
   then
      echo "########## $Msg ##########"
      # Set the message to null
      Msg=""
   fi
}

################################################################################
################################################################################
# Main program                                                                 #
################################################################################
################################################################################
# Set initial variables
badoption=0
error=0
RC=0
verbose=0
version=01.02.03

#---------------------------------------------------------------------------
# Check for root. Delete if necessary.

if [ `id -u` != 0 ]
then
   echo ""
   echo "You must be root user to run this program"
   echo ""
   Quit 1
fi

################################################################################
# Process the input options. Add options as needed.                            #
################################################################################
# Get the options
while getopts ":gchrvV" option; do
   case $option in
      g) # display GPL
         gpl
         Quit;;
      v) # Set verbose mode
         verbose=1;;
      V) # Print software version number
         echo "Version = $version"
         Quit;;
      h) # display Help
         Help
         Quit;;
     \?) # incorrect option
         badoption=1;;
   esac
done

if [ $badoption = 1 ]
then
   echo "ERROR: Invalid option"
   Help
   verbose=1
   error=1
   ErrorMsg="10T"
   Quit $error
fi

################################################################################
################################################################################
################################################################################
################################################################################
# The main body of your program goes here.
################################################################################
################################################################################
################################################################################
################################################################################

Quit

################################################################################
# End of program
################################################################################

