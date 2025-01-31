MAIN
  DEFINE menuWaitChildEvent1,menuWaitChildEvent2 ui.BackgroundServerEventHandler
  DEFINE startmenu ui.MenuBar
  DEFINE menugroup ui.MenuGroup
  DEFINE menucommand DYNAMIC ARRAY OF ui.MenuCommand

  CALL ui.Interface.setType("container")
  CALL ui.Interface.setName("cont")
  CALL ui.Application.GetCurrent().setMenuType("Tree")
  CALL ui.Application.GetCurrent().SetClassNames(["tabbed_container"])
  CALL ui.Interface.LoadStartMenu("4237/4237_mdi_tab")


  LET menugroup = ui.MenuGroup.create("mg1")
  CALL menugroup.setText("menu group")
 
  LET menuWaitChildEvent1 = ui.BackgroundServerEventHandler.Create()
  CALL menuWaitChildEvent1.SetCallBackAction("start_app_1")
  CALL menuWaitChildEvent1.SetWaitChild(TRUE)
  LET menucommand[1] = ui.MenuCommand.create("mc1")
  CALL menucommand[1].setText("start_app_1")
  CALL menucommand[1].SetOninvoke(menuWaitChildEvent1) 


  LET menuWaitChildEvent2 = ui.BackgroundServerEventHandler.Create()
  CALL menuWaitChildEvent2.SetCallBackAction("start_app_2")
  CALL menuWaitChildEvent2.SetWaitChild(TRUE)
  LET menucommand[2] = ui.MenuCommand.create("mc2")
  CALL menucommand[2].setText("start_app_2")
  CALL menucommand[2].SetOninvoke(menuWaitChildEvent2)
 
  LET startmenu = ui.MenuBar.Forname("c1")
  CALL menugroup.setMenuItems(menucommand)
  CALL startmenu.setMenuItems([menugroup]) 

  MENU
  	ON ACTION "start_app_1"
  		RUN "4237_child_1" WITHOUT WAITING
	ON ACTION "start_app_2"
  		RUN "4237_child_2" WITHOUT WAITING
  	ON ACTION exit
  		EXIT MENU
  END MENU
END MAIN