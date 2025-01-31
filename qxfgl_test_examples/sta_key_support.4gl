
#Module Variables
DEFINE myRec 
	RECORD 
		f1,f2,f3,f4,f5,f6,f7,f8,f9,f10 STRING
	END RECORD

DEFINE fInfo STRING


######################################################
# MAIN
#
#
######################################################
MAIN
	DEFER INTERRUPT
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	CALL initData()
	OPEN WINDOW wKeyEvents WITH FORM "form/sta_key_support"

	DISPLAY BY NAME fInfo
	DISPLAY BY NAME myRec.*

	
	MENU
		ON ACTION "INPUT"
			CALL input_key_events()
		ON ACTION "MENU"
			CALL menu_command_key()
		#ON ACTION "Action"  #by Victor O.
		#	CALL menu_action_names_for_keys()						
		ON ACTION "Exit"
			EXIT MENU
	END MENU


END MAIN


######################################################
# FUNCTION key_display(prog_key)
#
#
######################################################
FUNCTION key_display(prog_key)
	DEFINE prog_key STRING
	DISPLAY prog_key TO prog_key
	DISPLAY fgl_lastkey() TO fgl_lastkey
	DISPLAY fgl_keyval(fgl_keyname(fgl_lastkey())) TO fgl_keyval
	DISPLAY fgl_keyname(fgl_lastkey()) TO fgl_keyname
END FUNCTION


######################################################
# FUNCTION input_key_events()
#
#
######################################################
FUNCTION input_key_events()


	INPUT BY NAME myRec.* WITHOUT DEFAULTS
#reserved Key names
		ON KEY ("INTERRUPT")
			CALL key_display("INTERRUPT")		
			EXIT INPUT 
			
		ON KEY ("UP")
			CALL key_display("UP")
		ON KEY ("DOWN")
			CALL key_display("DOWN")
		ON KEY ("LEFT")
			CALL key_display("LEFT")
		ON KEY ("RIGHT")
			CALL key_display("RIGHT")
		ON KEY ("PREVIOUS")
			CALL key_display("PREVIOUS")
#		ON KEY ("pageup")--page up
#			CALL key_display("pageup") 
		ON KEY ("NEXT")--page down
			CALL key_display("NEXT") 
		ON KEY ("RETURN")  --RETURN=ENTER
			CALL key_display("RETURN")
			
		ON KEY ("ESC")	--ESC or ESCAPE
			CALL key_display("ESC")	
		ON KEY ("TAB")
			CALL key_display("TAB")
		ON KEY ("Shift-TAB")
			CALL key_display("Shift-TAB")
			
		ON KEY ("insert")
			CALL key_display("insert")
		ON KEY ("home")
			CALL key_display("home")
		ON KEY ("end")
			CALL key_display("end")
#		ON KEY ("tilde")
#			CALL key_display("tilde")
#		ON KEY ("capital")
#			CALL key_display("capital")
		ON KEY ("space")
			CALL key_display("space")
#		ON KEY ("back")
#			CALL key_display("back")
		ON KEY ("delete")
			CALL key_display("delete")
#		ON KEY ("clear")
#			CALL key_display("clear")
	
#Key F1-F36	
		ON KEY ("F1")
			CALL key_display("f1")
		ON KEY ("F2")
			CALL key_display("f2")
		ON KEY ("F3")
			CALL key_display("f3")
		ON KEY ("F4")
			CALL key_display("f4")
		ON KEY ("F5")
			CALL key_display("f5")
		ON KEY ("F6")
			CALL key_display("f6")
		ON KEY ("F7")
			CALL key_display("f7")
		ON KEY ("F8")
			CALL key_display("f8")
		ON KEY ("F9")
			CALL key_display("f9")
		ON KEY ("F10")
			CALL key_display("f10")
		ON KEY ("F11")
			CALL key_display("f11")
		ON KEY ("F12")
			CALL key_display("f12")
		ON KEY ("F13")
			CALL key_display("f13")
		ON KEY ("F14")
			CALL key_display("f14")
		ON KEY ("F15")
			CALL key_display("f15")
		ON KEY ("F16")
			CALL key_display("f16")
		ON KEY ("F17")
			CALL key_display("f17")
		ON KEY ("F18")
			CALL key_display("f18")
		ON KEY ("F19")
			CALL key_display("f19")
		ON KEY ("F20")
			CALL key_display("f20")
		ON KEY ("F21")
			CALL key_display("f21")
		ON KEY ("F22")
			CALL key_display("f22")
		ON KEY ("F23")
			CALL key_display("f23")
		ON KEY ("F24")
			CALL key_display("f24")
		ON KEY ("F25")
			CALL key_display("f25")
		ON KEY ("F26")
			CALL key_display("f26")
		ON KEY ("F27")
			CALL key_display("f27")
		ON KEY ("F28")
			CALL key_display("f28")
		ON KEY ("F29")
			CALL key_display("f29")
		ON KEY ("F30")
			CALL key_display("f30")
		ON KEY ("F31")
			CALL key_display("f31")
		ON KEY ("F32")
			CALL key_display("f32")
		ON KEY ("F33")
			CALL key_display("f33")
		ON KEY ("F34")
			CALL key_display("f34")
		ON KEY ("F35")
			CALL key_display("f35")
		ON KEY ("F36")
			CALL key_display("f36")

		ON KEY ("a")
			CALL key_display("a")
		ON KEY ("b")
			CALL key_display("b")
		ON KEY ("c")
			CALL key_display("c")
		ON KEY ("d")
			CALL key_display("d")
		ON KEY ("e")
			CALL key_display("e")
		ON KEY ("f")
			CALL key_display("f")
		ON KEY ("g")
			CALL key_display("g")
		ON KEY ("h")
			CALL key_display("h")
		ON KEY ("i")
			CALL key_display("i")
		ON KEY ("j")
			CALL key_display("j")
		ON KEY ("k")
			CALL key_display("k")
		ON KEY ("l")
			CALL key_display("l")
		ON KEY ("m")
			CALL key_display("m")
		ON KEY ("n")
			CALL key_display("n")
		ON KEY ("o")
			CALL key_display("o")
		ON KEY ("p")
			CALL key_display("p")
		ON KEY ("q")
			CALL key_display("q")
		ON KEY ("r")
			CALL key_display("r")
		ON KEY ("s")
			CALL key_display("s")
		ON KEY ("t")
			CALL key_display("t")
		ON KEY ("u")
			CALL key_display("u")
		ON KEY ("v")
			CALL key_display("v")
		ON KEY ("w")
			CALL key_display("w")
		ON KEY ("x")
			CALL key_display("x")
		ON KEY ("y")
			CALL key_display("y")
		ON KEY ("z")
			CALL key_display("z")

		ON KEY ("SHIFT-A")
			CALL key_display("SHIFT-A")
		ON KEY ("SHIFT-B")
			CALL key_display("SHIFT-B")
		ON KEY ("SHIFT-C")
			CALL key_display("SHIFT-C")
		ON KEY ("SHIFT-D")
			CALL key_display("SHIFT-D")
		ON KEY ("SHIFT-E")
			CALL key_display("SHIFT-E")
		ON KEY ("SHIFT-F")
			CALL key_display("SHIFT-F")
		ON KEY ("SHIFT-G")
			CALL key_display("SHIFT-G")
		ON KEY ("SHIFT-H")
			CALL key_display("SHIFT-H")
		ON KEY ("SHIFT-I")
			CALL key_display("SHIFT-I")
		ON KEY ("SHIFT-J")
			CALL key_display("SHIFT-J")
		ON KEY ("SHIFT-K")
			CALL key_display("SHIFT-K")
		ON KEY ("SHIFT-L")
			CALL key_display("SHIFT-L")
		ON KEY ("SHIFT-M")
			CALL key_display("SHIFT-M")
		ON KEY ("SHIFT-N")
			CALL key_display("SHIFT-N")
		ON KEY ("SHIFT-O")
			CALL key_display("SHIFT-O")
		ON KEY ("SHIFT-P")
			CALL key_display("SHIFT-P")
		ON KEY ("SHIFT-Q")
			CALL key_display("SHIFT-Q")
		ON KEY ("SHIFT-R")
			CALL key_display("SHIFT-R")
		ON KEY ("SHIFT-S")
			CALL key_display("SHIFT-S")
		ON KEY ("SHIFT-T")
			CALL key_display("SHIFT-T")
		ON KEY ("SHIFT-U")
			CALL key_display("SHIFT-U")
		ON KEY ("SHIFT-V")
			CALL key_display("SHIFT-V")
		ON KEY ("SHIFT-W")
			CALL key_display("SHIFT-W")
		ON KEY ("SHIFT-X")
			CALL key_display("SHIFT-X")
		ON KEY ("SHIFT-Y")
			CALL key_display("SHIFT-Y")
		ON KEY ("SHIFT-Z")
			CALL key_display("SHIFT-Z")

		ON KEY ("CONTROL-a")
			CALL key_display("CONTROL-a")
		ON KEY ("CONTROL-b")
			CALL key_display("CONTROL-b")
		ON KEY ("CONTROL-c")
			CALL key_display("CONTROL-c")
		ON KEY ("CONTROL-d")
			CALL key_display("CONTROL-d")
		ON KEY ("CONTROL-e")
			CALL key_display("CONTROL-e")
		ON KEY ("CONTROL-f")
			CALL key_display("CONTROL-f")
		ON KEY ("CONTROL-g")
			CALL key_display("CONTROL-g")
		ON KEY ("CONTROL-h")
			CALL key_display("CONTROL-h")
--duplicate of TAB
--		ON KEY ("CONTROL-i")
--			CALL key_display("CONTROL-i")
		ON KEY ("CONTROL-j")
			CALL key_display("CONTROL-j")
		ON KEY ("CONTROL-k")
			CALL key_display("CONTROL-k")
		ON KEY ("CONTROL-l")
			CALL key_display("CONTROL-l")
--Duplicate of RETURN
--		ON KEY ("CONTROL-m")
--			CALL key_display("CONTROL-m")
		ON KEY ("CONTROL-n")
			CALL key_display("CONTROL-n")
		ON KEY ("CONTROL-o")
			CALL key_display("CONTROL-o")
		ON KEY ("CONTROL-p")
			CALL key_display("CONTROL-p")
		ON KEY ("CONTROL-q")
			CALL key_display("CONTROL-q")
		ON KEY ("CONTROL-r")
			CALL key_display("CONTROL-r")
		ON KEY ("CONTROL-s")
			CALL key_display("CONTROL-s")
		ON KEY ("CONTROL-t")
			CALL key_display("CONTROL-t")
		ON KEY ("CONTROL-u")
			CALL key_display("CONTROL-u")
		ON KEY ("CONTROL-v")
			CALL key_display("CONTROL-v")
		ON KEY ("CONTROL-w")
			CALL key_display("CONTROL-w")
		ON KEY ("CONTROL-x")
			CALL key_display("CONTROL-x")
		ON KEY ("CONTROL-y")
			CALL key_display("CONTROL-y")
		ON KEY ("CONTROL-z")
			CALL key_display("CONTROL-z")


		ON KEY ("ALT-a")
			CALL key_display("ALT-a")
		ON KEY ("ALT-b")
			CALL key_display("ALT-b")
		ON KEY ("ALT-c")
			CALL key_display("ALT-c")
		ON KEY ("ALT-d")
			CALL key_display("ALT-d")
		ON KEY ("ALT-e")
			CALL key_display("ALT-e")
		ON KEY ("ALT-f")
			CALL key_display("ALT-f")
		ON KEY ("ALT-g")
			CALL key_display("ALT-g")
		ON KEY ("ALT-h")
			CALL key_display("ALT-h")
		ON KEY ("ALT-i")
			CALL key_display("ALT-i")
		ON KEY ("ALT-j")
			CALL key_display("ALT-j")
		ON KEY ("ALT-k")
			CALL key_display("ALT-k")
		ON KEY ("ALT-l")
			CALL key_display("ALT-l")
		ON KEY ("ALT-m")
			CALL key_display("ALT-m")
		ON KEY ("ALT-n")
			CALL key_display("ALT-n")
		ON KEY ("ALT-o")
			CALL key_display("ALT-o")
		ON KEY ("ALT-p")
			CALL key_display("ALT-p")
		ON KEY ("ALT-q")
			CALL key_display("ALT-q")
		ON KEY ("ALT-r")
			CALL key_display("ALT-r")
		ON KEY ("ALT-s")
			CALL key_display("ALT-s")
		ON KEY ("ALT-t")
			CALL key_display("ALT-t")
		ON KEY ("ALT-u")
			CALL key_display("ALT-u")
		ON KEY ("ALT-v")
			CALL key_display("ALT-v")
		ON KEY ("ALT-w")
			CALL key_display("ALT-w")
		ON KEY ("ALT-x")
			CALL key_display("ALT-x")
		ON KEY ("ALT-y")
			CALL key_display("ALT-y")
		ON KEY ("ALT-z")
			CALL key_display("ALT-z")


		ON KEY ("1")
			CALL key_display("1")
		ON KEY ("2")
			CALL key_display("2")
		ON KEY ("3")
			CALL key_display("3")
		ON KEY ("4")
			CALL key_display("4")
		ON KEY ("5")
			CALL key_display("5")
		ON KEY ("6")
			CALL key_display("6")
		ON KEY ("7")
			CALL key_display("7")
		ON KEY ("8")
			CALL key_display("8")
		ON KEY ("9")
			CALL key_display("9")
		ON KEY ("0")
			CALL key_display("0")
		ON KEY ("+")
			CALL key_display("+")
		ON KEY ("-")
			CALL key_display("-")

	END INPUT


END FUNCTION
---------------------------

######################################################
# FUNCTION menu_command_key()
#
#
######################################################
FUNCTION menu_command_key()

	MENU "menu"
#reserved Key names
		COMMAND KEY ("INTERRUPT")
			CALL key_display("INTERRUPT")		
			EXIT MENU
			
		COMMAND KEY ("UP")
			CALL key_display("UP")
		COMMAND KEY ("DOWN")
			CALL key_display("DOWN")
		COMMAND KEY ("LEFT")
			CALL key_display("LEFT")
		COMMAND KEY ("RIGHT")
			CALL key_display("RIGHT")
		COMMAND KEY ("PREVIOUS")
			CALL key_display("PREVIOUS")
#		COMMAND KEY ("pageup")--page up
#			CALL key_display("pageup") 
		COMMAND KEY ("NEXT")--page down
			CALL key_display("NEXT") 
		COMMAND KEY ("RETURN")  --RETURN=ENTER
			CALL key_display("RETURN")
			
		COMMAND KEY ("ESC")	--ESC or ESCAPE
			CALL key_display("ESC")	
		COMMAND KEY ("TAB")
			CALL key_display("TAB")
		COMMAND KEY ("Shift-TAB")
			CALL key_display("Shift-TAB")
			
#		COMMAND KEY ("QUIT")
#			CALL key_display("QUIT")
		COMMAND KEY ("TAB")
			CALL key_display("TAB")

#		COMMAND KEY ("scroll")
#			CALL key_display("scroll")
		COMMAND KEY ("interrupt")
			CALL key_display("interrupt")
		COMMAND KEY ("insert")
			CALL key_display("insert")
		COMMAND KEY ("home")
			CALL key_display("home")
		COMMAND KEY ("end")
			CALL key_display("end")
#		COMMAND KEY ("tilde")
#			CALL key_display("tilde")
#		COMMAND KEY ("capital")
#			CALL key_display("capital")
		COMMAND KEY ("space")
			CALL key_display("space")
#		COMMAND KEY ("back")
#			CALL key_display("back")
		COMMAND KEY ("delete")
			CALL key_display("delete")
#		COMMAND KEY ("clear")
#			CALL key_display("clear")
	
#Key F1-F36	
		COMMAND KEY ("F1")
			CALL key_display("f1")
		COMMAND KEY ("F2")
			CALL key_display("f2")
		COMMAND KEY ("F3")
			CALL key_display("f3")
		COMMAND KEY ("F4")
			CALL key_display("f4")
		COMMAND KEY ("F5")
			CALL key_display("f5")
		COMMAND KEY ("F6")
			CALL key_display("f6")
		COMMAND KEY ("F7")
			CALL key_display("f7")
		COMMAND KEY ("F8")
			CALL key_display("f8")
		COMMAND KEY ("F9")
			CALL key_display("f9")
		COMMAND KEY ("F10")
			CALL key_display("f10")
		COMMAND KEY ("F11")
			CALL key_display("f11")
		COMMAND KEY ("F12")
			CALL key_display("f12")
		COMMAND KEY ("F13")
			CALL key_display("f13")
		COMMAND KEY ("F14")
			CALL key_display("f14")
		COMMAND KEY ("F15")
			CALL key_display("f15")
		COMMAND KEY ("F16")
			CALL key_display("f16")
		COMMAND KEY ("F17")
			CALL key_display("f17")
		COMMAND KEY ("F18")
			CALL key_display("f18")
		COMMAND KEY ("F19")
			CALL key_display("f19")
		COMMAND KEY ("F20")
			CALL key_display("f20")
		COMMAND KEY ("F21")
			CALL key_display("f21")
		COMMAND KEY ("F22")
			CALL key_display("f22")
		COMMAND KEY ("F23")
			CALL key_display("f23")
		COMMAND KEY ("F24")
			CALL key_display("f24")
		COMMAND KEY ("F25")
			CALL key_display("f25")
		COMMAND KEY ("F26")
			CALL key_display("f26")
		COMMAND KEY ("F27")
			CALL key_display("f27")
		COMMAND KEY ("F28")
			CALL key_display("f28")
		COMMAND KEY ("F29")
			CALL key_display("f29")
		COMMAND KEY ("F30")
			CALL key_display("f30")
		COMMAND KEY ("F31")
			CALL key_display("f31")
		COMMAND KEY ("F32")
			CALL key_display("f32")
		COMMAND KEY ("F33")
			CALL key_display("f33")
		COMMAND KEY ("F34")
			CALL key_display("f34")
		COMMAND KEY ("F35")
			CALL key_display("f35")
		COMMAND KEY ("F36")
			CALL key_display("f36")

		COMMAND KEY ("a")
			CALL key_display("a")
		COMMAND KEY ("b")
			CALL key_display("b")
		COMMAND KEY ("c")
			CALL key_display("c")
		COMMAND KEY ("d")
			CALL key_display("d")
		COMMAND KEY ("e")
			CALL key_display("e")
		COMMAND KEY ("f")
			CALL key_display("f")
		COMMAND KEY ("g")
			CALL key_display("g")
		COMMAND KEY ("h")
			CALL key_display("h")
		COMMAND KEY ("i")
			CALL key_display("i")
		COMMAND KEY ("j")
			CALL key_display("j")
		COMMAND KEY ("k")
			CALL key_display("k")
		COMMAND KEY ("l")
			CALL key_display("l")
		COMMAND KEY ("m")
			CALL key_display("m")
		COMMAND KEY ("n")
			CALL key_display("n")
		COMMAND KEY ("o")
			CALL key_display("o")
		COMMAND KEY ("p")
			CALL key_display("p")
		COMMAND KEY ("q")
			CALL key_display("q")
		COMMAND KEY ("r")
			CALL key_display("r")
		COMMAND KEY ("s")
			CALL key_display("s")
		COMMAND KEY ("t")
			CALL key_display("t")
		COMMAND KEY ("u")
			CALL key_display("u")
		COMMAND KEY ("v")
			CALL key_display("v")
		COMMAND KEY ("w")
			CALL key_display("w")
		COMMAND KEY ("x")
			CALL key_display("x")
		COMMAND KEY ("y")
			CALL key_display("y")
		COMMAND KEY ("z")
			CALL key_display("z")

		COMMAND KEY ("SHIFT-A")
			CALL key_display("SHIFT-A")
		COMMAND KEY ("SHIFT-B")
			CALL key_display("SHIFT-B")
		COMMAND KEY ("SHIFT-C")
			CALL key_display("SHIFT-C")
		COMMAND KEY ("SHIFT-D")
			CALL key_display("SHIFT-D")
		COMMAND KEY ("SHIFT-E")
			CALL key_display("SHIFT-E")
		COMMAND KEY ("SHIFT-F")
			CALL key_display("SHIFT-F")
		COMMAND KEY ("SHIFT-G")
			CALL key_display("SHIFT-G")
		COMMAND KEY ("SHIFT-H")
			CALL key_display("SHIFT-H")
		COMMAND KEY ("SHIFT-I")
			CALL key_display("SHIFT-I")
		COMMAND KEY ("SHIFT-J")
			CALL key_display("SHIFT-J")
		COMMAND KEY ("SHIFT-K")
			CALL key_display("SHIFT-K")
		COMMAND KEY ("SHIFT-L")
			CALL key_display("SHIFT-L")
		COMMAND KEY ("SHIFT-M")
			CALL key_display("SHIFT-M")
		COMMAND KEY ("SHIFT-N")
			CALL key_display("SHIFT-N")
		COMMAND KEY ("SHIFT-O")
			CALL key_display("SHIFT-O")
		COMMAND KEY ("SHIFT-P")
			CALL key_display("SHIFT-P")
		COMMAND KEY ("SHIFT-Q")
			CALL key_display("SHIFT-Q")
		COMMAND KEY ("SHIFT-R")
			CALL key_display("SHIFT-R")
		COMMAND KEY ("SHIFT-S")
			CALL key_display("SHIFT-S")
		COMMAND KEY ("SHIFT-T")
			CALL key_display("SHIFT-T")
		COMMAND KEY ("SHIFT-U")
			CALL key_display("SHIFT-U")
		COMMAND KEY ("SHIFT-V")
			CALL key_display("SHIFT-V")
		COMMAND KEY ("SHIFT-W")
			CALL key_display("SHIFT-W")
		COMMAND KEY ("SHIFT-X")
			CALL key_display("SHIFT-X")
		COMMAND KEY ("SHIFT-Y")
			CALL key_display("SHIFT-Y")
		COMMAND KEY ("SHIFT-Z")
			CALL key_display("SHIFT-Z")



		COMMAND KEY ("CAPITAL-a")
			CALL key_display("CAPITAL-a")
		COMMAND KEY ("CAPITAL-b")
			CALL key_display("CAPITAL-b")
		COMMAND KEY ("CAPITAL-c")
			CALL key_display("CAPITAL-c")
		COMMAND KEY ("CAPITAL-d")
			CALL key_display("CAPITAL-d")
		COMMAND KEY ("CAPITAL-e")
			CALL key_display("CAPITAL-e")
		COMMAND KEY ("CAPITAL-f")
			CALL key_display("CAPITAL-f")
		COMMAND KEY ("CAPITAL-g")
			CALL key_display("CAPITAL-g")
		COMMAND KEY ("CAPITAL-h")
			CALL key_display("CAPITAL-h")
		COMMAND KEY ("CAPITAL-i")
			CALL key_display("CAPITAL-i")
		COMMAND KEY ("CAPITAL-j")
			CALL key_display("CAPITAL-j")
		COMMAND KEY ("CAPITAL-k")
			CALL key_display("CAPITAL-k")
		COMMAND KEY ("CAPITAL-l")
			CALL key_display("CAPITAL-l")
		COMMAND KEY ("CAPITAL-m")
			CALL key_display("CAPITAL-m")
		COMMAND KEY ("CAPITAL-n")
			CALL key_display("CAPITAL-n")
		COMMAND KEY ("CAPITAL-o")
			CALL key_display("CAPITAL-o")
		COMMAND KEY ("CAPITAL-p")
			CALL key_display("CAPITAL-p")
		COMMAND KEY ("CAPITAL-q")
			CALL key_display("CAPITAL-q")
		COMMAND KEY ("CAPITAL-r")
			CALL key_display("CAPITAL-r")
		COMMAND KEY ("CAPITAL-s")
			CALL key_display("CAPITAL-s")
		COMMAND KEY ("CAPITAL-t")
			CALL key_display("CAPITAL-t")
		COMMAND KEY ("CAPITAL-u")
			CALL key_display("CAPITAL-u")
		COMMAND KEY ("CAPITAL-v")
			CALL key_display("CAPITAL-v")
		COMMAND KEY ("CAPITAL-w")
			CALL key_display("CAPITAL-w")
		COMMAND KEY ("CAPITAL-x")
			CALL key_display("CAPITAL-x")
		COMMAND KEY ("CAPITAL-y")
			CALL key_display("CAPITAL-y")
		COMMAND KEY ("CAPITAL-z")
			CALL key_display("CAPITAL-z")


		COMMAND KEY ("CONTROL-a")
			CALL key_display("CONTROL-a")
		COMMAND KEY ("CONTROL-b")
			CALL key_display("CONTROL-b")
		COMMAND KEY ("CONTROL-c")
			CALL key_display("CONTROL-c")
		COMMAND KEY ("CONTROL-d")
			CALL key_display("CONTROL-d")
		COMMAND KEY ("CONTROL-e")
			CALL key_display("CONTROL-e")
		COMMAND KEY ("CONTROL-f")
			CALL key_display("CONTROL-f")
		COMMAND KEY ("CONTROL-g")
			CALL key_display("CONTROL-g")
		COMMAND KEY ("CONTROL-h")
			CALL key_display("CONTROL-h")
		COMMAND KEY ("CONTROL-i")
			CALL key_display("CONTROL-i")
		COMMAND KEY ("CONTROL-j")
			CALL key_display("CONTROL-j")
		COMMAND KEY ("CONTROL-k")
			CALL key_display("CONTROL-k")
		COMMAND KEY ("CONTROL-l")
			CALL key_display("CONTROL-l")
		COMMAND KEY ("CONTROL-m")
			CALL key_display("CONTROL-m")
		COMMAND KEY ("CONTROL-n")
			CALL key_display("CONTROL-n")
		COMMAND KEY ("CONTROL-o")
			CALL key_display("CONTROL-o")
		COMMAND KEY ("CONTROL-p")
			CALL key_display("CONTROL-p")
		COMMAND KEY ("CONTROL-q")
			CALL key_display("CONTROL-q")
		COMMAND KEY ("CONTROL-r")
			CALL key_display("CONTROL-r")
		COMMAND KEY ("CONTROL-s")
			CALL key_display("CONTROL-s")
		COMMAND KEY ("CONTROL-t")
			CALL key_display("CONTROL-t")
		COMMAND KEY ("CONTROL-u")
			CALL key_display("CONTROL-u")
		COMMAND KEY ("CONTROL-v")
			CALL key_display("CONTROL-v")
		COMMAND KEY ("CONTROL-w")
			CALL key_display("CONTROL-w")
		COMMAND KEY ("CONTROL-x")
			CALL key_display("CONTROL-x")
		COMMAND KEY ("CONTROL-y")
			CALL key_display("CONTROL-y")
		COMMAND KEY ("CONTROL-z")
			CALL key_display("CONTROL-z")


		COMMAND KEY ("ALT-a")
			CALL key_display("ALT-a")
		COMMAND KEY ("ALT-b")
			CALL key_display("ALT-b")
		COMMAND KEY ("ALT-c")
			CALL key_display("ALT-c")
		COMMAND KEY ("ALT-d")
			CALL key_display("ALT-d")
		COMMAND KEY ("ALT-e")
			CALL key_display("ALT-e")
		COMMAND KEY ("ALT-f")
			CALL key_display("ALT-f")
		COMMAND KEY ("ALT-g")
			CALL key_display("ALT-g")
		COMMAND KEY ("ALT-h")
			CALL key_display("ALT-h")
		COMMAND KEY ("ALT-i")
			CALL key_display("ALT-i")
		COMMAND KEY ("ALT-j")
			CALL key_display("ALT-j")
		COMMAND KEY ("ALT-k")
			CALL key_display("ALT-k")
		COMMAND KEY ("ALT-l")
			CALL key_display("ALT-l")
		COMMAND KEY ("ALT-m")
			CALL key_display("ALT-m")
		COMMAND KEY ("ALT-n")
			CALL key_display("ALT-n")
		COMMAND KEY ("ALT-o")
			CALL key_display("ALT-o")
		COMMAND KEY ("ALT-p")
			CALL key_display("ALT-p")
		COMMAND KEY ("ALT-q")
			CALL key_display("ALT-q")
		COMMAND KEY ("ALT-r")
			CALL key_display("ALT-r")
		COMMAND KEY ("ALT-s")
			CALL key_display("ALT-s")
		COMMAND KEY ("ALT-t")
			CALL key_display("ALT-t")
		COMMAND KEY ("ALT-u")
			CALL key_display("ALT-u")
		COMMAND KEY ("ALT-v")
			CALL key_display("ALT-v")
		COMMAND KEY ("ALT-w")
			CALL key_display("ALT-w")
		COMMAND KEY ("ALT-x")
			CALL key_display("ALT-x")
		COMMAND KEY ("ALT-y")
			CALL key_display("ALT-y")
		COMMAND KEY ("ALT-z")
			CALL key_display("ALT-z")


		COMMAND KEY ("1")
			CALL key_display("1")
		COMMAND KEY ("2")
			CALL key_display("2")
		COMMAND KEY ("3")
			CALL key_display("3")
		COMMAND KEY ("4")
			CALL key_display("4")
		COMMAND KEY ("5")
			CALL key_display("5")
		COMMAND KEY ("6")
			CALL key_display("6")
		COMMAND KEY ("7")
			CALL key_display("7")
		COMMAND KEY ("8")
			CALL key_display("8")
		COMMAND KEY ("9")
			CALL key_display("9")
		COMMAND KEY ("0")
			CALL key_display("0")
		COMMAND KEY ("+")
			CALL key_display("+")
		COMMAND KEY ("-")
			CALL key_display("-")
			
						
	END MENU


END FUNCTION
{
-------------------------------------------------------------
#by Victor O.
FUNCTION menu_action_names_for_keys()
	MENU
		ON ACTION "f1"
			CALL key_display("f1")	
		ON ACTION "f2"
			CALL key_display("f2")	
		ON ACTION "f3"
			CALL key_display("f3")	
		ON ACTION "f4"
			CALL key_display("f4")	
		ON ACTION "f5"
			CALL key_display("f5")	
		ON ACTION "f6"
			CALL key_display("f6")	
		ON ACTION "f7"
			CALL key_display("f7")	
		ON ACTION "f8"
			CALL key_display("f8")	
		ON ACTION "f9"
			CALL key_display("f9")	
		ON ACTION "f10"
			CALL key_display("f10")	
		ON ACTION "f11"
			CALL key_display("f11")	
		ON ACTION "f12"
			CALL key_display("f12")
			
		ON ACTION "cf1"
			CALL key_display("cf1")	
		ON ACTION "cf2"
			CALL key_display("cf2")	
		ON ACTION "cf3"
			CALL key_display("cf3")	
		ON ACTION "cf4"
			CALL key_display("cf4")	
		ON ACTION "cf5"
			CALL key_display("cf5")	
		ON ACTION "cf6"
			CALL key_display("cf6")	
		ON ACTION "cf7"
			CALL key_display("cf7")	
		ON ACTION "cf8"
			CALL key_display("cf8")	
		ON ACTION "cf9"
			CALL key_display("cf9")	
		ON ACTION "cf10"
			CALL key_display("cf10")	
		ON ACTION "cf11"
			CALL key_display("cf11")	
		ON ACTION "cf12"
			CALL key_display("cf12")	

		ON ACTION "af1"
			CALL key_display("af1")	
		ON ACTION "af2"
			CALL key_display("af2")	
		ON ACTION "af3"
			CALL key_display("af3")	
		ON ACTION "af4"
			CALL key_display("af4")	
		ON ACTION "af5"
			CALL key_display("af5")	
		ON ACTION "af6"
			CALL key_display("af6")	
		ON ACTION "af7"
			CALL key_display("af7")	
		ON ACTION "af8"
			CALL key_display("af8")	
		ON ACTION "af9"
			CALL key_display("af9")	
		ON ACTION "af10"
			CALL key_display("af10")	
		ON ACTION "af11"
			CALL key_display("af11")	
		ON ACTION "af12"
			CALL key_display("af12")	

		ON ACTION "sf1"
			CALL key_display("sf1")	
		ON ACTION "sf2"
			CALL key_display("sf2")	
		ON ACTION "sf3"
			CALL key_display("sf3")	
		ON ACTION "sf4"
			CALL key_display("sf4")	
		ON ACTION "sf5"
			CALL key_display("sf5")	
		ON ACTION "sf6"
			CALL key_display("sf6")	
		ON ACTION "sf7"
			CALL key_display("sf7")	
		ON ACTION "sf8"
			CALL key_display("sf8")	
		ON ACTION "sf9"
			CALL key_display("sf9")	
		ON ACTION "sf10"
			CALL key_display("sf10")	
		ON ACTION "sf11"
			CALL key_display("sf11")	
		ON ACTION "sf12"
			CALL key_display("sf12")	

		ON ACTION "atab"
			CALL key_display("Alt+Tab")	
		ON ACTION "ctab"
			CALL key_display("Ctrl+Tab")	
		ON ACTION "stab"
			CALL key_display("Shift+Tab")	
		ON ACTION "aesc"
			CALL key_display("Alt+Esc")	
		ON ACTION "asp"
			CALL key_display("Alt+Space")	
		ON ACTION "apgup"
			CALL key_display("Alt+PgUp")	
		ON ACTION "apgdn"
			CALL key_display("Alt+PgDn")	

		ON ACTION "c1"
			CALL key_display("Ctrl+1")	
		ON ACTION "c2"
			CALL key_display("Ctrl+2")	
		ON ACTION "c3"
			CALL key_display("Ctrl+3")	
		ON ACTION "c4"
			CALL key_display("Ctrl+4")	
		ON ACTION "c5"
			CALL key_display("Ctrl+5")	
		ON ACTION "c6"
			CALL key_display("Ctrl+6")	
		ON ACTION "c7"
			CALL key_display("Ctrl+7")	
		ON ACTION "c8"
			CALL key_display("Ctrl+8")	
		ON ACTION "c9"
			CALL key_display("Ctrl+9")	
		ON ACTION "c0"
			CALL key_display("Ctrl+0")	

		ON ACTION "alt1"
			CALL key_display("Alt+1")	
		ON ACTION "alt2"
			CALL key_display("Alt+2")	
		ON ACTION "alt3"
			CALL key_display("Alt+3")	
		ON ACTION "alt4"
			CALL key_display("Alt+4")	
		ON ACTION "alt5"
			CALL key_display("Alt+5")	
		ON ACTION "alt6"
			CALL key_display("Alt+6")	
		ON ACTION "alt7"
			CALL key_display("Alt+7")	
		ON ACTION "alt8"
			CALL key_display("Alt+8")	
		ON ACTION "alt9"
			CALL key_display("Alt+9")	
		ON ACTION "alt0"
			CALL key_display("Alt+0")	

		ON ACTION "scdel"
			CALL key_display("Shift+Ctrl+Del")	

		ON ACTION "sesc"
			CALL key_display("Shift+Esc")	
		ON ACTION "salt"
			CALL key_display("Shift+Alt+T")	

		ON ACTION "ca"
			CALL key_display("Ctrl+a")	
		ON ACTION "cb"
			CALL key_display("Ctrl+b")	
		ON ACTION "cc"
			CALL key_display("Ctrl+c")	
		ON ACTION "cd"
			CALL key_display("Ctrl+d")	
		ON ACTION "ce"
			CALL key_display("Ctrl+e")	
		ON ACTION "cf"
			CALL key_display("Ctrl+f")	
		ON ACTION "cg"
			CALL key_display("Ctrl+g")	
		ON ACTION "ch"
			CALL key_display("Ctrl+h")	
		ON ACTION "ci"
			CALL key_display("Ctrl+i")	
		ON ACTION "cj"
			CALL key_display("Ctrl+j")	
		ON ACTION "ck"
			CALL key_display("Ctrl+k")	
		ON ACTION "cl"
			CALL key_display("Ctrl+l")	
		ON ACTION "cm"
			CALL key_display("Ctrl+m")	
		ON ACTION "cn"
			CALL key_display("Ctrl+n")	
		ON ACTION "co"
			CALL key_display("Ctrl+o")	
		ON ACTION "cp"
			CALL key_display("Ctrl+p")	
		ON ACTION "cq"
			CALL key_display("Ctrl+q")	
		ON ACTION "cr"
			CALL key_display("Ctrl+r")	
		ON ACTION "cs"
			CALL key_display("Ctrl+s")	
		ON ACTION "ct"
			CALL key_display("Ctrl+t")	
		ON ACTION "cu"
			CALL key_display("Ctrl+u")	
		ON ACTION "cv"
			CALL key_display("Ctrl+v")	
		ON ACTION "cw"
			CALL key_display("Ctrl+w")	
		ON ACTION "cx"
			CALL key_display("Ctrl+x")	
		ON ACTION "cy"
			CALL key_display("Ctrl+y")	
		ON ACTION "cz"
			CALL key_display("Ctrl+z")	

		ON ACTION "alta"
			CALL key_display("Alt+a")	
		ON ACTION "altb"
			CALL key_display("Alt+b")	
		ON ACTION "altc"
			CALL key_display("Alt+c")	
		ON ACTION "altd"
			CALL key_display("Alt+d")	
		ON ACTION "alte"
			CALL key_display("Alt+e")	
		ON ACTION "altf"
			CALL key_display("Alt+f")	
		ON ACTION "altg"
			CALL key_display("Alt+g")	
		ON ACTION "alth"
			CALL key_display("Alt+h")	
		ON ACTION "alti"
			CALL key_display("Alt+i")	
		ON ACTION "altj"
			CALL key_display("Alt+j")	
		ON ACTION "altk"
			CALL key_display("Alt+k")	
		ON ACTION "altl"
			CALL key_display("Alt+l")	
		ON ACTION "altm"
			CALL key_display("Alt+m")	
		ON ACTION "altn"
			CALL key_display("Alt+n")	
		ON ACTION "alto"
			CALL key_display("Alt+o")	
		ON ACTION "altp"
			CALL key_display("Alt+p")	
		ON ACTION "altq"
			CALL key_display("Alt+q")	
		ON ACTION "altr"
			CALL key_display("Alt+r")	
		ON ACTION "alts"
			CALL key_display("Alt+s")	
		ON ACTION "altt"
			CALL key_display("Alt+t")	
		ON ACTION "altu"
			CALL key_display("Alt+u")	
		ON ACTION "altv"
			CALL key_display("Alt+v")	
		ON ACTION "altw"
			CALL key_display("Alt+w")	
		ON ACTION "altx"
			CALL key_display("Alt+x")	
		ON ACTION "alty"
			CALL key_display("Alt+y")
		ON ACTION "altz"
			CALL key_display("Alt+z")	

		ON ACTION "Exit"
			EXIT MENU
	END MENU
END FUNCTION	
-------------------------------------------------------------
}

######################################################
# FUNCTION initData()
#
#
######################################################
FUNCTION initData()
	LET myRec.f1 = "AAAAAAAAAAAAAAA"
	LET myRec.f2 = "BBBBBBBBBBBBBBB"
	LET myRec.f3 = "CCCCCCCCCCCCCCC"
	LET myRec.f4 = "DDDDDDDDDDDDDDD"
	LET myRec.f5 = "EEEEEEEEEEEEEEE"
	LET myRec.f6 = "FFFFFFFFFFFFFFF"
	LET myRec.f7 = "GGGGGGGGGGGGGGG"
	LET myRec.f8 = "HHHHHHHHHHHHHHH"
	LET myRec.f9 = "IIIIIIIIIIIIIII"
	LET myRec.f10 = "JJJJJJJJJJJJJJJ"

	LET fInfo = 
		"This demo application can be used to test/see, which key events can be triggered via the keyboard without being captured/re-directed by the OS or client browser.",
		"\n",
		"\n",
		"After choosing INPUT or MENU from the toolbar, press any key(s) on your keyboard to see the result",
		"\n",
		"\n",
		"Windows shortcuts which cannot be reassigned",
		"\n",
		"Alt+Esc",
		"\n",
		"Alt+Tab",
		"\n",
		"Ctrl+Tab",
		"\n",
		"Alt+F4",
		"\n",
		"Ctrl+F4",
		"\n",
		"Alt+Spacebar (in Chrome,however, it triggers both handlers - OS and 4GL)",
		"\n\n",
		"Browser shortcuts which cannot be reassigned (tested in Chrome, FireFox, Edge)",
		"\n",
		"Ctrl+T",
		"\n",
		"Ctrl+N(works in Edge)",
		"\n",
		"Ctrl+R(works in Edge)",
		"\n",
		"Ctrl+W",
		"\n",
		"Alt+D(doesn't work in Edge)"
			
END FUNCTION