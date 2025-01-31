###########
main
###########
CALL fgl_setenv("QX_COMPAT", "Informix4GL")
open window w1 at 1,1 with 10 rows ,78 columns
menu "Start menu"
   command "Option 01" "This option is first"
        error "The first option was activated."
   command "Option 02" "This option is second"
        error "The second option was activated."
   command "Option 03" "This option is third"
        menu "Inner menu"
           command "Option 001" "This option is first"
                error "The first inner option was activated."
           command "Option 002" "This option is first"
                error "The second inner option was activated."
                
           command "Return" "Return to start menu"
                exit menu
        end menu
   command "End" "Exit menu"
        exit menu
end menu
end main