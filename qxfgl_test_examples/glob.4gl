GLOBALS


 define     f1 CHAR,  --Character strings, of size up to 32,767 bytes in length - default is 1 if not specified
      f2 CHAR(10),
      f3 CHARACTER(100), -- This keyword is a synonym for CHAR
      f4 VARCHAR,  --Character strings of varying length, for size =< 255 bytes - default = 1
      f5 VARCHAR(10,5),  --Character strings of varying length, for size =< 255 bytes
      f6 VARCHAR(255),  --Character strings of varying length, for size =< 255 bytes min 5 max 10
      f7 NCHAR, -- default size 1 - Character strings, of size up to 32,767 bytes in length
      f8 NCHAR(10),  -- Character strings, of size up to 32,767 bytes in length
      f9 NVARCHAR,	-- default size - Character strings of varying leng
      f10 NVARCHAR(250), -- Character strings of varying length, for size
      f11 TEXT,  --  Character strings of up to 2'31' bytes
      f11b TEXT,  --  Character strings of up to 2'31' bytes
      f12 SMALLINT, --  Whole numbers, from -32,767 to +32,767
      f13 INTEGER,  --  Whole numbers, from -2,147,483,647 to +2,147,483,647
      f14 INT, -- This keyword is a synonym for INTEGER
      f15 SMALLFLOAT,  -- Floating-point numbers, of up to 16-digit precision
      f16 REAL,  -- This keyword is a synonym for SMALLFLOAT - 
      f17 FLOAT,  -- Floating-point numbers, of up to 32-digit precision
      f18 DOUBLE PRECISION,  --synonym for Float
      f19 DECIMAL(30,15),  --Floating-point numbers, of a specified precision
      f20 DEC(8,2),  -- Fixed-point numbers, of a specified scale and precision, This keyword is a synonym for DECIMAL
      f21 NUMERIC(6),  --This keyword is a synonym for DECIMAL  (totoal length - precission defaults to 2)
      f22 NUMERIC,  -- Default precision is 16 (if not specified)
      f23 MONEY(8,2),  --  Currency amounts, with definable scale and precision
      f24 DATE,  --Points in time, specified as calendar dates
      f25 DATETIME YEAR TO DAY,  --Points in time, specified as calendar dates and time-of-day
      f26 INTERVAL YEAR TO MONTH,  --Spans of time in years and months, or in smaller time units

      f27 BYTE,  --Any kind of binary data, of length up to 231 bytes
      f27a BYTE,  --Any kind of binary data, of length up to 231 bytes
      f27b BYTE,  --Any kind of binary data, of length up to 231 bytes

      f28 BYTE,  --Any kind of binary data, of length up to 231 bytes
      f28a BYTE,  --Any kind of binary data, of length up to 231 bytes
      f28b BYTE,  --Any kind of binary data, of length up to 231 bytes

      info CHAR(4096) --,  --Character strings, of size up to 32,767 bytes in length - default is 1 if not specified

END GLOBALS