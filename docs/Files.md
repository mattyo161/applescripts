# Files

Mac OS X is the merger of two worlds the legacy old Macintosh OS with its HFS+ file system and NeXT/Darwin/BSD Unix OS. As such there have been some issues that I have discovered with the way Applescript manages these two worlds.

## Paths & Files

There are two main pathing systems supported by Applescript on OS X:
1. Unix/POSIX paths in the `/Users/<name>/Documents/...` form with `/` separators
2. MacOS/HFS/Alias paths in the `Users:<name>:Documents:...` form with `:` separators

As such it is best practice not to include `/`, `:` in your file names, even though MacOS will support them things can get messy so it would be best to avoid it. I would also suggest avoiding the use of ` ` (spaces, tabs), `'"‘’“”` (quotes) in names as well.

### POSIX path

The `POSIX path of <file>` will take a path in either Unix/Apple form and make it a valid Unix path. You can also convert this path to a string using `as string`. Here is an example of taking a MacOS Path (`:` delimited) and converting to a Unix Path:

```Applescript
set fileName to "Seagate Slim Drive:Backup Folder Jul, 19 2018:My Resume.pages"
set posixPath to POSIX path of fileName
-- "/Volumes/Seagate Slim Drive/Backup Folder Jul, 19 2018/My Resume.pages"
set quotedPosixPath to quoted form of posixPath
-- "'/Volumes/Seagate Slim Drive/Backup Folder Jul, 19 2018/My Resume.pages'"
```

Note that the original filename was on an external disk `Seagate Slim Drive:` is converted to the `/Volumes/Seagate Slim Drive/` for the unix path as all external volumes are mounted under `/Volumes` by default. You will also note the use of the `quoted form of` prefix used to ensure there is proper escaping of all special characters like quotes, spaces, etc. Here is a more representative example:

```Applescript
set fileName to "Seagate Slim Drive:Backup Folder Jul, 19 2018:My 'Resume'.pages"
set posixPath to POSIX path of fileName
-- "/Volumes/Seagate Slim Drive/Backup Folder Jul, 19 2018/My 'Resume'.pages"
set quotedPosixPath to quoted form of posixPath
-- "'/Volumes/Seagate Slim Drive/Backup Folder Jul, 19 2018/My '\\''Resume'\\''.pages'"
```

Having properly quoted paths will be important should you plan to call any Unix commands in your scripts.

### POSIX file

The `POSIX file <path>` will take a path in either Unix/Apple form and convert it to a Mac OS File/Alias with the `:` path delimiter. Just like `POSIX path` you can convert this path to a string using `as string`. But it is important to note that most commands and use cases in Applscript when working with files you will want to use the file in this format, not as a string. It is certainly possible to convert back and forth and this can be very useful but when saving files, getting properties of a file from a scriptable application like `Finder` you will want to use pass the file in this format.

Here is an example of conversion similar taking the output of the example above:

```Applescript
set fileName to "/Volumes/Seagate Slim Drive/Backup Folder Jul, 19 2018/My Resume.pages"
set posixFile to POSIX file (fileName)
-- file "Seagate Slim Drive:Backup Folder Jul, 19 2018:My Resume.pages"
get posixFile as string
-- "Seagate Slim Drive:Backup Folder Jul, 19 2018:My Resume.pages"
```