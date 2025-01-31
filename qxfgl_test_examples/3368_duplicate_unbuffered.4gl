MAIN
DEFINE f1 record z char(20) end record

	DIALOG ATTRIBUTE(unbuffered)
		INPUT f1.z FROM table1.kk ATTRIBUTE(unbuffered)
		END INPUT
	END DIALOG
END MAIN