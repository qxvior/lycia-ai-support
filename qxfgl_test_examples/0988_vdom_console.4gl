MAIN
DEFINE i INT
DEFINE color_arr DYNAMIC ARRAY OF STRING
LET color_arr[1] = "red"
LET color_arr[2] = "green"
LET color_arr[3] = "pink"
LET color_arr[4] = "yellow"
LET color_arr[5] = "brown"
CALL fgl_getkey()
DISPLAY "Default color with default size"
FOR i = 1 TO 5
 DISPLAY '<console-style>font-size:',i*10,'px; color: ',color_arr[i],';</console-style>'
 DISPLAY color_arr[i]," color with ",i*10,"size" 
END FOR
END MAIN