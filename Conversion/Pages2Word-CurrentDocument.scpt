-- Convert the frontmost open Document in Pages to Word
tell application "Pages"
  activate
  set currentDocument to front document

  -- Define the export path and filename
  set currentDocumentPath to file of currentDocument as string
  set newDocumentPath to file of currentDocument as string
  if newDocumentPath ends with ".pages" then
    set newDocumentPath to text 1 thru -7 of newDocumentPath & ".docx"
  end if
  export currentDocument to file newDocumentPath as Microsoft Word
  -- additional conversion options (EPUB, Plain text, PDF, Microsoft Word, Pages 09, RTF)
  close currentDocument
end tell
