MAIN
 DEFINE b1,b2 ui.BlobViewer
 DEFINE f1,f2 BYTE

	OPTIONS INPUT WRAP    
	OPEN WINDOW w1 WITH FORM "blobviewer_11_getUploadInfo" ATTRIBUTE(BORDER)
	LOCATE f1 IN FILE "dog.jpg"
	LOCATE f2 IN FILE "cat.jpg"
	
	LET b1 = ui.BlobViewer.ForName('f1')
	LET b2 = ui.BlobViewer.ForName('f2')
	
	INPUT BY NAME f1,f2 WITHOUT DEFAULTS
		ON ACTION "get_file_data"
			DISPLAY b1.getUploadInfo()
			DISPLAY b2.getUploadInfo()
		ON CHANGE f1 DISPLAY b1.getUploadInfo()
		ON CHANGE f2 DISPLAY b2.getUploadInfo()
	END INPUT
END MAIN