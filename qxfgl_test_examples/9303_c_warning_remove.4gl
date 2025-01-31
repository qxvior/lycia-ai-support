MAIN
  DEFINE c base.Channel
  DEFINE t TEXT
	LET c = base.Channel.create()
	CALL fgl_putenv("CFLAGS=-Wno-implicit-function-declaration")
	IF fgl_arch() = 'nt'THEN
		#be careful pathes are from autotest vmware machine
		--CALL c.openPipe('"C:/Program Files/Querix/Lycia/bin/qxcc.exe" -c -pic /DWINNT -64 -o C:/Users/user/git/test_cases/lyc1000/output/9303_lib.obj -i fglsys.h -i fglapi.h -i fgifunc.h C:/Users/user/git/test_cases/lyc1000/source/9303_lib.c 2>&1  ', "u")
		--sleep 1
		CALL c.openPipe('"C:/Program Files/Querix/Lycia/bin/qxcc.exe" -c -pic /DWINNT -64 -o  C:/qat/tests/test_cases/lyc1000/output/9303_lib.obj -i fglsys.h -i fglapi.h -i fgifunc.h C:/qat/tests/test_cases/lyc1000/source/9303_lib.c 2>9303.txt', "u")
		SLEEP 1
		LOCATE t IN FILE "9303.txt"
		DISPLAY t	
	ELSE 
		#be careful pathes are from autotest docker container 
  		CALL c.openPipe('"/opt/Querix/Lycia/bin/qxcc" -c -pic -64  -o "/qat/tests/test_cases/lyc1000/source/output/9303_lib.o" -I "/opt/Querix/Lycia/include" -i fglsys.h -i fglapi.h -i fgifunc.h "/qat/tests/test_cases/lyc1000/source/9303_lib.c" 2>&1 1>&1 &?', "u")
		WHILE TRUE 
			IF c.dataAvailable() THEN
				DISPLAY "message from child: ", c.readLine()
			ELSE
				DISPLAY "no output"
				EXIT WHILE
			END IF
		END WHILE
	END IF
	CALL fgl_getkey()
END MAIN