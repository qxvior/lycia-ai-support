MAIN
  CALL ui.Interface.setType("container")
  CALL ui.Interface.setName("cont")
  CALL ui.Interface.LoadStartMenu("4237/4237_mdi")
  MENU
  	ON ACTION "start_app_1"
  		RUN "4237_child_1" WITHOUT WAITING
	ON ACTION "start_app_2"
  		RUN "4237_child_2" WITHOUT WAITING
  	ON ACTION exit
  		EXIT MENU
  END MENU
END MAIN