main
IF arg_val(1) = "i4gl" THEN
CALL fgl_putenv("QX_COMPAT=Informix4gl")
END IF

	open window win1 at 2,3 with 22 rows, 76 columns  
    display " F5-Notes     F6-Employer     F7-Mailing     F8-Reference      F10-Policies " at 22, 1 attribute (blue, reverse)
    CALL fgl_getkey()
  --  clear window win2
    open window win2 at 8, 3 with 15 rows, 76 columns
    display " F1-New Policy       F8-Claims        F9-Accounts                           " at 16, 1 attribute (red, reverse)
CALL fgl_getkey()

end main
