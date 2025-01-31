DATABASE stores_demo

MAIN
   DEFINE v_integer INTEGER
   DEFINE v_char    CHAR(20)

   DELETE FROM table_for_delete
   INSERT INTO table_for_delete VALUES(1,1,1.11,  "ROW 1  FOR REMOVAL","01/01/2011")
   INSERT INTO table_for_delete VALUES(2,2,2.22,  "ROW 2  FOR REMOVAL","01/02/2011")
   INSERT INTO table_for_delete VALUES(3,3,3.33,  "ROW 3  FOR REMOVAL","01/03/2011")
   INSERT INTO table_for_delete VALUES(4,4,4.44,  "ROW 4  FOR REMOVAL","01/04/2011")
   INSERT INTO table_for_delete VALUES(5,5,5.55,  "ROW 5  FOR REMOVAL","01/05/2011")
   INSERT INTO table_for_delete VALUES(6,6,6.66,  "ROW 6  FOR REMOVAL","01/06/2011")
   INSERT INTO table_for_delete VALUES(7,7,7.77,  "ROW 7  FOR REMOVAL","01/07/2011")
   INSERT INTO table_for_delete VALUES(8,8,8.88,  "ROW 8  FOR REMOVAL","01/08/2011")
   INSERT INTO table_for_delete VALUES(9,9,9.99,  "ROW 9  FOR REMOVAL","01/09/2011")
   INSERT INTO table_for_delete VALUES(10,10,10.1,"ROW 10 FOR REMOVAL","01/10/2011")

   DECLARE cur_delete CURSOR FOR SELECT * FROM table_for_delete WHERE id BETWEEN 2 AND 6 FOR UPDATE
   DECLARE dummy_cur  CURSOR FOR SELECT * FROM table_for_delete WHERE id BETWEEN 4 AND 6 FOR UPDATE

   BEGIN WORK
   OPEN cur_delete
   OPEN dummy_cur
   FETCH cur_delete
   FETCH dummy_cur

   DELETE FROM table_for_delete WHERE CURRENT OF cur_delete

   COMMIT WORK
   CLOSE cur_delete
   CLOSE dummy_cur
   FREE cur_delete
   FREE dummy_cur

   DECLARE cur_sel CURSOR FOR SELECT id,col_char FROM table_for_delete ORDER BY id
   OPEN cur_sel
   FOREACH cur_sel INTO v_integer,v_char
      DISPLAY v_integer," ",v_char
   END FOREACH
   CLOSE cur_sel
   FREE cur_sel
END MAIN