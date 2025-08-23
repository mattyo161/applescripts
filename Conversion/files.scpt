set fileName to "/Volumes/Seagate Slim Drive/Backup Folder Jul, 19 2018/My Resume.pages"
set posixPath to POSIX path of fileName
set posixFile to POSIX file (fileName)
set info to {fileName, posixPath, posixFile, quoted form of posixPath as string, posixFile as string}
