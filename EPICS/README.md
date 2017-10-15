# EPICS

Files and utilities of ancillary benefit to EPICS which have yet to be integrated in the official repositories.

## Windows Visual Studio 2017

Files in %EPICS%\base\startup define the environment, and especially the %PATH% settings to the toolchain.

Install file base_startup_win32-vs2017.bat in base\startup\win32-vs2017.bat and then invoke this batch file to set the env.

This assumes a 2017 Community intall of Microsoft Visual Studio.

Note for Linux experts : there is a lack of consistency as to path specification of where VS puts batch files and how
the filesystem is organised, so expect that different versions (2010, 2014, Community or Pro edition) may require a 
bespoke setup.

See also the utilities in ../env-utils for checking path setup.

In particular, note that this utility script is to replace the "Developer cmd" prompt which ships with Studio.
