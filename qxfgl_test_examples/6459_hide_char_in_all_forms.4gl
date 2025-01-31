MAIN
 DEFINE f1 CHAR(12)
	DISPLAY "HIDE THIS:" AT 5,5
	CALL fgl_getkey()
	
	OPEN WINDOW w WITH FORM "6459/6459_hide_char_in_all_forms"
	LET f1="DO NOT HIDE:" 
	INPUT BY NAME f1 WITHOUT DEFAULTS 
END MAIN



FUNCTION OnLyciaAppInit()
  DEFINE lbl ui.Label
  CALL UiRegisterHook("OnsetText", "HookFunc", lbl.GetTypeCode())
END FUNCTION

FUNCTION HookFunc(el, v)
  DEFINE el  ui.AbstractUiElement
  DEFINE lbl ui.Label
  DEFINE v STRING
  
  LET lbl = el
  DISPLAY v
  DISPLAY lbl.getIdentifier()
  IF lbl IS NOT NULL AND v.GetLength()>0 THEN
    IF lbl.getIsDynamic() = FALSE then
      IF v[v.getLength()] = ":" THEN
        LET v = v.subString(1, v.getLength() - 1).trimRight()
      END IF
    END IF
  END IF
  
  RETURN v
END FUNCTION