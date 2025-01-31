MAIN
CALL fgl_putenv("QX_COMPAT=Informix4GL")
CALL ui.Interface.setType("container")
CALL ui.Interface.loadStartMenu("6363/6363_mdi_menu_parent.fm2")
CALL ui.Application.GetCurrent().setMenuType("Tree")
CALL ui.Application.GetCurrent().SetClassNames(["tabbed_container"])


CALL fgl_setactionlabel("run","Run Child","qx://application/about.png",10,TRUE,"Run child")
  
  MENU
    ON ACTION "RUN"
      RUN "6364_child_1"
    ON ACTION "actClose"
      EXIT MENU
  END MENU
END MAIN