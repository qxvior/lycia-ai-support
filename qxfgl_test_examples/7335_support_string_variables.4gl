database munis

main

    whenever error continue
    call select_value_into_string()

end main

function select_value_into_string()
    define
        lv_string string,
        lv_char2  char(2)

    prepare select_state from "select client_state from spsysrec"
    execute select_state into lv_string
    display "state=|", lv_string, "|"

    execute select_state into lv_char2
    display "state=|", lv_char2, "|"

end function
