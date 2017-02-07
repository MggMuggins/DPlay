# DPlay
A little ASCII block text writer for Linux/Unix with support for multiple fonts and sizes. More fonts are welcome as are more characters from the ASCII set(See "Contributing Fonts"). Ideas for support for a multi-platform font system would be appreciated.

# Usage
Arguments are as follows:
```-f``` defines the font to use. The argument that follows this will be used as the name of the folder in the installed fonts folder.
The last argument for the program is used as the text to be converted to blocks. This is only one argument, so use quotation marks!

# Contributing
You can clone this repo into an IDE project folder, or use dub. Running the fonts install script (Linux) will install the fonts in ```/usr/local/DPlay/fonts```. Ideally this will not require ```sudo``` if the user running the script is in the "Staff" group. Font install script for OSX would be appreciated (Install in a user-neutral location). Any changes made to the fonts folder in the repo will require a re-run of the script to take effect.

# Contributing Fonts
Each font is stored in a folder inside the fonts folder. Each font folder contiains a file for each character. Each character file must have a newline at the end for the files to function correctly. Each character in a font set should be the same number of lines (Aka, 7 for the default, not counting the newlines). However, they can be any thickness.
