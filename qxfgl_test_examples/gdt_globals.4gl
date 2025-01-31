GLOBALS

	DEFINE currRecId INT
	DEFINE globalMaxContId INT  --no database, so we have to simulate contact id count
	DEFINE globalNameOrder BOOLEAN --first last or last-first
	DEFINE globalContGroupId SMALLINT  --for list filter all, private, business, other
	DEFINE cont_pic DYNAMIC ARRAY OF STRING
		
  DEFINE act_arr DYNAMIC ARRAY OF RECORD
    act_date DATE,
    act_act CHAR(50),
    act_tit VARCHAR(10), -- cont_title VARCHAR(10),
    act_conf VARCHAR(20),  --cont_fname VARCHAR(20),
    act_conl VARCHAR(20),  --cont_lname VARCHAR(20),
    act_state CHAR(10),
    act_cost MONEY(8,2),
    act_priority SMALLINT
  END RECORD
  
  DEFINE cont_list DYNAMIC ARRAY OF RECORD
    cont_name STRING
    #cont_lname VARCHAR(25)  
  END RECORD
  
  DEFINE cont_rec DYNAMIC ARRAY OF RECORD
    cont_id INTEGER,
    cont_group_id VARCHAR(20),     
    cont_title VARCHAR(10),
    cont_fname VARCHAR(20),
    cont_lname VARCHAR(20),
    cont_country VARCHAR(20),
    
    
		cont_phone     CHAR(15),
		cont_mobile    CHAR(15),
		cont_fax       CHAR(15),    
    cont_email VARCHAR(100),    
    cont_url VARCHAR(200),
        
    cont_dob DATE,

    #cont_re INTEGER,
    #cont_rp INTEGER,
    #cont_rl INTEGER,
    cont_type SMALLINT,
    cont_memo CHAR(5000),
    cont_picture STRING
  END RECORD  

  DEFINE t_cont_rec TYPE AS RECORD
    cont_id INTEGER,
    cont_group_id VARCHAR(20),     
    cont_title VARCHAR(10),
    cont_fname VARCHAR(20),
    cont_lname VARCHAR(20),
    cont_country VARCHAR(20),
    cont_dob DATE,
    cont_email VARCHAR(100),
    cont_url VARCHAR(200),
    cont_re INTEGER,
    cont_rp INTEGER,
    cont_rl INTEGER,
    cont_type SMALLINT,
    cont_memo CHAR(5000) --
    #cont_picture VARCHAR(40)
  END RECORD
  
  DEFINE contGroupIdList DYNAMIC ARRAY OF STRING
END GLOBALS