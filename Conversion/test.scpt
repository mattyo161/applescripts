-- https://www.macscripter.net/t/converting-from-alias-to-path-path-to-alias/49846/2
on open droppedItems
	-- Your code to process the dropped items goes here
	repeat with aDroppedItem in droppedItems
		set itemPath to POSIX file (POSIX path of aDroppedItem)
		tell application "Pages"
			activate
			open itemPath
			set currentDocument to front document

			-- Define the export path and filename
			set currentDocumentPath to file of currentDocument as string
			set newDocumentPath to file of currentDocument as string
			if newDocumentPath ends with ".pages" then
				set newDocumentPath to text 1 thru -7 of newDocumentPath & ".docx"
			end if
			export currentDocument to file newDocumentPath as Microsoft Word
			close currentDocument
		end tell
	end repeat
end open

