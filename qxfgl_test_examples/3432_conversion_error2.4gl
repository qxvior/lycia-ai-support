main
define a interval hour(3) to minute
let a = "20:15"
menu "Test"
    command "Comparison with 0"
        if a < 0 then --Informix 4GL evaluates as false, Lycia as true
          error "Lower than 0"
        end if
    command "Comparison width 1" --Informix 4GL evaluates as false, Lycia as true
        if a < 1 then
          error "Lower than 1"
        end if
    command "Comparison with '00:00'" --Informix 4GL evaluates as false, Lycia as false
        if a < "00:00" then
          error "Lower than 00:00"
        end if
    command "Exit"
        exit menu
end menu
end main