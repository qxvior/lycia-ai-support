# Project: lyc1000
# Filename: 4686_combobox_is_not_init.4gl
# Created By: alch
# Creation Date: Dec 3, 2019

MAIN

DEFINE cmb ui.ComboBox
DEFINE i, n INTEGER

--OPEN WINDOW w WITH FORM "ui.ComboBox.AddItem_01_types" ATTRIBUTE(BORDER)
OPEN WINDOW w WITH FORM "4686/4686_combobox_is_not_init.fm2" ATTRIBUTE(BORDER)
LET cmb = ui.ComboBox.forName("f2")

MENU
  ON ACTION "add string"
    CALL cmb.AddItem("value", "string")
  ON ACTION "add integer"
    CALL cmb.AddItem(25, "integer")
  ON ACTION "add boolean"
    CALL cmb.AddItem(TRUE, "boolean")
  ON ACTION "view"
    DISPLAY "The whole number of options: ", trim(cmb.GetItemCount())
    LET n = cmb.GetItemCount()
    FOR i = 1 TO n
      DISPLAY "index: ", trim(i)
      DISPLAY "text: ", cmb.GetItemText(i)
      DISPLAY "value: ", cmb.GetItemName(i)
      DISPLAY ""
    END FOR
  ON ACTION "exit"
    EXIT MENU
END MENU

END MAIN