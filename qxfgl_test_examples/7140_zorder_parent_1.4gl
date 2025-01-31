main
define ud char(20)
    open window win_pols at 8, 3 with form "7140/7140_zorder_parent_1" attribute (border)
      input by name ud
		ON KEY(F10)               
               run "7140_zorder_child_1" 
      end input
end main



