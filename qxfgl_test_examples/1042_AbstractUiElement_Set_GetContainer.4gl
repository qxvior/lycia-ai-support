MAIN
   DEFINE f1 ui.CheckBox
   DEFINE f2 ui.Textarea
   DEFINE gil ui.GridItemLocation
   DEFINE c0,c1,c2 ui.AbstractContainer 
   DEFINE ic ui.ItemsContainer
   
        OPEN WINDOW w WITH FORM "1042/1042_AbstractUiElement_Set_GetContainer" ATTRIBUTE (border)
        whenever any error stop
        
        LET c0 = ui.AbstractContainer.ForName("rootContainer") 
       
        LET f1 = ui.CheckBox.CREATE("f1")
		CALL f1.SetTitle("Checkbox Title")        
		LET gil.GridX=0
		LET gil.GridY=0
		LET gil.GridWidth=1
		LET gil.GridHeight=1
		CALL f1.SetGridItemLocation(gil)
		
		CALL f1.SetContainer(c0)
		LET f2 = ui.TextArea.ForName("f2")

		LET ic=c0
		CALL ic.SetItems([f1, f2])
        
		
		LET c1 = f1.GetContainer()
		LET c2 = f2.GetContainer()
		DISPLAY "Checkbox container-|",c1.GetIdentifier(),"|"
		DISPLAY "Textarea container-|",c2.GetIdentifier(),"|"
		CALL fgl_getkey()
END MAIN