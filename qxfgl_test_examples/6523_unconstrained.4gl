  DEFINE t_contactRecord TYPE AS
    RECORD 
			contId 		INT,
			firstName	STRING,
			lastName	STRING,
			address1	STRING,
			address2	STRING,
			address3	STRING,
			city		STRING,
			postCode	STRING			
	   END RECORD


DEFINE	cntRecArr DYNAMIC ARRAY OF t_contactRecord
DEFINE    cntRec t_contactRecord
MAIN
    OPTIONS FIELD ORDER UNCONSTRAINED

	LET cntRecArr[1].*  = 1, "Mike","Johnson","3rd Floor","MegaBuilding","Cross Street 12","Chicago", "SO2 PX2" 
	LET cntRecArr[2].*  = 2, "John","Hust","Ghost Avenue","Black House","Other Street 64","Rome", "RO2 IX3"
   
   OPEN WINDOW wMain WITH FORM "6523/6523_unconstrained"

   DIALOG ATTRIBUTES (UNBUFFERED)
      DISPLAY ARRAY cntRecArr TO sArr.*
      END DISPLAY
      INPUT cntRec.* WITHOUT DEFAULTS FROM xRec.* 
      END INPUT
 		ON ACTION "Exit"
			EXIT DIALOG
	END DIALOG
   CLOSE WINDOW wMain
 END MAIN

