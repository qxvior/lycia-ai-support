main
  define inArg string
  let inArg = arg_val(1)

  if length (inArg) <> 0 then
    call ui.Application.GetCurrent().SetClassNames(["position_restore"])
  end if

  open window w with form '4891_window_position_restore' attribute(border)
  call fgl_getkey()
end main