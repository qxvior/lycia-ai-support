#BIC (was BSB) Bank Code Management
{
###########################################################################
# This program IS free software; you can redistribute it AND/OR modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation; either version 2 of the License, OR (at your
# option) any later version.
#
# This program IS distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License FOR more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; IF NOT, write TO the Free Software Foundation, Inc.,
# 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
#
###########################################################################

	 $Id: $
}



#   GZU - Bank bics

############################################################
# GLOBAL Scope Variables
############################################################
GLOBALS "sta_input_attributes_methods2_globals.4gl"
GLOBALS
   DEFINE
      temp_text CHAR(20)
END GLOBALS


############################################################
# MAIN
#
#
############################################################
MAIN
	CALL ui_init()	#Initial UI Init

	DEFER QUIT
  DEFER INTERRUPT
   
	OPEN WINDOW wG534 WITH FORM "form/sta_input_attributes_methods2"   
      
	CALL select_bic(FILTER_OFF)
	CALL scan_bic()
  CLOSE WINDOW wG534

END MAIN


############################################################
# FUNCTION select_bic()
#
#
############################################################
FUNCTION select_bic(p_filter)
	DEFINE p_filter BOOLEAN
	DEFINE l_query_text VARCHAR(300)
	DEFINE l_where_text VARCHAR(200)

	IF p_filter THEN
		CLEAR FORM
		MESSAGE "Enter Selection Criteria - ESC TO Continue"
		CONSTRUCT BY NAME l_where_text on bic_code,
                                   desc_text,
                                   post_code,
                                   bank_ref
            			  

	

	ELSE
		LET l_where_text = " 1=1 "
	END IF

   IF int_flag OR quit_flag THEN
      LET int_flag = FALSE
      LET quit_flag = FALSE
      RETURN NULL
   ELSE
      LET l_query_text = "SELECT * FROM bic ",
                         "WHERE ", l_where_text clipped," ",
                       "ORDER BY bic.bic_code"
      RETURN l_query_text
   END IF
END FUNCTION



############################################################
# FUNCTION scan_bic()
#
#
############################################################
FUNCTION scan_bic()
	DEFINE l_rec_bic OF t_rec_bic
	DEFINE l_arr_rec_bic DYNAMIC ARRAY OF t_rec_bic
	DEFINE l_idx SMALLINT  
	DEFINE l_del_cnt SMALLINT 
	DEFINE l_i SMALLINT  
	DEFINE l_filter BOOLEAN
	
	LET l_filter = FALSE


	CALL db_bic_get_arr_rec(FILTER_QUERY_OFF,NULL) RETURNING l_arr_rec_bic
	
	IF l_arr_rec_bic.getLength() = 0 THEN
      #MESSAGE "No Bank/State/Branchs satisfied selection criteria "
	END IF
	
#   options INSERT key F1,
#           delete key F36
  
#   CALL set_count(l_idx)
   MESSAGE "F1 TO Add - F2 TO Delete - RETURN on line TO Edit "
	INPUT ARRAY l_arr_rec_bic WITHOUT DEFAULTS FROM sr_bic.* ATTRIBUTE(UNBUFFERED, APPEND ROW = 1, INSERT ROW = 0, DELETE ROW = 1, AUTO APPEND = 0)
			
      BEFORE ROW
      	DISPLAY "BEFORE ROW"
         LET l_idx = arr_curr()
         LET l_rec_bic.* = l_arr_rec_bic[l_idx].*
         #LET scrn = scr_line()
#         NEXT FIELD scroll_flag

			AFTER ROW
				CALL db_bic_update(UI_ON,l_rec_bic.bic_code,l_arr_rec_bic[l_idx].*) 
				CALL db_bic_get_arr_rec(FILTER_QUERY_OFF,NULL) RETURNING l_arr_rec_bic #get data refreshed
				NEXT FIELD bic_code	

			         
      BEFORE INSERT
      	DISPLAY "BEFORE INSERT"

         INITIALIZE l_rec_bic.* TO NULL

			AFTER INSERT
      	DISPLAY "AFTER INSERT"

				IF int_flag THEN
					LET int_flag = FALSE
#				ELSE
#
#      		CALL db_bic_insert(UI_ON,l_arr_rec_bic[l_idx].*)
      	END IF
      	
      	CALL db_bic_get_arr_rec(FILTER_QUERY_OFF,NULL) RETURNING l_arr_rec_bic
      				
           
      AFTER FIELD bic_code
				IF l_arr_rec_bic[l_idx].bic_code IS NULL THEN  #bic_code is PK and can never be NULL
          MESSAGE "Bank/State/Branchs must NOT be NULL"
          NEXT FIELD bic_code
				END IF
					#db_bic_pk_exists requires db
					#IF (l_rec_bic.bic_code <> l_arr_rec_bic[l_idx].bic_code) OR (l_rec_bic.bic_code IS NULL)  THEN #user chas changed bic_code
					#	IF db_bic_pk_exists(UI_ON,l_arr_rec_bic[l_idx].bic_code) THEN #PK already exists
					#		NEXT FIELD bic_code
					#	END IF
					#END IF

         
			AFTER FIELD desc_text
				IF l_arr_rec_bic[l_idx].desc_text IS NULL THEN
					MESSAGE "Bank/State/Branchs Description must NOT be NULL"
					NEXT FIELD desc_text					
				END IF

   END INPUT
   
   IF int_flag OR quit_flag THEN
      LET int_flag = FALSE
      LET quit_flag = FALSE
   ELSE
      FOR l_idx = 1 TO arr_count()
         IF l_arr_rec_bic[l_idx].bic_code IS NOT NULL THEN
            LET l_rec_bic.bic_code = l_arr_rec_bic[l_idx].bic_code
            LET l_rec_bic.desc_text = l_arr_rec_bic[l_idx].desc_text
            LET l_rec_bic.post_code = l_arr_rec_bic[l_idx].post_code
            LET l_rec_bic.bank_ref = l_arr_rec_bic[l_idx].bank_ref
            UPDATE bic
               SET * = l_rec_bic.*
             WHERE bic_code = l_rec_bic.bic_code
            IF sqlca.sqlerrd[3] = 0 THEN
               INSERT INTO bic VALUES (l_rec_bic.*)
            END IF
         END IF
      END FOR
      IF l_del_cnt > 0 THEN

            FOR l_idx = 1 TO arr_count()
            END FOR
      END IF
   END IF
END FUNCTION



############################################################
# FUNCTION db_bic_get_arr_rec(p_query_text)
#
#
############################################################
FUNCTION db_bic_get_arr_rec(p_query_type,p_query_or_where_text)
	DEFINE p_query_type SMALLINT
	DEFINE p_query_or_where_text VARCHAR(500)
	DEFINE l_query_text VARCHAR(500)
	DEFINE l_where_text VARCHAR(500)
	DEFINE l_arr_rec_bic DYNAMIC ARRAY OF t_rec_bic		
	DEFINE l_rec_bic OF t_rec_bic
	DEFINE l_idx SMALLINT
	
	#p_query_text is optional
	CASE p_query_type
		WHEN FILTER_QUERY_OFF
			LET l_query_text = 
				"SELECT * FROM bic ",
				"ORDER BY bic.bic_code" 	


		WHEN FILTER_QUERY_ON
			LET l_query_text = p_query_or_where_text

		WHEN FILTER_QUERY_WHERE
			LET l_where_text = p_query_or_where_text
			LET l_query_text = 
				"SELECT * FROM bic ",
				"WHERE ", l_where_text clipped," ",
				"ORDER BY bic.bic_code" 	

		OTHERWISE
			LET l_query_text = 
				"SELECT * FROM bic ",
				"ORDER BY bic.bic_code" 				
	END CASE

	#WE need to simulate dummy DB
{
	PREPARE s_bic FROM l_query_text
	DECLARE c_bic CURSOR FOR s_bic


	LET l_idx = 0
	FOREACH c_bic INTO l_rec_bic.*
      LET l_idx = l_idx + 1
      LET l_arr_rec_bic[l_idx].bic_code = l_rec_bic.bic_code
      LET l_arr_rec_bic[l_idx].desc_text = l_rec_bic.desc_text
      LET l_arr_rec_bic[l_idx].post_code = l_rec_bic.post_code
      LET l_arr_rec_bic[l_idx].bank_ref = l_rec_bic.bank_ref
	END FOREACH
}

	FOR l_idx = 0 TO 5
      LET l_idx = l_idx + 1
      LET l_arr_rec_bic[l_idx].bic_code = "A-",trim(l_idx)
      LET l_arr_rec_bic[l_idx].desc_text = "A-",trim(l_idx)
      LET l_arr_rec_bic[l_idx].post_code = "A-",trim(l_idx)
      LET l_arr_rec_bic[l_idx].bank_ref = "A-",trim(l_idx)
	END FOR
	

	IF sqlca.sqlcode < 0 THEN   		                                                                                        
		RETURN -1	                                                                                              	
	ELSE		                                                                                                                    
		RETURN l_arr_rec_bic		                                                                                                
	END IF	         
END FUNCTION



############################################################
# FUNCTION db_bic_update(p_rec_bic)
#
# AGAIN, we need to changes this to simulate DB work
############################################################
FUNCTION db_bic_update(p_ui_mode,p_pk_bic_code,p_rec_bic)
	DEFINE p_ui_mode BOOLEAN
	DEFINE p_pk_bic_code char(11)
	DEFINE p_rec_bic t_rec_bic
	DEFINE ret INT

#	IF db_bank_get_bic_count(p_pk_bic_code) AND (p_pk_bic_code <> p_rec_bic.bic_code) THEN #PK bic_code can only be changed if it's not used already
#		IF p_ui_mode THEN
#			ERROR "Can not change BIC ! It is already used in a bank configuration"
#		END IF
#		LET ret =  -1
#	ELSE
		MESSAGE "UPDATE bic record"	
#		SQL
#			UPDATE bic
#			SET * = $p_rec_bic.*
#			WHERE bic_code = $p_pk_bic_code
#		END SQL
		LET ret = status
#	END IF
	
	RETURN ret
END FUNCTION        
