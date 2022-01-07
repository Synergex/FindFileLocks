# FindFileLocks<br />
**Created Date:** 8/7/2008<br />
**Last Updated:** 8/7/2008<br />
**Description:** FindFileLocks is a collection of OS-specific utilities and routines to identify process information on locked database records.<br />
**Platforms:** Windows; Unix; OpenVMS<br />
**Products:** Synergy DBL<br />
**Minimum Version:** 6<br />
**Author:** Chris Blundell, William Hawkins, Nigel White
<hr>

**Additional Information:**
The folders provided here are OS-specific.
FileLocksWinUnix, written by William Hawkins, is for Windows and Unix systems only. It is a Synergy program that uses the chklock utility to determine which record is locked in a Synergy ISAM file.

FileLocksVMS was written by Chris Blundell and is exclusively for OpenVMS. This is a modified version of the deprecated FindLocks routine (see below) which will find locks in a file or ALL files on OpenVMS. This version adds a little functionality and contains an example usage routine. There are two files Synergy FindLock routine.docx and Readme.txt that will explain how to install and run the routines.

FindLocksVMS-Old is a deprecated version that has had some limited success but may provide good reference material. It was original written by Nigel White and is for the OpenVMS operating system. It was originally designed to identify which processes have records locked on VMS.
