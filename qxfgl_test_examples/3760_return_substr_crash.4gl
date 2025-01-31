main
define message_txt char(80)
define fgl_return smallint
call center_txt("hola",80) returning message_txt
DISPLAY "|",message_txt,"|"
end main


function center_txt(cadena,l)
  define cadena char(255),
         l smallint
  let cadena=((l-length(cadena))/2) spaces,cadena clipped
  return cadena[1,l]
end function