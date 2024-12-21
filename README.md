# foldsout - Script to Outsource Folders and Replace Them with Symbolic Links

## Overview

foldsout.sh is a Bash script designed to outsource the complete specific directory including its hierarchy and replace them with symbolic links. This process allows you to manage your files to freeing up space. The reason why I wrote it for myself, was that I wanted to export all my Blender renderings, for e.x. the film editing, and remain functional.
**Disclaimer:** The script is provided 'as-is' without warranty of any kind. Always create a backup before running this script.

## Parameters

- `srchdr`: Starting search directory for folders (currently set to Documents)
- `xclds`: A pipe-separated list of directory-names to exclude from the processing. If a path contains one of these names, the folder will be excluded.
- `fldrs`: A pipe-separated list of folder-names that will be outsource. Folders matching any of these patterns will be processed.
- `mnt`: Mounting point for external drives (currently set to /run/media/$USER)
- `drvs`: An array containing the possible names of drives where you want to store your outsource folders. The script checks if any of these drives are mounted and uses the first one found. If no drive is found, it will print an error message.
- `execute`: Enable or disable execution of the script (currently set to 0). When set to 1, the script will make changes to your system; when set to 0, the script will only show the commands that would be executed without making any changes.

## Requirements

- A Unix-based operating system (tested on Manjaro)
- Bash shell

## Installation

1. Save the script as `foldsout.sh`.
2. Grant execute permissions to the file: `chmod +x foldsout.sh`.
3. The Parameters must be customised to your requirements in advance!
4. Now you can run the script by typing `./foldsout.sh`.

## Notes

- The script provides a simple way to manage your directories by outsource the folders that are not needed frequently or take up a lot of space.
- Always make sure you have backed up any important data before running this script, as it will remove the source directories once they have been outsource and symlinked.
- If you want to modify the names of the folders to be excluded, outsource, or mount, simply edit the variables in the script accordingly.

## Author

[Oliver Lutz Haase](https://www.olh.de)
Please understand that I cannot answer questions due to time constraints.
