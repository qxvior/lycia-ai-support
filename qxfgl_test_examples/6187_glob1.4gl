GLOBALS 
	DEFINE glob_yes_flag BOOLEAN
	DEFINE glob_no_flag STRING
	DEFINE glob_rec_opparms STRING 
	DEFINE glob_rec_country STRING 
	DEFINE glob_rec_orderhead STRING 
	DEFINE glob_rec_customer STRING 
	DEFINE glob_rec_sales_order_parameter RECORD 
		def_paydetl_flag char(1), 
		paydetl_flag char(1), 
		def_suppl_flag char(1), 
		suppl_flag char(1), 
		supp_ware_code STRING, 
		base_curr_code STRING, 
		order_date DATE, 
		ship_date DATE, 
		complete_flag char(1), 
		owner_text char(8),
		pick_ind SMALLINT 
	END RECORD 
	DEFINE glob_status_ind char(1) 
	DEFINE glob_currord_amt decimal(16,2) 
	DEFINE glob_temp_text VARCHAR(200) 
END GLOBALS  
