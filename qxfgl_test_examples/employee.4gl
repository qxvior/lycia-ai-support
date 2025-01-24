DATABASE stores

DEFINE p_employee RECORD LIKE emp.*

MAIN
    DEFER INTERRUPT

    OPTIONS 
	FORM LINE 7
    OPEN FORM employee FROM "employee"
    DISPLAY FORM employee 
	ATTRIBUTE(MAGENTA)
    CALL ring_menu()
    CALL fgl_drawbox(9,14,19,52)
    CALL fgl_drawbox(4,0,4,80)
    LET p_employee.empno = NULL
    MENU "EMPLOYEES"
	COMMAND "One-add" "Add a new employee to the database" HELP 201
	    CALL unring_menu()
	    CALL add_employee(FALSE)
	    call ring_menu ()
	COMMAND "Many-add" "Add several new employees to database" HELP 202
	    CALL unring_menu()
	    CALL add_employee(TRUE)
	    call ring_menu ()
	COMMAND "Find-employee" "Look up specific employee" HELP 203
	    call unring_menu ()
	    IF query_employee(23) THEN
		call ring_menu ()
		NEXT OPTION "Update-employee"
	    END IF
	    call ring_menu ()
	COMMAND "Update-employee" "Modify current employee information" HELP 204
	    CALL unring_menu()
	    CALL update_employee()
	    call ring_menu ()
    	    NEXT OPTION "Find-employee"
	COMMAND "Delete-employee" "Remove a employee from database" HELP 205
	    CALL unring_menu()
	    CALL delete_employee()
	    call ring_menu ()
    	    NEXT OPTION "Find-employee"
	COMMAND "Exit" "Return to MAIN Menu" HELP 206
	    CLEAR SCREEN
	    EXIT MENU
    END MENU
END MAIN




FUNCTION add_employee(repeat)
    DEFINE repeat INTEGER

    CALL clear_menu()
    MESSAGE "Press F1 or CTRL-F for field help; ",
	    "F2 or CTRL-Y to return to menu"
    IF repeat THEN
	WHILE input_employee()
	    ERROR "Employee data entered" ATTRIBUTE (GREEN)
	END WHILE
	CALL mess("Multiple insert completed - current screen values ignored", 23)
    ELSE
	IF input_employee() THEN
	    ERROR "Employee data entered" ATTRIBUTE (GREEN)
	ELSE
    	    CLEAR FORM
    	    LET p_employee.empno = NULL
            ERROR "Employee addition aborted" ATTRIBUTE (RED, REVERSE)
	END IF
    END IF
CLEAR FORM
END FUNCTION


FUNCTION input_employee()

begin work
    DISPLAY "Press ESC to enter new employee data" AT 1,1
    INPUT BY NAME p_employee.*
        AFTER FIELD deptno

    	    DISPLAY "Press ESC to enter new employee data", "" AT 1,1
	ON KEY (F1, CONTROL-F)
            CALL employee_help()
	ON KEY (F2, CONTROL-Y)
	    LET int_flag = TRUE
	    EXIT INPUT
    END INPUT
    IF int_flag THEN
	LET int_flag = FALSE
	RETURN(FALSE)
    END IF

    INSERT INTO emp VALUES (p_employee.*)
    LET p_employee.empno = SQLCA.SQLERRD[2]
    COMMIT WORK 
    DISPLAY BY NAME p_employee.* ATTRIBUTE(MAGENTA)
    RETURN(TRUE)
END FUNCTION


FUNCTION query_employee(mrow)
    DEFINE where_part CHAR(200),
           query_text CHAR(250),
           answer CHAR(1),
	   mrow, chosen, exist SMALLINT

    CLEAR FORM
    CALL clear_menu()

    MESSAGE "Enter criteria for selection"
    CONSTRUCT where_part ON emp.* FROM emp.*
    MESSAGE ""
    IF int_flag THEN
        LET int_flag = FALSE
	CLEAR FORM
        ERROR "Employee query aborted" ATTRIBUTE(RED, REVERSE)
	LET p_employee.empno = NULL
	RETURN (p_employee.empno)
    END IF
    LET query_text = "select * from emp where ", where_part CLIPPED,
			" order by ename"
    PREPARE statement_1 FROM query_text
    DECLARE employee_set SCROLL CURSOR FOR statement_1

    OPEN employee_set
    FETCH FIRST employee_set INTO p_employee.*
    IF status = NOTFOUND THEN
	LET exist = FALSE
    ELSE
        LET exist = TRUE
	DISPLAY BY NAME p_employee.* ATTRIBUTE(MAGENTA)
	MENU "BROWSE"
	    COMMAND "Next" "View the next employee in the list"
		FETCH NEXT employee_set INTO p_employee.*
		IF status = NOTFOUND THEN
		    ERROR "No more employee in this direction" ATTRIBUTE(RED, REVERSE)
		    FETCH LAST employee_set INTO p_employee.*
		END IF
		DISPLAY BY NAME p_employee.*  ATTRIBUTE(MAGENTA)
	    COMMAND "Previous" "View the previous employee in the list"
		FETCH PREVIOUS employee_set INTO p_employee.*
		IF status = NOTFOUND THEN
		    ERROR "No more employee in this direction" ATTRIBUTE(RED, REVERSE)
		    FETCH FIRST employee_set INTO p_employee.*
		END IF
		DISPLAY BY NAME p_employee.*  ATTRIBUTE(MAGENTA)
	    COMMAND "First" "View the first employee in the list"
		FETCH FIRST employee_set INTO p_employee.*
		DISPLAY BY NAME p_employee.*  ATTRIBUTE(MAGENTA)
	    COMMAND "Last" "View the last employee in the list"
		FETCH LAST employee_set INTO p_employee.*
		DISPLAY BY NAME p_employee.*  ATTRIBUTE(MAGENTA)
	    COMMAND "Select" "Exit BROWSE selecting the current employee"
		LET chosen = TRUE
		EXIT MENU
	    COMMAND "Quit" "Quit BROWSE without selecting a employee"
		LET chosen = FALSE
		EXIT MENU
	END MENU
    END IF
    CLOSE employee_set

    CALL clear_menu()
    IF NOT exist THEN
	CLEAR FORM
	CALL mess("No employee satisfies query", mrow)
        LET p_employee.empno = NULL
	RETURN (FALSE)
    END IF
    IF NOT chosen THEN
	CLEAR FORM
	LET p_employee.empno = NULL
	CALL mess("No selection made", mrow)
	RETURN (FALSE)
    END IF
    RETURN (TRUE)
END FUNCTION


FUNCTION update_employee()
   begin work

    CALL clear_menu()
    IF p_employee.empno IS NULL THEN
	ERROR "No employee has been selected; use the Find-employee option"
	    ATTRIBUTE (RED, REVERSE)
	RETURN
    END IF
    MESSAGE "Press F1 or CTRL-F for field-level help"
    DISPLAY "Press ESC to update employee data; DEL to abort" AT 1,1
    INPUT BY NAME p_employee.* WITHOUT DEFAULTS
	AFTER FIELD deptno
    	    DISPLAY "Press ESC to update employee data; DEL to abort", "" AT 1,1
	ON KEY (F1, CONTROL-F)
	    CALL employee_help()
        END INPUT
    IF NOT int_flag THEN
        UPDATE emp SET emp.* = p_employee.*
	    WHERE empno = p_employee.empno
    	COMMIT WORK 
        CALL mess("Employee data modified", 23)
    ELSE
	LET int_flag = FALSE
	SELECT * INTO p_employee.* FROM emp
	    WHERE empno = p_employee.empno
	DISPLAY BY NAME p_employee.* ATTRIBUTE(MAGENTA)
	ERROR "Employee update aborted" ATTRIBUTE (RED, REVERSE)
    END IF
END FUNCTION


FUNCTION delete_employee()
    DEFINE answer CHAR(1)

    begin work
    CALL clear_menu()
    IF p_employee.empno IS NULL THEN
	ERROR "No employee has been selected; use the Find-employee option"
	    ATTRIBUTE (RED, REVERSE)
	RETURN
    END IF

    PROMPT " Are you sure you want to delete this employee row? "
	FOR CHAR answer
    IF answer MATCHES "[yY]" THEN
	DELETE FROM emp 
	    WHERE empno = p_employee.empno
    	COMMIT WORK 
	CLEAR FORM
	CALL mess("Employee entry deleted", 23)
	LET p_employee.empno = NULL
    ELSE
	ERROR "Deletion aborted" ATTRIBUTE (RED, REVERSE)
    END IF
END FUNCTION


FUNCTION employee_help()
	ERROR "Sorrey no help available " ATTRIBUTE (RED, REVERSE)
	RETURN
END FUNCTION

FUNCTION ring_menu()
DISPLAY "---------------------------------------    ",
       "Type Control-w for MENU HELP    -----------" AT 4,2 ATTRIBUTE ( MAGENTA )
END FUNCTION

FUNCTION unring_menu()
DISPLAY "---------------------------------------    ",
       "                                -----------" AT 4,2 ATTRIBUTE ( MAGENTA )
END FUNCTION

FUNCTION clear_menu()
DISPLAY 80 SPACES AT 1,1
DISPLAY 80 SPACES AT 2,1
END FUNCTION

FUNCTION mess( str, mrow  )
DEFINE str CHAR( 80 ) ,
mrow SMALLINT

DISPLAY " ", str CLIPPED AT mrow, 1 ATTRIBUTE (  WHITE, BOLD )
SLEEP 3
DISPLAY 80 SPACES AT mrow,1
END FUNCTION 

