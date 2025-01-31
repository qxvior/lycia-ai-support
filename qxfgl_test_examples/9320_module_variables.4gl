# Project: lyc1000
# Filename: 9320_modu_variables.4gl
# Created By: alch
# Creation Date: Sep 21, 2023

GLOBALS 
    DEFINE glob_bigint BIGINT = 101
    DEFINE glob_bigserial BIGSERIAL = 102
    DEFINE glob_boolean BOOLEAN = TRUE
    DEFINE glob_char CHAR(16) = "glob char"
    DEFINE glob_date DATE = "09/19/2021"
    DEFINE glob_datetime DATETIME YEAR TO FRACTION(5) = "2021-09-19 23:59:59.99999"
    DEFINE glob_decimal DECIMAL = 123.45
    DEFINE glob_dictionary DICTIONARY OF RECORD i INT, s STRING END RECORD
    DEFINE glob_float FLOAT = 67.89
    DEFINE glob_hashmap HASHMAP OF RECORD i INT, s STRING END RECORD
    DEFINE glob_int8 INT8 = 12345678
    DEFINE glob_integer INTEGER = 987654321
    DEFINE glob_interval_year INTERVAL YEAR TO MONTH = "2021-09"
    DEFINE glob_interval_day INTERVAL DAY TO FRACTION(5) = "19 08:19:59.99999"
    DEFINE glob_varchar VARCHAR(16) = "acegikmoqsuwy"
    DEFINE glob_lvarchar LVARCHAR --= "abcdefghijklmnopqrstuvwxyz"
    DEFINE glob_money MONEY = 120567.34
    DEFINE glob_nchar NCHAR(16) = "常用國字標準字體"
    DEFINE glob_nvarchar NVARCHAR(16) = "常用國字標準字體表"
    DEFINE glob_serial SERIAL = 103
    DEFINE glob_serial8 SERIAL8 = 104
    DEFINE glob_smallfloat SMALLFLOAT = 98.76
    DEFINE glob_smallint SMALLINT = 9876
    DEFINE glob_string STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    DEFINE glob_tinyint TINYINT = 5
    DEFINE glob_record RECORD 
        fname STRING,
        lname STRING
    END RECORD
    DEFINE glob_arr_record DYNAMIC ARRAY OF RECORD
        fname STRING,
        lname STRING
    END RECORD 
END GLOBALS

DEFINE modu_bigint BIGINT = 201
DEFINE modu_bigserial BIGSERIAL = 202
DEFINE modu_boolean BOOLEAN = FALSE
DEFINE modu_char CHAR(16) = "modular char"
DEFINE modu_date DATE = "07/11/1984"
DEFINE modu_datetime DATETIME YEAR TO FRACTION(5) = "1984-07-11 00:00:00.99999"
DEFINE modu_decimal DECIMAL = 234.56
DEFINE modu_dictionary DICTIONARY OF RECORD i INT, s STRING END RECORD
DEFINE modu_float FLOAT = 78.91
DEFINE modu_hashmap HASHMAP OF RECORD i INT, s STRING END RECORD
DEFINE modu_int8 INT8 = 87654321
DEFINE modu_integer INTEGER = 123456789
DEFINE modu_interval_year INTERVAL YEAR TO MONTH = "1984-07"
DEFINE modu_interval_day INTERVAL DAY TO FRACTION(5) = "11 00:00:00.99999"
DEFINE modu_varchar VARCHAR(16) = "bdfhjlnprtvxz"
DEFINE modu_lvarchar LVARCHAR --= "zyxwvutsrqponmlkjihgfedcba"
DEFINE modu_money MONEY = 765021.43
DEFINE modu_nchar NCHAR(16) = "常用國字標準字"
DEFINE modu_nvarchar NVARCHAR(16) = "用國字標準字體表"
DEFINE modu_serial SERIAL = 203
DEFINE modu_serial8 SERIAL8 = 204
DEFINE modu_smallfloat SMALLFLOAT = 76.98
DEFINE modu_smallint SMALLINT = 6789
DEFINE modu_string STRING = "ZYXWVUTSRQPONMLKJIHGFEDCBA"
DEFINE modu_tinyint TINYINT = 6    
DEFINE modu_record RECORD 
    fname STRING,
    lname STRING
END RECORD
DEFINE modu_arr_record DYNAMIC ARRAY OF RECORD
    fname STRING,
    lname STRING
END RECORD 

MAIN
    DEFINE l_bigint BIGINT = 301
    DEFINE l_bigserial BIGSERIAL = 302
    DEFINE l_boolean BOOLEAN = TRUE
    DEFINE l_char CHAR(16) = "local char"
    DEFINE l_date DATE = "11/06/1961"
    DEFINE l_datetime DATETIME YEAR TO FRACTION(5) = "1961-11-06 12:34:56.88888"
    DEFINE l_decimal DECIMAL = 567.43
    DEFINE l_dictionary DICTIONARY OF RECORD i INT, s STRING END RECORD
    DEFINE l_float FLOAT = 98.71
    DEFINE l_hashmap HASHMAP OF RECORD i INT, s STRING END RECORD
    DEFINE l_int8 INT8 = 43215678
    DEFINE l_integer INTEGER = 567894321
    DEFINE l_interval_year INTERVAL YEAR TO MONTH = "1961-11"
    DEFINE l_interval_day INTERVAL DAY TO FRACTION(5) = "06 12:34:56.88888"
    DEFINE l_varchar VARCHAR(16) = "zxvtrpnljhfdb"
    DEFINE l_lvarchar LVARCHAR  --= "nmlkjihgfedcbazyxwvutsrqpo"
    DEFINE l_money MONEY = 456873.57
    DEFINE l_nchar NCHAR(16) = "常用國字標準"
    DEFINE l_nvarchar NVARCHAR(16) = "國字標準字體表"
    DEFINE l_serial SERIAL = 303
    DEFINE l_serial8 SERIAL8 = 304
    DEFINE l_smallfloat SMALLFLOAT = 69.78
    DEFINE l_smallint SMALLINT = 8976
    DEFINE l_string STRING = "NMLKJIHGFEDCBAZYXWVUTSRQPO"
    DEFINE l_tinyint TINYINT = 3
    DEFINE l_record RECORD 
        fname STRING,
        lname STRING
    END RECORD
    DEFINE l_arr_record DYNAMIC ARRAY OF RECORD
        fname STRING,
        lname STRING
    END RECORD 

    LET glob_dictionary["gdict1"].i = 4
    LET glob_dictionary["gdict1"].s = "four"
    LET glob_dictionary["gdict2"].i = 7
    LET glob_dictionary["gdict2"].s = "seven"

    LET modu_dictionary["mdict1"].i = 5
    LET modu_dictionary["mdict1"].s = "five"
    LET modu_dictionary["mdict2"].i = 8
    LET modu_dictionary["mdict2"].s = "eight"

    LET l_dictionary["ldict1"].i = 6
    LET l_dictionary["ldict1"].s = "six"
    LET l_dictionary["ldict2"].i = 9
    LET l_dictionary["ldict2"].s = "nine"

    LET glob_hashmap["ghashmap1"].i = 1
    LET glob_hashmap["ghashmap1"].s = "one"
    LET glob_hashmap["ghashmap2"].i = 4
    LET glob_hashmap["ghashmap2"].s = "four"

    LET modu_hashmap["mhashmap1"].i = 2
    LET modu_hashmap["mhashmap1"].s = "two"
    LET modu_hashmap["mhashmap2"].i = 5
    LET modu_hashmap["mhashmap2"].s = "five"

    LET l_hashmap["lhashmap1"].i = 3
    LET l_hashmap["lhashmap1"].s = "three"
    LET l_hashmap["lhashmap2"].i = 6
    LET l_hashmap["lhashmap2"].s = "six"

    LET glob_record.fname = "Alex"
    LET glob_record.lname = "Chubar"

    LET modu_record.fname = "Alex"
    LET modu_record.lname = "Bondar"

    LET l_record.fname = "Alex"
    LET l_record.lname = "Shloma"
    
    LET glob_lvarchar = "abcdefghijklmnopqrstuvwxyz"
    LET modu_lvarchar = "zyxwvutsrqponmlkjihgfedcba"
    LET l_lvarchar = "nmlkjihgfedcbazyxwvutsrqpo"

    LET glob_arr_record[1].fname = "Mehdi"
    LET glob_arr_record[1].lname = "Afshar"
    LET glob_arr_record[2].fname = "Hubert"
    LET glob_arr_record[2].lname = "Hoelzl"

    LET modu_arr_record[1].fname = "Anna"
    LET modu_arr_record[1].lname = "Bliznetsova"
    LET modu_arr_record[2].fname = "Nataliya"
    LET modu_arr_record[2].lname = "Fediy"

    LET l_arr_record[1].fname = "Vladyslav"
    LET l_arr_record[1].lname = "Nebozhyn"
    LET l_arr_record[2].fname = "Victor"
    LET l_arr_record[2].lname = "Orlov" 

    DISPLAY "Ok"
END MAIN 
