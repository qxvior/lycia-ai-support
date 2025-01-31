################################################################################
# The functions below are donated by Roland Kruggel, Altena - Germany
#
# www.bbf7.de
#
# Please visit this website for licencing information before you re-use this code
################################################################################

# globals werden nicht benÃÂ¶tigt
#GLOBALS "../../src/k_globals.4gl"

{
	bbf7.de, roland kruggel

	Copyright (C) 2006-2007 bbf7.de, roland kruggel
	All rights reserved.

	Programm	-
	Modul		k_config 
	Part		-

	Datum		19.04.2007
	File		@(*) k_config.4gl


 Beschreibung
	Lesen und Schreiben von config files. Die Config-Files haben das standart-Format
	von config Files. 'option = wert'. Die Option und der Wert kann nummerisch, 
	alpha-nummerisch sein. Optionen und Werte sind case sensitive. Es kÃÂ¶nnen mehrere 
	'instanzen' erzeugt werden.
	
	Variablen
	In dem Wert kann auch eine Variable eingesetzt werden. Diese werden aus den 
	normalen zuweisungen entnommen. Die syntax ist 'option = %(var)'. Var wird in den 
	einzelnen Sectionen local definiert oder in der default section global definiert.
	
	section
	Der configfile kann in mehrere sectionen aufgeteilt werden. Sectionen werden mit
	Eckigen Klammern definiert. '[section_name]' Alle optionen beziehen sich
	nur auf diese section.
	

 der conigfile
 	die optionen und values der configfiles sind case sensitive.
 	bspl.
		[default]
		# regalis.cgf
		# ragalis configurations file.
		progname = regalis
		version = 2.0.0 dev
		build = 0
		
		# definitionen
		name     = roland kruggel
		ort      = Altena
		
		# pfade
		prog_path   = /usr/local/lycia.lnx/progs/regalis
		cfg_path    = %(prog_path)/cfg
		image_path  = %(prog_path)/images
		icon16_path = %(image_path)/icon16
		icon32_path = %(image_path)/icon32

		# der form path ist relativ 
		rel_form_path = per
		integer         = 13
		boolean         = true
		float           = 12.3314

		[kunden]
		module    = kunden
		dir       = re_kunden
		form_path = %(prog_path)/%(dir)/%(rel_form_path)
		
		[security]
		module    = security
		dir       = re_security
		form_path = %(prog_path)/%(dir)/%(rel_form_path)
		
		[splash]
		module    = splash
		dir       = re_splash
		form_path = %(prog_path)/%(dir)/%(rel_form_path)

			
 Grenzen und EinschrÃÂ¤nkungen	
	-	lÃÂ¤nge des configfiles		max 300 zeilen
	-	lÃÂ¤nge der option			max 100 zeichen/zeile
	-	lÃÂ¤nge des optionswertes		max 150 zeichen/zeile
	-	lÃÂ¤nge des section-name		max 40 zeichen
	-	anzahl der instanzen		max 10	
	
 Aufrufbare Funktionen

	function configInit(_file)
		-	initialises the module config / initialisiert das modul config
			needs to be called once / Muss einmal aufgrufen werden.
		- 	parameter
				_ptr		file name can be absolute or relative / der Dateinamen mit abs. oder rel. Pfad
                                                File name with absolute or relative path
			return			
				SMALLINT	der pointer der von configInit() zurÃÂ¼ckgegeben wird.
				
	function configDelete(_ptr)
		-	lÃÂ¶scht die mit _prt angegebene instanz wieder. Der pointer kann dann
			wieder verwendet werden.
		- 	parameter
				_file		der filename der configdatei
			return			
				INT			der pointer auf dieses init. Der pointer muss 
							bei jedem aufruf einer funktion mit ÃÂ¼bergeben werden
	
	function configRead(_ptr)
		-	liest die daten des configfile ein.
			wird von configInit() automatisch aufgerufen. Wird in der Regel
			nicht benÃÂ¶tigt.
		-	parameter
				_ptr		der pointer der von configInit() zurÃÂ¼ckgegeben wird.
			return
				none
				
	 FUNCTION configWrite(_ptr, _section, _name, _value)
		-	fÃÂ¼gt in den configfile die option _name mit dem wert _value ein. Wenn die
			option _name noch nicht existiert wird sie eingefÃÂ¼gt. Wenn sie existiert
			wird der wert geÃÂ¤ndert.
		-	parameter
                          _section       Section name mit [] z.B. [General]
				_ptr		der pointer der von configInit() zurÃÂ¼ckgegeben wird.
				_name		der name der option dessen wert eingefÃÂ¼gt werden soll.
				_value		der wert der eingefÃÂ¼gt werden soll
			return
				none
	
	function configGet(_ptr, _section, _name)
		-	gibt den wert zu der option _name zurÃÂ¼ck
		-	parameter
				_ptr		der pointer der von configInit() zurÃÂ¼ckgegeben wird.
				_name		der name der option dessen wert gesucht wird.
			return
				CHAR		den wert
	
	function configGetInt(_ptr, _section, _name)
		-	gibt den wert zu der option _name zurÃÂ¼ck
		-	parameter
				_ptr		der pointer der von configInit() zurÃÂ¼ckgegeben wird.
				_name		der name der option dessen wert gesucht wird.
			return
				int		den wert
	
	function configGetBoolean(_ptr, _section, _name)
		-	gibt den wert zu der option _name zurÃÂ¼ck. erlaubte werte fÃÂ¼r 
			True:	1, On, Yes, True
			False:	0, Off, No, False
		-	parameter
				_ptr		der pointer der von configInit() zurÃÂ¼ckgegeben wird.
				_name		der name der option dessen wert gesucht wird.
			return
				INT		den wert
	
	function configGetFloat(_ptr, _section, _name)
		-	gibt den wert zu der option _name zurÃÂ¼ck
		-	parameter
				_ptr		der pointer der von configInit() zurÃÂ¼ckgegeben wird.
				_name		der name der option dessen wert gesucht wird.
			return
				float		den wert
	
	function configHasOption(_ptr, _section, _name)
		-	Testet ob die option _name in dem configfile vorhanden ist. Bei erfolgreicher
			suche wird die position zurÃÂ¼ckgegeben, sonst 0
		-	parameter
				_ptr		der pointer der von configInit() zurÃÂ¼ckgegeben wird.
				_name		der name der option dessen wert gesucht wird.
			return
				INT			Position der option wenn gefunden, sonst 0

 ÃÂnderungen
 	20.04.2007	Es kÃÂ¶nnen mehrer 'instanzen' angelegt werden. Insgesamt 10. somit
				kÃÂ¶nnen mehrere config-files eingelesen und bearbeitet werden.
	
	21.04.2007	configDelete()
				Eine Instanz kann wieder gelÃÂ¶scht werden. Der pointer wird wieder 
				frei und kann erneut verwendet werden. 
					
	21.04.2007	variablenexpansion eingefÃÂ¼gt. Variablen haben das format %(name). 
				Es kÃÂ¶nnen auch mehrere Variable in einer zeile vorkommen. Variablen
				kÃÂ¶nnen sogar einzel stehen 'yy = %(xx)'
				Sie werden wie fogt definiert
					xx = .in.
					yy = alles%(xx)butter						
					wird zu ->    yy = alles.in.butter
					
 	21.04.2007	sections
				der configfile wird in sections unterteilt. jede section beginnt mit 
				dem section-name der in eckigen klammern steht. '[section]' alle dort 
				hinter stehenden variablen beziehen sich auf diese section. das 
				erspart konfigurationsfiles die aus vielen einzelnen dateien bestehen.
				
	23.04.2007	sections
				Variablen die in der default section definiert wurden sind global
				gÃÂ¼ltig. Sie werden aber von einer lokalen definition ÃÂ¼berschrieben.
				
 TODO

}


# type definieren
#FIXME
# die type-definition funktioniert nicht wirklich
DEFINE
  nname_typ    type as VARCHAR(34),
  nvalue_typ   type as VARCHAR(150),
  nsection_typ type as VARCHAR(40)
	
DEFINE 
  # FIXME
  # wenn die variablen mit einer type-definition definiert werden
  # ist sie nicht mehr vorhanden. der compiler gibt einen error
  # beim komplilieren aus
    variablen_typ  TYPE AS
      RECORD
        #nname   OF nname_typ,
        #nvalue  OF nvalue_typ,
        #nsection OF vsection_typ
        nname    VARCHAR(100),
        nvalue   VARCHAR(150),
        nsection VARCHAR(49)
      END RECORD,

    config_typ TYPE AS 
      RECORD
        last_position_in_array  SMALLINT,		-- die letzte gÃÂ¼ltige position (y) im der zweite dimension von variablen_array[x,y]
        config_file_name        VARCHAR(80)
      END RECORD
	
  # variablen definieren
  DEFINE 
    variablen_array         ARRAY[10,300] OF variablen_typ,
    config_sys              ARRAY[10] OF config_typ,
    variablen_array_max_1,
    variablen_array_max_2   SMALLINT,  -- die maximale Anzahl an zeilen fÃÂ¼r das array
    last_ptr_in_array       INT        -- die letzte gÃÂ¼ltige position (x) im der ersten dimension von variablen_array[x,y]

#########################################################################################
# FUNCTION _getDataFromArray(_ptr, _section, _name)
#########################################################################################
# liest das array und gibt den value zu dem namen zurÃÂ¼ck
# wenn das array noch nicht eingelesen wurde, wird es hier eingelesen
##########################################################################################
FUNCTION _getDataFromArray(_ptr, _section, _name)
  DEFINE  
    _ptr  SMALLINT,
    _section VARCHAR(40),
    _name  VARCHAR(100)

  DEFINE	
    i,j            INT,
    filename       VARCHAR(100),

    temp_rec 
      RECORD	
        var_name   VARCHAR(100),
        var_value  VARCHAR(150)
      END RECORD


  LET filename = config_sys[_ptr].config_file_name

	
  # den variablen namen im array suchen ob er schonmal eingelesen wurde
  # wenn ja, dann wird dieser wert zurÃÂ¼ckgegeben, sonst wird der wert
  # in der config datei gesucht.

  FOR i=1 TO config_sys[_ptr].last_position_in_array 
    IF variablen_array[_ptr, i].nname = trim(_name) and variablen_array[_ptr, i].nsection = trim(_section) THEN
        #CALL rk_debug("_getDataFromArray-1", "Variable in array gefunden",variablen_array[_ptr, i].nname,0,true) 
      RETURN variablen_array[_ptr, i].nvalue
    END IF
  END FOR

  # wenn die option nicht in der localen section gefunden wurde, wird
  # sie in der globales section gesucht.

  FOR i=1 TO config_sys[_ptr].last_position_in_array 
    IF variablen_array[_ptr, i].nname = trim(_name) and variablen_array[_ptr, i].nsection = '[default]' THEN 
      #CALL rk_debug("_getDataFromArray-2", "Variable in array gefunden",variablen_array[_ptr, i].nname,0,true) 
      RETURN variablen_array[_ptr, i].nvalue
    END IF
  END FOR

  RETURN Null
END FUNCTION



#########################################################################################
# FUNCTION _isVariableDefined(_name)
#########################################################################################
# testet ob in name eine variable definiert ist
# es wird nach %( ... ) gesucht
# para:		_name	der value
# return:	
#	INT		x,y
#			x = position von '%'
#			y = position von ')'
#			Wenn nichts gefunden wurde wird 0 zurÃÂ¼ckgegeben
##########################################################################################
FUNCTION _isVariableDefined(xname)
  DEFINE xname      VARCHAR(100)
  DEFINE p1, p2, i  SMALLINT

#DISPLAY "xname=", xname
#DISPLAY "length(xname)=", length(xname)	
  LET p1 = 0
  LET p2 = 0

  FOR i = 1 TO length(xname)

#DISPLAY "xname[i,i+1]", xname[i,i+1]
  
    IF xname[i,i+1] = "%(" THEN
      LET p1 = i
    END IF

    IF xname[i] = ")" THEN
      LET p2 = i
      EXIT FOR
    END IF
  END FOR

  RETURN p1, p2
	
END FUNCTION


#########################################################################################
# FUNCTION _expansion(_ptr, _section, _name)
#########################################################################################
# 
# expandiert die variablen definitionen
#
##########################################################################################
FUNCTION _expansion(_ptr, _section, _name)

  DEFINE
    _ptr        SMALLINT,
    _section    VARCHAR(40),
    _name       VARCHAR(100)
	
  DEFINE
    p1, p2, len, p4           SMALLINT,
    i, j, k                   SMALLINT,
    lvar, lvalue, lneu, lalt  VARCHAR(150)
	
			
  LET lalt = _name

  LET p1 = 999

  WHILE p1 > 0 
    # p1 ist der start der variable
    # p2 ist das ENDe der variable
    # alles zwischen p1 und p2 incl. wird ersetzt
#DISPLAY "lalt=", lalt
    CALL _isVariableDefined(lalt) RETURNING p1, p2
    #display "> ruf_______", lalt

    IF p1 THEN
      #display "> '%('______", p1
      #display "> ')'_______", p2
      LET lvar = lalt[p1+2,p2-1]
      #display "> 'var'_____", lvar
		
      LET lvalue = _getDataFromArray(_ptr, _section, lvar)
      #display "> 'lvalue'__", lvalue
		
      LET len = length(lalt)
      LET lneu = lalt[1,p1-1], trim(lvalue), lalt[p2+1,len]
			
      LET lalt = trim(lneu)
      #display "> 'lneu'____", lneu
    ELSE
      LET lneu = trim(lalt)
    END IF
	
  END WHILE

RETURN trim(lneu)		#_name
	
END FUNCTION

##########################################################
# FUNCTION _makeFreePosInArray(_ptr, _pos)
###########################################################
# erzeugt in dem datenarray eine freie Position in der der neue Datensat
# eingefpgt werden kann.
# Sucht die Position an der ein neuer Datensatz eingefÃÂ¼gt werden kann
# para:		_ptr		der Pointer
#		_section	die section
#		_pos		die position die frei gemacgt werden soll
# return:	none
#
###########################################################
FUNCTION _makeFreePosInArray(_ptr, _pos)
  DEFINE
    _ptr   SMALLINT,
    _pos   SMALLINT,
    i      SMALLINT
	
  IF _pos > config_sys[_ptr].last_position_in_array THEN 
    RETURN
  END IF
	
  FOR i = config_sys[_ptr].last_position_in_array TO _pos step -1
    LET variablen_array[_ptr, i+1].nname = variablen_array[_ptr, i].nname
    LET variablen_array[_ptr, i+1].nvalue = variablen_array[_ptr, i].nvalue
    LET variablen_array[_ptr, i+1].nsection = variablen_array[_ptr, i].nsection
  END FOR
	
  LET config_sys[_ptr].last_position_in_array = config_sys[_ptr].last_position_in_array + 1
	
END FUNCTION


##########################################################
# FUNCTION _searchInsertPos(_ptr, _section)
###########################################################
# Sucht die Position an der ein neuer Datensatz eingefÃÂ¼gt werden kann
# para:   _ptr        der Pointer
#         _section    die section
# return: INT         die Position an der der Datensatz eingefÃÂ¼gt werden kann
#
###########################################################
FUNCTION _searchInsertPos(_ptr, _section)
  DEFINE
    _ptr        SMALLINT,
    _section    CHAR(40),
    pos_flag    SMALLINT,
    i           SMALLINT
	
  #display "_searchInsertPos --------------"
  #			
  # test ob am ende eingefÃÂ¼gt werden soll 
  #
  LET i = config_sys[_ptr].last_position_in_array
  IF variablen_array[_ptr, i].nsection = trim(_section) THEN
    LET config_sys[_ptr].last_position_in_array = config_sys[_ptr].last_position_in_array + 1
    RETURN config_sys[_ptr].last_position_in_array
  END IF
	
  #
  # test ob i der mitte eingefÃÂ¼gt werden soll
  #
  LET pos_flag = 0
  FOR i = 1 TO config_sys[_ptr].last_position_in_array
    # den anfang der section finden
    IF variablen_array[_ptr, i].nname = trim(_section) and pos_flag = 0 THEN
      LET pos_flag = 1
    END IF
    # die nÃÂ¤chste section finden
    IF variablen_array[_ptr, i].nsection <> trim(_section) and pos_flag > 0 THEN
      EXIT FOR
    END IF
  END FOR
	
  LET i = i -1
  CALL _makeFreePosInArray(_ptr, i)				-- position frei machen
  RETURN i
	
END FUNCTION



# -----------------------------------------------------------------------------------------
#
#  aufrufbare functionen
#
# -----------------------------------------------------------------------------------------


###########################################################
# FUNCTION configHasOption(_ptr, _section, _name)
###########################################################
# returns true wenn die option _name existiert, sonst false
#
###########################################################
FUNCTION configHasOption(_ptr, _section, _name)
DEFINE
  _ptr          SMALLINT,
  _section      VARCHAR(40),
  _name         VARCHAR(100),  
  i             INT,
  ret           SMALLINT
			
  LET ret = 0

  FOR i=1 TO config_sys[_ptr].last_position_in_array 
    IF variablen_array[_ptr, i].nname = trim(_name) and variablen_array[_ptr, i].nsection = trim(_section) THEN
      #CALL rk_debug("configHasOption", "Variable in array gefunden",variablen_array[_ptr, i].nname,0,false)
      LET ret = i
      EXIT FOR
    END IF
  END FOR

  RETURN ret

END FUNCTION


###########################################################
# FUNCTION display_config_array_data(_ptr)
###########################################################
#
# for debug only - displays all config array data
# 
# RETURN BOOLEAN
###########################################################
FUNCTION display_config_array_data(_ptr)
  DEFINE
    _ptr         SMALLINT,
    i            SMALLINT,
    tmp_rec 	
      RECORD
        nname    VARCHAR(100),
        deli	 char(3),
        nvalue	 VARCHAR(150)
      END RECORD,
  local_debug    SMALLINT

  DISPLAY "####### In display_config_array_data(_ptr) _ptr=", _ptr, "   ######## "
  DISPLAY "config_sys[_ptr].last_position_in_array =",config_sys[_ptr].last_position_in_array 


  FOR i = 1 TO config_sys[_ptr].last_position_in_array 
    LET tmp_rec.nname = variablen_array[_ptr, i].nname 
    LET tmp_rec.nvalue = variablen_array[_ptr, i].nvalue

    DISPLAY "display_config_array_data() - tmp_rec.nname = ", tmp_rec.nname
    DISPLAY "display_config_array_data() - tmp_rec.deli = ", tmp_rec.deli
    DISPLAY "display_config_array_data() - tmp_rec.nvalue = ", tmp_rec.nvalue

  END FOR
	
END FUNCTION



###########################################################
# FUNCTION configWriteArrayToDisk(_ptr, _section, _name, _value)
###########################################################
#
# writes the value to the corresponding place in the array and writes the entire config file back to disk
# schreibt den wert _value mit dem namen _namen  in den config file
# 
# RETURN BOOLEAN
###########################################################
FUNCTION configWriteArrayToDisk(_ptr)
  DEFINE
    _ptr         SMALLINT,
    #_section     VARCHAR(40),
    #_name        VARCHAR(100),
    #_value       VARCHAR(150),
    #arrpos       SMALLINT,
    i            SMALLINT,
    tmp_rec 	
      RECORD
        nname    VARCHAR(100),
        deli	 char(3),
        nvalue	 VARCHAR(150)
      END RECORD,
  local_debug    SMALLINT

  LET local_debug = FALSE
			
  # daten schreiben
	 
  #CALL rk_debug("configWrite", "...>start" ,"",0,False)
  CALL fgl_channel_open_file("stream", config_sys[_ptr].config_file_name, "w")
  CALL fgl_channel_set_delimiter("stream","")

  IF local_debug THEN
    DISPLAY "config_sys[_ptr].last_position_in_array =",config_sys[_ptr].last_position_in_array 
  END IF

  FOR i = 1 TO config_sys[_ptr].last_position_in_array 
    LET tmp_rec.nname = variablen_array[_ptr, i].nname 
    LET tmp_rec.nvalue = variablen_array[_ptr, i].nvalue

    IF tmp_rec.nname[1] = '#' or length(tmp_rec.nname) = 0 OR tmp_rec.nname[1] = "[" THEN
      LET tmp_rec.deli = ' '
    ELSE
      LET tmp_rec.deli = ' = '
    END IF

    IF local_debug THEN
      DISPLAY "configWriteArrayToDisk() - tmp_rec.nname = ", tmp_rec.nname
      DISPLAY "configWriteArrayToDisk() - tmp_rec.deli = ", tmp_rec.deli
      DISPLAY "configWriteArrayToDisk() - tmp_rec.nvalue = ", tmp_rec.nvalue
    END IF

    CALL fgl_channel_write("stream",tmp_rec.*)
  END FOR
	
  CALL fgl_channel_close("stream")

  #CALL rk_debug("configWrite", "...<ende","",0,False)
	
  RETURN True

END FUNCTION




###########################################################
# FUNCTION configWriteToArray(_ptr, _section, _name, _value)
###########################################################
#
# writes the value to the corresponding place in the array (!!!no disk file write!!!)
# 
# RETURN BOOLEAN
###########################################################
FUNCTION configWriteToArray(_ptr, _section, _name, _value)
  DEFINE
    _ptr         SMALLINT,
    _section     VARCHAR(40),
    _name        VARCHAR(100),
    _value       VARCHAR(150),
    arrpos       SMALLINT,
    i            SMALLINT,
    tmp_rec 	
      RECORD
        nname    VARCHAR(100),
        deli	 char(3),
        nvalue	 VARCHAR(150)
      END RECORD,
  local_debug    SMALLINT

  LET local_debug = FALSE
			
  # die position der Variablen suchen. Wenn nicht vorhanden wird false
  # zurÃÂ¼ckgegeben
  LET arrpos = configHasOption(_ptr, _section, _name)
	
  # eine neue position suchen
  IF not arrpos THEN
    #LET config_sys[_ptr].last_position_in_array = config_sys[_ptr].last_position_in_array +1
    #LET arrpos = config_sys[_ptr].last_position_in_array
    LET arrpos = _searchInsertPos(_ptr, _section)               -- search position / position suchen
    #CALL _makeFreePosInArray(_ptr, arrpos)                     -- free-make position available / position frei machen
  END IF
	
  # die daten in das array schreiben
  LET variablen_array[_ptr, arrpos].nname = _name
  LET variablen_array[_ptr, arrpos].nvalue = _value
  LET variablen_array[_ptr, arrpos].nsection = _section


  RETURN True

END FUNCTION



###########################################################
# FUNCTION configWrite(_ptr, _section, _name, _value)
###########################################################
#
# writes the value to the corresponding place in the array and writes the entire config file back to disk
# schreibt den wert _value mit dem namen _namen  in den config file
# 
# RETURN BOOLEAN
###########################################################
FUNCTION configWrite(_ptr, _section, _name, _value)
  DEFINE
    _ptr         SMALLINT,
    _section     VARCHAR(40),
    _name        VARCHAR(100),
    _value       VARCHAR(150),
    arrpos       SMALLINT,
    i            SMALLINT,
    tmp_rec 	
      RECORD
        nname    VARCHAR(100),
        deli	 char(3),
        nvalue	 VARCHAR(150)
      END RECORD,
  local_debug    SMALLINT

  LET local_debug = FALSE
			
  # die position der Variablen suchen. Wenn nicht vorhanden wird false
  # zurÃÂ¼ckgegeben
  LET arrpos = configHasOption(_ptr, _section, _name)
	
  # eine neue position suchen
  IF not arrpos THEN
    #LET config_sys[_ptr].last_position_in_array = config_sys[_ptr].last_position_in_array +1
    #LET arrpos = config_sys[_ptr].last_position_in_array
    LET arrpos = _searchInsertPos(_ptr, _section)               -- search position / position suchen
    #CALL _makeFreePosInArray(_ptr, arrpos)                     -- free-make position available / position frei machen
  END IF
	
  # die daten in das array schreiben
  LET variablen_array[_ptr, arrpos].nname = _name
  LET variablen_array[_ptr, arrpos].nvalue = _value
  LET variablen_array[_ptr, arrpos].nsection = _section

  # daten schreiben
	 
  #CALL rk_debug("configWrite", "...>start" ,"",0,False)
  CALL fgl_channel_open_file("stream", config_sys[_ptr].config_file_name, "w")
  CALL fgl_channel_set_delimiter("stream","")

  IF local_debug THEN
    DISPLAY "config_sys[_ptr].last_position_in_array =",config_sys[_ptr].last_position_in_array 
  END IF

  FOR i = 1 TO config_sys[_ptr].last_position_in_array 
    LET tmp_rec.nname = variablen_array[_ptr, i].nname 
    LET tmp_rec.nvalue = variablen_array[_ptr, i].nvalue

    IF tmp_rec.nname[1] = '#' or length(tmp_rec.nname) = 0 OR tmp_rec.nname[1] = "[" THEN
      LET tmp_rec.deli = ' '
    ELSE
      LET tmp_rec.deli = ' = '
    END IF

    IF local_debug THEN
      DISPLAY "configWrite() - tmp_rec.nname = ", tmp_rec.nname
      DISPLAY "configWrite() - tmp_rec.deli = ", tmp_rec.deli
      DISPLAY "configWrite() - tmp_rec.nvalue = ", tmp_rec.nvalue
    END IF

    CALL fgl_channel_write("stream",tmp_rec.*)
  END FOR
	
  CALL fgl_channel_close("stream")

  #CALL rk_debug("configWrite", "...<ende","",0,False)
	
  RETURN True

END FUNCTION


###########################################################
# FUNCTION configRead(_ptr)
###########################################################
# 
# Read/process the config file
#
# RETURN NONE
###########################################################
FUNCTION configRead(_ptr)
  DEFINE
    _ptr                SMALLINT,
    i                   INT,
    filename            VARCHAR(100),
    arrpos              SMALLINT,
    temp_rec
      RECORD	
        var_name        VARCHAR(100),
        var_value       VARCHAR(150)
      END RECORD,
    section_name        VARCHAR(40)

  LET filename = config_sys[_ptr].config_file_name
	
  CALL fgl_channel_open_file("stream", filename, "r")
  CALL fgl_channel_set_delimiter("stream","=") 
	
  #CALL rk_debug("configRead", "...>start" ,"",0,false)

  LET section_name = "[default]"                          -- der default section name
  LET arrpos = 0

  WHILE fgl_channel_read("stream",temp_rec.*)

    LET temp_rec.var_name = trim(temp_rec.var_name)
    LET temp_rec.var_value = trim(temp_rec.var_value)

    LET arrpos = arrpos + 1                                -- last_position_in_array

    IF arrpos > variablen_array_max_2 THEN
      CALL fgl_winmessage("System Error",
                          "tools_config_manager.4gl \n\ndefine variablen_array array[" || variablen_array_max_1 || "," || variablen_array_max_2 || "] \nDer Wert fÃÂ¼r die zweite Dimension ist zu klein", 
                          "Error")
      EXIT WHILE
    END IF
		
    # test, if object is a section parameter / test ob es ein section parameter ist
    IF temp_rec.var_name[1] = "[" THEN
      LET section_name = temp_rec.var_name
    END IF
		
    LET variablen_array[_ptr, arrpos].nname = temp_rec.var_name
    LET variablen_array[_ptr, arrpos].nvalue = temp_rec.var_value
    LET variablen_array[_ptr, arrpos].nsection = section_name
		
    #CALL rk_debug("configRead", "variablen_array[_ptr, arrpos].nname",variablen_array[_ptr, arrpos].nname ,0,false)
    #CALL rk_debug("configRead", "variablen_array[_ptr, arrpos].nvalue",variablen_array[_ptr, arrpos].nvalue ,0,false)
    #CALL rk_debug("configRead", "variablen_array[_ptr, arrpos].nsection",variablen_array[_ptr, arrpos].nsection ,0,false)

  END WHILE

  #CALL rk_debug("configRead", "...<ende","",0,False)
	
  CALL fgl_channel_close("stream")

  LET config_sys[last_ptr_in_array].last_position_in_array = arrpos 

END FUNCTION


###########################################################
# FUNCTION configGet(_ptr, _section, _name)
###########################################################
# liest einen string aus dem config-file
#
###########################################################
FUNCTION configGet(_ptr, _section, _name)
DEFINE	_ptr		SMALLINT,
  _section	VARCHAR(40),
  _name		VARCHAR(100)

#DISPLAY "#########################"
#DISPLAY "RETURN _expansion(_ptr, _section, _getDataFromArray(_ptr, _section, _name))"
#DISPLAY "_ptr=", _ptr
#DISPLAY "_section=", _section
#DISPLAY "_name=", _name
#DISPLAY "_getDataFromArray(_ptr, _section, _name)", _getDataFromArray(_ptr, _section, _name)
#DISPLAY "#########################"


  RETURN _expansion(_ptr, _section, _getDataFromArray(_ptr, _section, _name))

END FUNCTION


###########################################################
# FUNCTION configGetInt(_ptr, _section, _name)
###########################################################
# liest einen integer aus dem config-file
#
###########################################################
FUNCTION configGetInt(_ptr, _section, _name)
  DEFINE
    _ptr        SMALLINT,
    _section    VARCHAR(40),
    _name       VARCHAR(30),
    read_char   VARCHAR(100),
    ret         INT
	
  LET read_char = _expansion(_ptr, _section, _getDataFromArray(_ptr, _section, _name))
  LET ret = read_char
	
RETURN _expansion(_ptr, _section, _getDataFromArray(_ptr, _section, _name))
	
END FUNCTION

 
###########################################################
# FUNCTION configGetBoolean(_ptr, _section, _name)
###########################################################
# liest einen boolean aus dem config-file
#
###########################################################
FUNCTION configGetBoolean(_ptr, _section, _name)

  DEFINE	
    _ptr        SMALLINT,
    _section    VARCHAR(40),
    _name       VARCHAR(100),
    read_value  VARCHAR(100),
    ret         SMALLINT
	
  LET read_value = _expansion(_ptr, _section, _getDataFromArray(_ptr, _section, _name))
  LET read_value = trim(read_value)
	
  LET ret = Null

  CASE upshift(read_value)
    WHEN "1" 
      LET ret = True
    WHEN "ON" 
      LET ret = True
    WHEN "YES" 
      LET ret = True
    WHEN "TRUE"
      LET ret = True
    WHEN "0" 
      LET ret = False
    WHEN "OFF" 
      LET ret = False
    WHEN "NO" 
      LET ret = False
    WHEN "FALSE" 
      LET ret = False
    OTHERWISE
      CALL fgl_winmessage("System Error",
                          "k_config.4gl\n\nConfigfile " || config_sys[_ptr].config_file_name || "\nParameter: " || _name || "\nist falsch. Es ist kein boolean Wert [" || read_value || "]",
                          "Error")
  LET ret = False

END CASE

RETURN ret
	
END FUNCTION
 
###########################################################
# FUNCTION configGetFloat(_ptr, _section, _name)
###########################################################
# liest einen float aus dem config-file
#
###########################################################
FUNCTION configGetFloat(_ptr, _section, _name)
	
  DEFINE
    _ptr        SMALLINT,
    _section    VARCHAR(40),
    _name       VARCHAR(100),		
    read_char	VARCHAR(100),
    ret         FLOAT
	
  LET read_char = _expansion(_ptr, _section, _getDataFromArray(_ptr, _section, _name))
  LET ret = read_char
	
  RETURN ret
	
END FUNCTION
 

###########################################################
# FUNCTION configDelete(_ptr)
###########################################################
# lÃÂ¶scht eine instanz. somit wird der _ptr wieder frei und
# kann erneut  vergeben werden.
#
###########################################################
FUNCTION configDelete(_ptr)
  DEFINE
    _ptr INT
	
  LET config_sys[_ptr].last_position_in_array = 0

END FUNCTION

###########################################################
# FUNCTION configInit(_file)
###########################################################
#
#  den config-Part initialisieren
###########################################################
FUNCTION configInit(_file)

  DEFINE
    _file       VARCHAR(50),
    leni        INT,
    i           INT,
    qt_err_msg  VARCHAR(200),
    local_Debug SMALLINT,
    inp_char    CHAR


  IF _file IS NULL THEN
    CALL fgl_winmessage("Error","configInit(_file) was called with an empty argument !\n_file=","ERROR")
  END IF
 	
  LET local_debug = FALSE

  LET variablen_array_max_1 = 10
  LET variablen_array_max_2 = 300

  #Test, if the file exist

  IF NOT fgl_test("e",_file) THEN
    LET qt_err_msg = "configInit(_file)\nFollowing configuration file does not exist on server ", _file, "\nApplication needs closing down"
    CALL fgl_winmessage("Configuration file error",qt_err_msg, "error")
    EXIT PROGRAM
  END IF
  #	
  # testen ob der configfile nicht zu lang ist 
  #.

{  wc does not exist on windows
  CALL fgl_channel_open_pipe("pipe", "wc -l " || _file || " | cut -d' ' -f1", "r")



  CALL fgl_channel_set_delimiter("pipe"," ")

  CALL fgl_channel_read("pipe", leni)

  IF leni > variablen_array_max_2 THEN
    CALL fgl_winmessage("System Error",
                        "configInit()\n\nDer Configfile ist zu lang (" || leni || " Zeichen)",
                        "Error")
  END IF
	
  # 
  # den nÃÂ¤chsten freien index suchen 
  #.

}	
  FOR i = 1 TO variablen_array_max_1
    IF config_sys[i].last_position_in_array = 0 THEN
      LET last_ptr_in_array = i
      EXIT FOR
    END IF
  END FOR
	
  IF i > variablen_array_max_1 THEN
    CALL fgl_winmessage("System Error",
                        "Zu viele Instanzen von configInit()",
                        "Error")
    EXIT PROGRAM
  END IF

  LET config_sys[last_ptr_in_array].last_position_in_array = 0 
  LET config_sys[last_ptr_in_array].config_file_name = _file

  CALL configRead(last_ptr_in_array)

  IF local_debug THEN
    DISPLAY "configInit() - _file=", _file
    DISPLAY "configInit() - last_ptr_in_array=", last_ptr_in_array
  END IF

  #IF local_debug THEN
  #  CALL  display_config_array_data(last_ptr_in_array)
  #  #PROMPT "Press any key to continue" FOR CHAR inp_char
  #END IF

  RETURN last_ptr_in_array


END FUNCTION


###################################################################
# FUNCTION get_cfg_file_id(f_name)
#
# get the config file id
#
# RETURN i or -1 for error
###################################################################
FUNCTION get_cfg_file_id(f_name)
  DEFINE
    f_name        VARCHAR(100),
    i             SMALLINT,
    local_debug   SMALLINT

  LET local_debug = FALSE

  IF local_debug THEN
    display "###################################"
    display "argument=", f_name

    DISPLAY "array file name <-> file argument" 
  END IF

  FOR i = 1 TO 10
    IF local_debug THEN
      DISPLAY config_sys[i].config_file_name CLIPPED, " <-> ", f_name CLIPPED
    END IF

    IF config_sys[i].config_file_name CLIPPED = f_name CLIPPED THEN
      RETURN i
    END IF
  END FOR

  CALL fgl_winmessage("Internal 4GL demo source code error","get_cfg_file_id(f_name)\nSpecified config file name was not found in the list","error")
  RETURN -1 -- ERROR - not found
  #LET filename = config_sys[_ptr].config_file_name

END FUNCTION

