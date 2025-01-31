#########################################################################################################
# GLOBALS
######################################################################################################### 
GLOBALS
  DEFINE err_msg, tmp_str,tmp_str1,tmp_str2 VARCHAR(300)


  # Grid Header temp record - used by grid header update functions
  DEFINE t_gr_head_temp_rec TYPE AS 
    RECORD
      col_name VARCHAR(30),
      col_label VARCHAR(30),
      col_alignment VARCHAR(10)
    END RECORD



  # Contact Demo globals
  DEFINE
    w_contact VARCHAR(20),
    f_contact VARCHAR(20)


  DEFINE act_arr DYNAMIC ARRAY OF RECORD
    act_date DATE,
    act_act CHAR(50),
    act_tit VARCHAR(10), -- cust_title VARCHAR(10),
    act_conf VARCHAR(20),  --cust_fname VARCHAR(20),
    act_conl VARCHAR(20),  --cust_lname VARCHAR(20),
    act_state CHAR(10),
    act_cost MONEY(8,2),
    act_priority SMALLINT
  END RECORD



# Grid column header record
  DEFINE grid_header ARRAY[6] OF RECORD
    col_name VARCHAR(30),
    col_label VARCHAR(30),
    col_alignment VARCHAR(10),
    col_key VARCHAR(10)
  END RECORD


  DEFINE exit_menu SMALLINT

  DEFINE yes_no CHAR
  DEFINE bt1, bt2 INTEGER
  DEFINE cust_rec ARRAY[15] OF RECORD
    cust_id INTEGER, 
    cust_title VARCHAR(10),
    cust_fname VARCHAR(20),
    cust_lname VARCHAR(20),

    cust_dob DATE,
    cust_email VARCHAR(100),
    cust_url VARCHAR(200),

    cust_address1 STRING,
    cust_address2 STRING,
    cust_address3 STRING,
    cust_post_code STRING,        
    cust_country VARCHAR(20),

    cust_re INTEGER,
    cust_rp INTEGER,
    cust_rl INTEGER,
    cust_type SMALLINT,
    cust_memo CHAR(5000),
    cust_picture STRING
  END RECORD

  DEFINE cust_rec_original ARRAY[15] OF RECORD
    cust_id INTEGER, 
    cust_title VARCHAR(10),
    cust_fname VARCHAR(20),
    cust_lname VARCHAR(20),
    cust_country VARCHAR(20),
    cust_dob DATE,
    cust_email VARCHAR(100),
    cust_url VARCHAR(200),
    cust_re INTEGER,
    cust_rp INTEGER,
    cust_rl INTEGER,
    cust_type SMALLINT,
    cust_memo CHAR(5000),
    cust_picture STRING
  END RECORD
  
  DEFINE report_rec ARRAY[20] OF RECORD
    quantity SMALLINT, 
    item_ID VARCHAR(20),
    item_name VARCHAR(100),
    author VARCHAR(100),
    item_desc CHAR(1000),
    s_price MONEY,
    vat MONEY,
    url VARCHAR(220)
  END RECORD

#Quantity|Item_id|Item_name|Author|Item_description|single_price|VAT|url|

  # Image Array for visual image selection
  define 
    cust_picture ARRAY[7] OF STRING

  #For international string table
  #DEFINE str_rec ARRAY[5,50] OF VARCHAR(100)

################################
# For message box demo
################################

  DEFINE msg_box_info ARRAY[5] OF VARCHAR(200) 
  DEFINE l_yes_no CHAR

################################
# For control demo
################################
  DEFINE comp_rec RECORD 
    comp_name CHAR(40),
    comp_country CHAR(20),
    comp_founded DATE,
    f_favourites CHAR(100),
    temp_url CHAR(100),
    comp_url CHAR(100)
  END RECORD

  DEFINE gui_menu_rec ARRAY[5,5] OF RECORD
    menu_item VARCHAR(15),
    menu_desc VARCHAR(60)
  END RECORD



#################################
# Language
#################################
  DEFINE languageID SMALLINT

################################
# For Themes Demo
################################
  DEFINE win_size_y, win_size_x,win_pos_y,win_pos_x  SMALLINT



################################
# For color demo
################################

  DEFINE col_arr ARRAY[5] OF CHAR(12)

  DEFINE 
    fc11,fc12,fc13,fc14,fcsa11,fcsa12,fcsa13,fcsa14, 
    fc21,fc22,fc23,fc24,fcsa21,fcsa22,fcsa23,fcsa24,
    fc31,fc32,fc33,fc34,fcsa31,fcsa32,fcsa33,fcsa34, 
    fc41,fc42,fc43,fc44,fcsa41,fcsa42,fcsa43,fcsa44, 
    fc51,fc52,fc53,fc54,fcsa51,fcsa52,fcsa53,fcsa54, 
    fc61,fc62,fc63,fc64,fcsa61,fcsa62,fcsa63,fcsa64, 
    fc71,fc72,fc73,fc74,fcsa71,fcsa72,fcsa73,fcsa74, 
    fc81,fc82,fc83,fc84,fcsa81,fcsa82,fcsa83,fcsa84,  
    fc91,fc92,fc93,fc94,fcsa91,fcsa92,fcsa93,fcsa94,      
    fc15,fc16,fc17,fc18,fc19,fc20,
    fcsa15,fcsa16,fcsa17,fcsa18,fcsa19,fcsa20, 
    fc35,fc36,fc37,fc38,fc39,fc40,
    fcsa35,fcsa36,fcsa37,fcsa38,fcsa39,fcsa40,
    fc55,fc56,fc57,fc58,fc59,fc60,
    fcsa55,fcsa56,fcsa57,fcsa58,fcsa59,fcsa60

  CHAR(10)






  DEFINE t_contact_ws_rec TYPE AS RECORD
      cont_name      CHAR(20),
      cont_title     CHAR(10),
      cont_fname     CHAR(20),
      cont_lname     CHAR(20),
      cont_addr1     CHAR(40),
      cont_addr2     CHAR(40),
      cont_addr3     CHAR(40),
      cont_city      CHAR(20),
      cont_zone      CHAR(15),
      cont_zip       CHAR(15),
      cont_country   CHAR(40),
      cont_phone     CHAR(15),
      cont_mobile    CHAR(15),
      cont_fax       CHAR(15),
      cont_email     CHAR(50),
      comp_name      CHAR(40),
      #cont_picture   LIKE contact.cont_picture,
      cont_notes     CHAR(1000)
  END RECORD


END GLOBALS

