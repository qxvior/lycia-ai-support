define gr_daz record
   daz_smallint   smallint,
   daz_decimal    decimal(10,5),
   daz_integer    integer,
   daz_float      float,
   daz_money      money(10,2),
   daz_nchar      nchar(100),
   daz_varchar    varchar(100),
   daz_text       text,
   daz_date       date,
   daz_datetime   datetime year to second,
   daz_interval   interval year to month
end record
MAIN

   display "SMALLINT ",gr_daz.daz_smallint
   display "DECIMAL ",gr_daz.daz_decimal
   display "INTEGER ",gr_daz.daz_integer
   display "FLOAT ",gr_daz.daz_float
   display "MONEY ",gr_daz.daz_money
   display "NCHAR ",gr_daz.daz_nchar
   display "VARCHAR ",gr_daz.daz_varchar
   display "DATE ",gr_daz.daz_date
   display "DATETIME ",gr_daz.daz_datetime
   display "INTERVAL ",gr_daz.daz_interval
display "============================"
end main