################################################################
#
#  Creates widget, that depends on data type
#
################################################################
FUNCTION CreateWidget(parent STRING, name STRING, type STRING) RETURNS ui.AbstractUiElement
    DEFINE spinner ui.Spinner

    CALL type.ToLowerCase()
    
    IF type.Substring(1,3) = "int" THEN
        LET spinner = ui.Spinner.Create(name, parent)  # Create TEXT FIELD in the column
        CALL spinner.SetStep(1)
        CALL spinner.SetMinValue(-2147483647)
        CALL spinner.SetMaxValue(2147483647)
        RETURN spinner
    END IF
    
    IF type.Substring(1,8) = "datetime" THEN
        RETURN ui.TimeEditField.Create(name, parent)  # Create TEXT FIELD in the column        
    END IF
    
    IF type.Substring(1,4) = "date" THEN
        RETURN ui.Calendar.Create(name, parent)  # Create TEXT FIELD in the column
    END IF
    
    RETURN ui.TextField.Create(name, parent)  # Create TEXT FIELD in the column
END FUNCTION