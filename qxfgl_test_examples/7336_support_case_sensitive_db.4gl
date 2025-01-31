database munis

main

    whenever error continue
    call table_or_column_contains_uppercase_letters()

end main

private function table_or_column_contains_uppercase_letters()
    define
          lv_option like GeneralLedgerSettings.GLOption -- (Compiling with an error)
--          lv_option like spsysrec.client_state -- (Compiles successfully)

	display "1. lv_option ",lv_option.gettypefullname()

end function