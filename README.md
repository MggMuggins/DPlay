# DPlay
A little ASCII block text writer for Linux/Unix with support for multiple fonts and sizes. More fonts are welcome as are more characters from the ASCII set(See "Contributing Fonts"). Ideas for support for a multi-platform font system would be appreciated.

# Usage
Arguments are as follows:
```-f``` defines the font to use. The argument that follows this will be used as the name of the folder in the installed fonts folder.
The last argument for the program is used as the text to be converted to blocks. This is only one argument, so use quotation marks!

# Contributing
You can clone this repo into an IDE project folder, or use dub. You must have fonts installed for the program to work. See "Installing Fonts" for details on how to do this.

# Installing Fonts
Running the fonts install script (Linux) will install the fonts in ```/usr/local/DPlay/fonts```. In most debian based distros of linux  this will not require ```sudo``` if the user running the script is in the "Staff" group. 
## Ubuntu
Ubuntu doesn't do permissions quite the same way that most debians do, so here is a little guide on getting the script to run without sudoing it. You might read up a bit on file permissions if you don't understand the topic before following this guide.

Run ```sudo chown -R root:staff /usr/local``` to change the file group from root to staff.
Run ```sudo usermod -a -G staff <userName>``` to add your user to the staff group, if it does not already belong to it. -a appends the list of groups rather than re-writing it, and -G takes a comma-separated list to do so. This may require you to re-login or reboot to take effect.
Run ```sudo chmod -R g+w /usr/local``` to change the permissions on the file to allow the group to make changes. More info on ```chmod``` can be found here: https://help.ubuntu.com/community/FilePermissions

After these changes, you should be able to run the font install script without any difficulty.

## OSX
Font install script for OSX would be appreciated (Install in a user-neutral location). Any changes made to the fonts folder in the repo will require a re-run of the script to take effect.

# Contributing Fonts
Each font is stored in a folder inside the fonts folder. Each font folder contiains a file for each character. Each character file must have a newline at the end for the files to function correctly. Each character in a font set should be the same number of lines (Aka, 7 for the default, not counting the newlines). However, they can be any thickness.
