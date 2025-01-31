MAIN
	IF arg_val(1)="i4gl" THEN CALL fgl_putenv("QX_COMPAT=Informix4GL") END IF
	
	OPEN WINDOW w1 WITH FORM "7252/7252_center_attr_coord" ATTRIBUTE(style="center")
	CALL fgl_getkey()
	OPEN WINDOW w2 WITH FORM "7252/7252_center_attr_coord" ATTRIBUTE(BORDER,style="center")
	CALL fgl_getkey()
	OPEN WINDOW w3 WITH FORM "7252/7252_center_attr_grid" ATTRIBUTE(style="center")
	CALL fgl_getkey()
	OPEN WINDOW w4 WITH FORM "7252/7252_center_attr_grid" ATTRIBUTE(BORDER,style="center")
	CALL fgl_getkey()
END MAIN