###############################################################################################
# Module Scope
###############################################################################################	
DEFINE tree DYNAMIC ARRAY OF RECORD
    name STRING,
    parentId STRING,
    id STRING
END RECORD


DEFINE glArrayId SMALLINT

#Table Customer	
DEFINE typeCustomer TYPE AS RECORD
	customerId INT,  #primary Key
	companyName string,
	resellerId INT #foreign key
	END RECORD

#Table Reseller	
DEFINE typeReseller TYPE AS RECORD
	resellerId INT,  #primary Key
	companyName string,
	distributorId INT #foreign key
	END RECORD

#Table Distributor
DEFINE typeDistributor TYPE AS RECORD
	distributorId INT,  #primary Key	
	companyName string,
	globDistributorId INT #foreign key
	END RECORD

#Table GlobalDistributor
DEFINE typeGlobalDistributor TYPE AS RECORD
	globDistributorId INT,  #primary Key
	companyName string
	END RECORD	
	
# To store the simulate database query return/result
DEFINE globalDistributor DYNAMIC ARRAY OF typeGlobalDistributor
DEFINE distributor DYNAMIC ARRAY OF typeDistributor
DEFINE reseller DYNAMIC ARRAY OF typeReseller
DEFINE customer DYNAMIC ARRAY OF typeCustomer



###############################################################################################
# MAIN
#
#
###############################################################################################	
MAIN
	DEFINE c INT
	DEFINE r INT
	DEFINE dnd ui.DragDrop

	CALL ui_init()
	CALL hideNavigation()

  OPEN WINDOW winTreeTable WITH FORM "form/cnt_tree_table"

  LET c = 0
  CALL FILL(4)
  DISPLAY ARRAY tree TO tree.* ATTRIBUTE(UNBUFFERED)

  BEFORE DISPLAY
    -- uncomment next row to enable multiple range selection
		CALL DIALOG.setSelectionMode("tree", 1)

#		CALL fgl_dialog_setkeylabel("Down","","{CONTEXT}/public/querix/icon/svg/12/ic_arrow_drop_down_blue_12px.svg",131,FALSE,"imageCollapsed")
#		CALL fgl_dialog_setkeylabel("Up","","{context}/public/querix/icon/svg/12/ic_arrow_drop_up_blue_12px.svg",132,FALSE,"imageExpanded")
#		CALL fgl_dialog_setkeylabel("Right","","{context}/public/querix/icon/svg/12/ic_arrow_drop_right_blue_12px.svg",133,FALSE,"imageLeaf")

		CALL fgl_dialog_setkeylabel("deleteNode","Delete Node","{CONTEXT}/public/querix/icon/svg/24/ic_delete_24px.svg",21,FALSE,"Action Event <deletenode>")
		CALL fgl_dialog_setkeylabel("insertNode","Insert Node","{CONTEXT}/public/querix/icon/svg/24/ic_add_24px.svg",22,FALSE,"Action Event <insertNode>")
		CALL fgl_dialog_setkeylabel("appendNode","Append Node","{CONTEXT}/public/querix/icon/svg/24/ic_add_circle_24px.svg",23,FALSE,"Action Event <appendNode>")


#		--if you want to see them.. just to show the 3 icons and their corresponding tree-properties
#		ON ACTION "Down"
#			CALL fgl_winmessage("Down","imageCollapsed=\"{context}/public/querix/icon/svg/12/ic_arrow_drop_down_blue_12px.svg\"","info")
#		ON ACTION "Up"
#			CALL fgl_winmessage("Up","imageExpanded=\"{context}/public/querix/icon/svg/12/ic_arrow_drop_up_blue_12px.svg\"","info")
#		ON ACTION "Right"
#			CALL fgl_winmessage("Right","imageLeaf=\"{context}/public/querix/icon/svg/12/ic_arrow_drop_right_blue_12px.svg\"","info")

    ON ACTION "deleteNode"
        LET r = arr_curr()
        CALL DIALOG.deleteNode("tree", r);

    ON ACTION "insertNode"
        LET r = arr_curr()
        IF r > 0 THEN
            CALL DIALOG.insertNode("tree", r);
            LET c = c + 1
            -- tree[r].parentId has been initialized in insertNode()
            LET tree[r].id = "c", c USING "<<<"
            LET tree[r].name = tree[r].id
        END IF

    ON ACTION "appendNode"
        LET c = c + 1
        LET r = arr_curr()
        LET r = DIALOG.appendNode("tree", r)
        -- tree[r].parentId has been initialized in appendNode()
        LET tree[r].id = "c", c USING "<<<"
        LET tree[r].name = tree[r].id

    ON DROP(dnd)
        CALL dnd.dropInternal()

    ON ACTION "HELP"
  		CALL onlineHelp("TreeTable",NULL)		
  		
    END DISPLAY

END MAIN




###############################################################################################
# FUNCTION FILL(max_level)
#
#
###############################################################################################	
FUNCTION FILL(max_level)
    DEFINE max_level, p INT
    CALL tree.clear()
    LET p = fill_tree(max_level, 1, 0, NULL)
END FUNCTION



###############################################################################################
# FUNCTION fill_tree(max_level, level, p, parentId)
#
#
###############################################################################################	
FUNCTION fill_tree(max_level, level, p, parentId)
    DEFINE max_level, level INT
    DEFINE p INT
    DEFINE i INT
    DEFINE id, parentId STRING
    DEFINE name STRING

    IF level < max_level THEN
        IF level == 1 THEN
            LET name = "Node "
        ELSE
            LET name = tree[p].name, "."
        END IF
    ELSE
        LET name = "Leaf "
    END IF
    
    FOR i = 1 TO level
        LET p = p + 1
        IF parentId IS NULL THEN
            LET id = i
        ELSE
            LET id = parentId || "." || i
        END IF
        
        LET tree[p].id = id
        LET tree[p].parentId = parentId
        LET tree[p].name = name || i
        
        IF level < max_level THEN
            LET p = fill_tree(max_level, level + 1, p, id)
        END IF
        
    END FOR
    
    RETURN p
END FUNCTION




###############################################################################################
# FUNCTION simulateGlobalDistributorQuery()
#
#
###############################################################################################	
FUNCTION simulateGlobalDistributorQuery()
# To store the simulate database query return/result
#DEFINE globalDistributor DYNAMIC ARRAY OF typeGlobalDistributor
#	globDistributorId INT,  #primary Key
#	companyName string

	LET globalDistributor[1].globDistributorId = 1
	LET globalDistributor[1].companyName = "Fruit in the Moon AG(Germany)"

	LET globalDistributor[2].globDistributorId = 2
	LET globalDistributor[2].companyName = "Best Fruits Plc(UK)"

	LET globalDistributor[3].globDistributorId = 3
	LET globalDistributor[3].companyName = "Mega Fruits Plc (USA)"

END FUNCTION




###############################################################################################
# FUNCTION simulateDistributorQuery_globDistributorId_1()
#
#
###############################################################################################	
FUNCTION simulateDistributorQuery_globDistributorId_1()
# To store the simulate database query return/result
# DEFINE distributor DYNAMIC ARRAY OF typeGlobalDistributor
#	distributorId INT,  #primary Key	
#	companyName string,
#	globDistributorId INT #foreign key

	LET distributor[1].distributorId = 1
	LET distributor[1].companyName = "Distributor DE-1"
	LET distributor[1].globDistributorId = 1
	
	LET distributor[2].distributorId = 2
	LET distributor[2].companyName = "Distributor DE-2"
	LET distributor[2].globDistributorId = 1
	
	LET distributor[3].distributorId = 3
	LET distributor[3].companyName = "Distributor DE-3"
	LET distributor[3].globDistributorId = 1
END FUNCTION



###############################################################################################
# FUNCTION createTreeTable()
#
#
###############################################################################################	
FUNCTION createTreeTable()
    #name STRING,
    #parentId STRING,
    #id STRING
    
	#FOR EACH globDist
	CALL tree.append(
		globalDistributor[1].globDistributorId,
		globalDistributor[1].companyName
	)
		
		#FOR EACH DISTRIBUTOR of this global distributor
		CALL tree.append(
			Distributor[1].distributorId,
			Distributor[1].companyName,
			Distributor[1].globDistributorId
			
		)

		#FOR EACH RESELLER of this distributor
		CALL tree.append(
			reseller[1].distributorId,
			reseller[1].companyName,
			reseller[1].distributorId
		)
		
		#FOR EACH CUSTOMER of this reseller
		CALL tree.append(
			customer[1].customerId,
			customer[1].companyName,
			customer[1].resellerId
		)


		
END FUNCTION