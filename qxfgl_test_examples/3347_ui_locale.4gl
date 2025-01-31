MAIN
DEFINE f1 CHAR(20)
DEFINE tf ui.TextField
DEFINE lc ui.Locale

OPEN WINDOW w WITH FORM "3347/3347_ui_locale" ATTRIBUTE(BORDER)
LET tf = ui.TextField.ForName("f1")
CALL tf.SetText("text")

  INPUT BY NAME f1
  	BEFORE INPUT
    CALL lc.SetDirection("zzz")
    CALL tf.SetLocale(lc)
   END INPUT


END MAIN