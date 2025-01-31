database stores

MAIN
    DEFINE lr_prodledg,p_rec_prodledg RECORD LIKE customer.*
   WHENEVER ANY ERROR CONTINUE
    DECLARE crs_scan_prodledg_ok CURSOR FOR
    SELECT *
    FROM customer
    WHERE fname = p_rec_prodledg.fname

    DISPLAY status
    DISPLAY sqlca.sqlcode
    FOREACH crs_scan_prodledg_ok INTO lr_prodledg.*
    END FOREACH
    DISPLAY status
    DISPLAY sqlca.sqlcode
    


    DECLARE crs_scan_prodledg_KO CURSOR FOR
    SELECT *
    FROM customer
    WHERE fname = p_rec_prodledg_prodledg.fname

    DISPLAY status
    DISPLAY sqlca.sqlcode

    FOREACH crs_scan_prodledg_KO INTO lr_prodledg.*
    END FOREACH
    DISPLAY status
    DISPLAY sqlca.sqlcode

END MAIN
