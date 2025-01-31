################################################################################
# Module Scope Variables
################################################################################
#None

################################################################################
# MAIN
#
#
################################################################################
MAIN
	DEFINE gridLength   ui.GridLength
	
	DEFINE grid,grid2 ui.GridPanel
	DEFINE btn1,btn2 ui.Button 
	DEFINE gridRowDef1, gridRowDef2   DYNAMIC ARRAY OF ui.GridRowDefinition
	DEFINE gridColDef1, gridColDef2   DYNAMIC ARRAY OF ui.GridColumnDefinition

    DEFINE gridRowDef ui.GridRowDefinition
    DEFINE gridColDef ui.GridColumnDefinition


	DEFINE rLocation ui.GridItemLocation
	DEFINE ArrayOfElementsForGrid2 dynamic array of ui.AbstractUIElement
    
	CALL ui_init()	
	OPEN WINDOW w1 WITH FORM "form/ui_create_elements_dynamically" ATTRIBUTE(BORDER)
 	LET grid = ui.GridPanel.ForName("rootContainer")
 	CALL grid.SetPreferredSize(["600px","600px"])
 	
 	
	#LET ALL OUR GridRowDefinition and GridColumnDefinition type will be AUTO
		LET gridLength.GridLengthValue=""
    #CALL gridLength.SetGridLengthType("Auto")  
    #CALL gridRowDef.SetGridLength(gridLength)
    #CALL gridColDef.SetGridLength(gridLength)
    #CREATE TWO GRID ROWS 
    CALL gridRowDef1.append(gridRowDef)
    CALL gridRowDef1.append(gridRowDef) 
 	CALL grid.SetGridRowDefinitions(gridRowDef1)
	
	#CREATE ONE GRID COLUMN
	CALL gridColDef1.append(gridColDef) 
 	CALL grid.SetGridColumnDefinitions(gridColDef1)

    #CREATE BUTTON IN ROOTCONTAINER CELL 0,0
	LET btn1 = ui.Button.Create("bt1","rootContainer")
    LET rLocation.GridHeight=1
    LET rLocation.GridWidth=1
    LET rLocation.GridX=0
    LET rLocation.GridY=0
    CALL btn1.SetGridItemLocation(rLocation)
	CALL btn1.SetPreferredSize(["150px","100px"])
	CALL btn1.SetText("Button1 created in the form's rootContainer")
	CALL btn1.SetEnable(True)

	#CREATE CHILD GRID CONTAINER IN ROOTCONTAINER
    LET grid2 = ui.GridPanel.Create("child_grid_id","rootContainer")
    #DEFINE LOCATION OF CHOILD GRID PANNEL IN ROOTCONTAINER GRIDPANNEL
    CALL grid2.SetGridItemLocation([0,1,1,1])  #here we define location by values passing only instead of rLocation record definition
    CALL grid2.SetPreferredSize(["200px","200px"])
    #ADD ONE ROW AND ONE COLUMN TO grid2
    CALL gridRowDef2.append(gridRowDef)
    CALL gridColDef2.append(gridColDef)
    CALL grid2.SetGridRowDefinitions(gridRowDef2)
    CALL grid2.SetGridColumnDefinitions(gridColDef2)
    
    
    #CREATE BUTTON AS SEPARATE WIDGET
	LET btn2 = ui.Button.Create("bt2")
	CALL btn2.SetGridItemLocation([0,0,1,1])
	CALL btn2.SetPreferredSize(["350px","200px"])
	CALL btn2.SetText("Botton2 created in the rootContainer's CHILD gridPanel")
	CALL btn2.SetEnable(True)
	#Just in case save all items from grid2 and then add our to existent items (grid2 doesn't have any items yet)
	LET ArrayOfElementsForGrid2 = grid2.GetItems()
	CALL ArrayOfElementsForGrid2.append(btn2) #add created button
    CALL grid2.SetItems(ArrayOfElementsForGrid2) #push all items back to grid
	#ADD BUTTON TO CHILD GRID VIA GRID METHOD
    CALL fgl_getkey()
END MAIN