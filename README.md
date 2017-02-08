# DPlay
A little ASCII block text writer for Linux/Unix with support for multiple fonts and sizes. More fonts are welcome as are more characters from the ASCII set(See "Contributing Fonts"). Ideas for support for a multi-platform font system would be appreciated.

# Usage
Arguments are as follows:

```--font|-f``` defines the font to use. The argument that follows this will be used as the name of the folder in the installed fonts folder.

```--path|-p``` defines a directory to use for the font directory instead of the one the installFonts script creates.  The argument that follows this is the path to the fonts directory that isn't the default.

The last argument for the program is used as the text to be converted to blocks. This is only one argument, so use quotation marks!

# Contributing
This project is designed to be completely system-independent, so you may choose to use any IDE or build system you choose. Make sure to retain the system-independence of this repository on your first contribution, otherwise your pull request may be turned down. You must have fonts installed for the program to work. See "Installing Fonts" for details on how to do this.

## dub
To use this as a dub project, run ```dub init``` in the repository directory you cloned using ```git clone```. You may use anything for your project settings that you want, since those files will never be shared publically. 

If you set up with dub and plan to contribute, please add any files that dub generates into the gitignore.

To run the project, simply run ```dub run```. To only build, run ```dub build```.

## Code::Blocks
This is the IDE I have been using for this project. To set up Code::Blocks, create a new D project, and then clone this repository into it using ```git clone```. Remove any sources before doing this. You will have to configure the build settings yourself. No editing of the gitignore is nessasary, since it is already set up for Code::Blocks.

## Other IDE's
If anyone has any trouble running with a different IDE, please add a section to this readme as a part of your commit, explaining the steps required to set up for that IDE.

# Installing Fonts
Fonts may be installed under Linux, or specified with the ```path``` flag.

## Linux
Running the fonts install script will install the fonts in ```/usr/local/DPlay/fonts```. In most debian based distros of linux  this will not require ```sudo``` if the user running the script is in the "Staff" group. If your configuration is not working without sudoing the script, follow the steps under the heading below.

### Configuring /usr/local
Some distros don't do permissions quite the same way that others do, so here is a little guide on getting the script to run without sudoing it. You might read up a bit on file permissions if you don't understand the topic before following this guide.

Run ```sudo chown -R root:staff /usr/local``` to change the file group from root to staff.

Run ```sudo usermod -a -G staff <userName>``` to add your user to the staff group, if it does not already belong to it. -a appends the list of groups rather than re-writing it, and -G takes a comma-separated list to do so. This may require you to re-login or reboot to take effect.

Run ```sudo chmod -R g+w /usr/local``` to change the permissions on the file to allow the group to make changes. More info on ```chmod``` can be found here: https://help.ubuntu.com/community/FilePermissions

After these changes, you should be able to run the font install script with normal permissions without any difficulty.

## OSX
OSX will require the use of the ```path``` flag for the fonts directory. A resonable alternative for configuring with OSX would be appreciated.

## Windows
You can't use this tool on Windows because Windows' filesystem is not case-sensitive, and the way fonts are currently formatted, a case-sensitive filesystem is required. 

If someone wants to put in the effort to support windows, contact me.

# Contributing Fonts
Each font is stored in a folder inside the fonts folder. Each font folder contiains a file for each character. Each character file must have a newline at the end for the files to function correctly. Each character in a font set should be the same number of lines (Aka, 7 for the default, not counting the newlines). However, they can be any thickness.
