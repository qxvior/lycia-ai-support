MAIN
  DEFINE f1, f2  STRING  
  OPEN WINDOW w WITH FORM "9966/9966_lowcode_sig_11"  
  INPUT BY NAME f1, f2 WITHOUT DEFAULTS
     ON ACTION "Check"
        CALL ui.Dialog.GetCurrent().Validate("f1")
        DISPLAY "OK"
  END INPUT
END MAIN