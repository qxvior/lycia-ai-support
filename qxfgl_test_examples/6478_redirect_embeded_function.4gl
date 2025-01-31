MAIN
  CALL fgl_drawbox(1,40,1,1)
  CALL fgl_getkey()
END MAIN

#
FUNCTION OnLyciaAppInit() #automatically called at the beginning of any main
  CALL RedirectFunction("fgl_drawbox", "HookFglDrawbox") #Function redirection
END FUNCTION


FUNCTION HookFglDrawbox()
  DISPLAY "Hooked fgl_drawbox"
END FUNCTION