DATABASE stores
MAIN
 DEFINE query_text VARCHAR(200)

    LET query_text = "select fname from customer where customer_num=108 "
    PREPARE curs_per FROM query_text
    LET query_text = "select fname from customer where customer_num=101 "
    PREPARE curs_per FROM query_text
    DECLARE curs_dec CURSOR FOR curs_per
    FOREACH curs_dec INTO query_text
    END FOREACH
    DISPLAY query_text
END MAIN
