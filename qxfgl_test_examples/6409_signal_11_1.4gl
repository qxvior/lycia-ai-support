GLOBALS "6409_signal_11_2.4gl" 
GLOBALS 
	DEFINE directory CHAR(60) 
END GLOBALS 

MAIN 
	select tabname INTO directory from systables where tabid=1
	
	DISPLAY "ok",directory
END MAIN 
