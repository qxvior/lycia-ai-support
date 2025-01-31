define l_opt_name01 STRING
define l_opt_desc01 char(40)

MAIN

IF arg_val(1) IS NOT NULL THEN 
	CALL fgl_setenv("QX_COMPAT", arg_val(1))
END IF	

open window www at 1,1 with 4 rows, 120 columns

MENU "REKLAMACIE"
	before menu
		   let l_opt_name01 = "Menu option4"
		   let l_opt_desc01 = "Vstup oddelenia riadenia kvality"
		hide option all
		show option "Menu option10"
		show option "Menu option1"
		show option "Menu option2"
		show option "Menu option7"
		show option "Menu option8"
		show option l_opt_name01
		show option "Menu option5"
		show option "Menu option9"
		show option "Menu option6"
		show option "Menu option3"
		show option "exit"

  COMMAND KEY("V") "Menu option1" "Vytvorenie reklamacneho podnetu"
  COMMAND KEY("P") "mEnu option2" "Oprava vytvorenia reklamacneho podnetu"
  COMMAND KEY("E") "Menu option3" "Riesenie evidovanej reklamcie odborom ekonom.cinnosti nakupu a predaja"
  COMMAND KEY("O") l_opt_name01 l_opt_desc01
	menu l_opt_name01
	   COMMAND KEY("R") "v_Rieseni" "Vyber reklamacnych podnetov v rieseni" 
	   COMMAND KEY("V") "Vsetky" "Vyber vsetkych reklamacnych podnetov" 
	   COMMAND KEY("N","F5") "Navrat" "Navrat do predoslej urovne menu" 
	   command key("F1")
	end menu

  COMMAND KEY("M") "Menu option5" "Obeh vratenho materialu v podniku" 
	menu "Vrateny_material"
	before menu
		hide option all
		show option "Navrat"
		show option "Prvotny_prijem"
		show option "Vsetok_v_obehu"
		show option "Na_mojom_oddeleni"
		show option "Na_mojom_oddeleni"
		COMMAND KEY("P") "Prvotny_prijem" "Prvotny prijem na sklade odbytu" 
		COMMAND KEY("M") "Na_mojom_oddeleni" "Material, ktory je prvy na mojom oddeleni" 
		COMMAND KEY("V") "Vsetok_v_obehu" "Prehad vsetkeho vratenho materialu na oddeleniach" 
		COMMAND KEY("N","F5") "Navrat" "Navrat do predoslej rovne menu"	exit menu
	end menu
  COMMAND KEY("W") "Menu option6" "Spatna vysledovatenost vo vyrobe"
   menu "VYSLEDOVATELNOS"
	before menu
			hide option "Prepojenie"
	command key("F") "Finalne_etikety" "Zadavanie dajov z finalnych etikiet"
	command key("P") "Prepojenie" "Prepojenie finalnych etikiet s oddelenm a chybou"
	command key("M") "Miesta+ludia" "Miesta chyb reklamacie a ludia na mieste"
	command key("O") "%" "Aktualizacia percentualneho podielu chyb na oddeleni"
	command key("N","F5") "Navrat"	exit menu
   end menu
  COMMAND KEY("Y") "Menu option7" "Statisticke a ine prehlady reklamcii"
  COMMAND KEY("L") "Menu option8" "Prehladavanie reklamacnych podnetov bez moznosti zmien"
  COMMAND KEY("C") "Menu option9" "Ciselniky pre pre potreby projektu"
     Menu "CISELNKY"
		command key("S") "Symptomy_chyb" "Ciselnk symptomov chyb - kodovnik chybnej produkcie"
		command key("P") "Sposoby_vysporiadania" "Ciselnik sposobov vysporiadania podnetu"
		command key("N","F5") "Navrat" "Navrat o urove nizsie"  exit menu
     end menu
  COMMAND KEY("K","F5") "Menu option10" "Ukonenie prace s programom" EXIT MENU

  ON ACTION "Exit"
  	EXIT MENU
    	
END MENU
END MAIN
