################################################################################
# Module Scope
################################################################################
DEFINE arr_rec_salesPerson DYNAMIC ARRAY OF 
	RECORD
		sales_person STRING,
		location STRING,
		age SMALLINT,
		employed_years SMALLINT,		
		ySalary money,
		yBonus money,
		yExpenses money,
		ysold money
	END RECORD


################################################################################
# MAIN
#
#
################################################################################ 
MAIN
	DEFINE i INT
	DEFINE l_currentLine SMALLINT
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT
	
	CALL ui_init()
	CALL initData()							#init master array with data  (also creates an array duplicate/casting just for demo purpose)

		
	OPEN WINDOW mywin WITH FORM "form/cnt_table_display_array_aggregate"
	CALL ui.Interface.setText("Aggregates")
	
		DISPLAY ARRAY arr_rec_salesPerson TO scSalesPerson.*
			BEFORE DISPLAY
				DISPLAY arr_count() TO arr_count
		
			BEFORE ROW
				DISPLAY arr_count() TO arr_count					

		ON ACTION "CANCEL"
			EXIT DISPLAY
			
    ON ACTION "HELP"
  		CALL onlineHelp(NULL,"TableAll")		
  		
		END DISPLAY

END MAIN


################################################################################
# FUNCTION initData()
#
#
################################################################################
FUNCTION initData()
DEFINE i int

	LET i = 1
	LET arr_rec_salesPerson[i].sales_person = "Josef Huber"
	LET arr_rec_salesPerson[i].location = "Munich"
	LET arr_rec_salesPerson[i].age = 52
	LET arr_rec_salesPerson[i].employed_years = 16
	LET arr_rec_salesPerson[i].ySalary = 145000
	LET arr_rec_salesPerson[i].yBonus = 36823.64
	LET arr_rec_salesPerson[i].yExpenses = 18912
	LET arr_rec_salesPerson[i].ysold = 1251986.22

	LET i = i+1
	LET arr_rec_salesPerson[i].sales_person = "Herbert Schmidt"
	LET arr_rec_salesPerson[i].location = "Hamburg"
	LET arr_rec_salesPerson[i].age = 34
	LET arr_rec_salesPerson[i].employed_years = 7
	LET arr_rec_salesPerson[i].ySalary = 85000
	LET arr_rec_salesPerson[i].yBonus = 18356.12
	LET arr_rec_salesPerson[i].yExpenses = 14842
	LET arr_rec_salesPerson[i].ysold = 532867
	LET i = i+1
	LET arr_rec_salesPerson[i].sales_person = "Klaus Märkl"
	LET arr_rec_salesPerson[i].location = "Berlin"
	LET arr_rec_salesPerson[i].age = 47
	LET arr_rec_salesPerson[i].employed_years = 2
	LET arr_rec_salesPerson[i].ySalary = 45800
	LET arr_rec_salesPerson[i].yBonus = 6367.28
	LET arr_rec_salesPerson[i].yExpenses = 12859	
	LET arr_rec_salesPerson[i].ysold = 28014.62
	LET i = i+1
	LET arr_rec_salesPerson[i].sales_person = "Andreas Kahn"
	LET arr_rec_salesPerson[i].location = "Stuttgart"
	LET arr_rec_salesPerson[i].age = 33
	LET arr_rec_salesPerson[i].employed_years = 9
	LET arr_rec_salesPerson[i].ySalary = 74000
	LET arr_rec_salesPerson[i].yBonus = 18250.64
	LET arr_rec_salesPerson[i].yExpenses = 6825	
	LET arr_rec_salesPerson[i].ysold = 753375.81
	LET i = i+1
	LET arr_rec_salesPerson[i].sales_person = "Lorenz Kuhn"
	LET arr_rec_salesPerson[i].location = "Frankfurt"
	LET arr_rec_salesPerson[i].age = 56
	LET arr_rec_salesPerson[i].employed_years = 11
	LET arr_rec_salesPerson[i].ySalary = 132000
	LET arr_rec_salesPerson[i].yBonus = 24623.33
	LET arr_rec_salesPerson[i].yExpenses = 21426	
	LET arr_rec_salesPerson[i].ysold = 692672.55
	LET i = i+1
	LET arr_rec_salesPerson[i].sales_person = "Ludwig Lex"
	LET arr_rec_salesPerson[i].location = "Bremen"
	LET arr_rec_salesPerson[i].age = 44
	LET arr_rec_salesPerson[i].employed_years = 14
	LET arr_rec_salesPerson[i].ySalary = 108000
	LET arr_rec_salesPerson[i].yBonus = 21581.51
	LET arr_rec_salesPerson[i].yExpenses = 25834	
	LET arr_rec_salesPerson[i].ysold = 937539.20

END FUNCTION

