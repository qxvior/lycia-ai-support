MAIN
   DEFINE main_menu_id INT
   DEFINE submenu1_id,exit_id INT
   DEFINE action_id STRING

   LET main_menu_id = create_menu()
   LET submenu1_id = menu_add_submenu(main_menu_id, "menu1")

   CALL menu_add_option(submenu1_id, "menu1_submenu1  ",101)
   CALL menu_add_option(submenu1_id, "menu1_submenu2  ",102)
   CALL menu_add_option(submenu1_id, "menu1_submenu3  ",103)
   CALL menu_add_option(submenu1_id, "run child  ", "qrun child")
   LET exit_id = menu_add_option(main_menu_id, "exit","actExit")

   LET action_id = 0

   WHILE TRUE
      CALL menu_publish()
      LET action_id = execute_menu()
      IF action_id = 0 THEN
         CONTINUE WHILE
      END IF
      CASE action_id
         WHEN 101
            DISPLAY "you pressed 'menu1_submenu1'" AT 5,1
         WHEN 102
            DISPLAY "you pressed 'menu1_submenu2'" AT 5,1
         WHEN 103
            DISPLAY "you pressed 'menu1_submenu3'" AT 5,1 ATTRIBUTE (BLUE)
         WHEN "actExit"
            EXIT WHILE
         OTHERWISE
            RUN action_id
      END CASE
   END WHILE
   DISPLAY "DONE"
END MAIN