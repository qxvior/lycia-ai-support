MAIN
DEFINE cb ui.Combobox
DEFINE lb ui.Listbox
DEFINE i INT

OPEN WINDOW w WITH FORM "3865/3865_combobox_listbox_insert_item" ATTRIBUTE(BORDER)
LET cb = ui.Combobox.ForName("f1")
LET lb = ui.Listbox.ForName("f2")
CALL cb.AddItem("value1","text1",55)
CALL cb.AddItem("value2","text2",1)
CALL cb.AddItem("value3","text3")
CALL lb.AddItem("value1","text1",55)
CALL lb.AddItem("value2","text2",1)
CALL lb.AddItem("value3","text3")

DISPLAY "Combobox Items"
FOR i=1 TO cb.GetItemCount()
	DISPLAY "Item",trim(i)," ",trim(cb.GetItemName(i))," | ",trim(cb.GetItemText(i))
END FOR

DISPLAY "Listbox Items"
FOR i=1 TO lb.GetItemCount()
	DISPLAY "Item",trim(i)," ",trim(lb.GetItemName(i))," | ",trim(lb.GetItemText(i))
END FOR
CALL fgl_getkey()
END MAIN