MAIN
DEFINE cb ui.Combobox
DEFINE tf ui.TextArea
DEFINE f1, f2 STRING
OPEN WINDOW w WITH FORM "3284/3284_combo_readonly" ATTRIBUTE(BORDER)
LET  cb = ui.Combobox.Forname("f1")
LET tf = ui.TextArea.Forname("f2")
  	INPUT BY NAME f1,f2 WITHOUT DEFAULTS
  		ON ACTION "set_readonly"
  			 CALL cb.SetReadOnly(TRUE)
  			 CALL tf.SetReadOnly(TRUE)
  	    ON ACTION "unset_readonly"
  			 CALL cb.SetReadOnly(FALSE)
  			 CALL tf.SetReadOnly(FALSE)
    END INPUT 
END MAIN