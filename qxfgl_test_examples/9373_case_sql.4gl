database stores_demo 
MAIN
DEFINE c CHAR(20)

SELECT sum(CASE col_integer
				WHEN 0 THEN 1
				WHEN 1 THEN 2
				WHEN 2 THEN 3
			END)
		INTO c
        FROM table_for_select

	DISPLAY c
END MAIN