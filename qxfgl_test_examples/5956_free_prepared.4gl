# Project: lyc1000
# Filename: 5956_free_prepared.4gl
# Created By: alch
# Creation Date: Nov 13, 2020

DATABASE stores
MAIN
define lc_sql char(1024)
define gc_user_id integer
define lr_users record like customer.*
define ln_status integer

display "ok"
let gc_user_id = 101
let lc_sql =
	"select * ",
		"from customer c ",
		"where c.customer_num= ? "
	
prepare p_msg from lc_sql
declare c_msg cursor for p_msg

display "ok1"
free p_msg

display "ok2"
open c_msg using gc_user_id

display "ok3"
fetch c_msg into lr_users.*

display "ok4"
let ln_status = sqlca.sqlcode
display "ln_status=",ln_status
display lr_users
close c_msg

END MAIN
