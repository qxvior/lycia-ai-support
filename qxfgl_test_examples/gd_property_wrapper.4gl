#########################################################################################################
# Wrapper Functions for Script Properties
#
# Modification History:
# 01.12.06 HH - Created
#########################################################################################################


#! set the background image/color for a window.
#! parameters: 
#! image: name of the image file
#! style: the style ( NORMAL | TILED | STRETCHED | CENTERED )
#! x: The starting column
#! y: The starting row
#! width: Width of the image in column
#! height: Height of the image in rows
#! 4GL background color for the window

  #Set Grid Control Properties
  #CALL set_header_font("Arial", 9, "bold")
  #CALL set_grid_font("Arial", 9, "bold")

FUNCTION set_window_background(image, winStyle, x, y, width, height, color)
  DEFINE image VARCHAR(255)
  DEFINE winStyle VARCHAR(16)
  DEFINE x, y, width, height INTEGER
  DEFINE color VARCHAR(16)

  IF image IS NOT NULL THEN
    CALL fgl_set_property("gui", "window.background.image", image)
  END IF

  IF winStyle IS NOT NULL THEN
    CALL fgl_set_property("gui", "window.background.winStyle", winStyle)
  END IF

  IF x IS NOT NULL THEN
    CALL fgl_set_property("gui", "window.background.x", x)
  END IF

  IF y IS NOT NULL THEN
    CALL fgl_set_property("gui", "window.background.x", y)
  END IF

  IF width IS NOT NULL THEN
    CALL fgl_set_property("gui", "window.background.x", width)
  END IF

  IF height IS NOT NULL THEN
    CALL fgl_set_property("gui", "window.background.x", height)
  END IF

  IF color IS NOT NULL THEN
    CALL fgl_set_property("gui", "window.background.x", color)
  END IF
END FUNCTION

#! set the titlebar icon for the current window

FUNCTION set_window_icon(icon)
  DEFINE icon VARCHAR(255)

  IF icon IS NOT NULL THEN
    CALL fgl_set_property("gui", "window.icon", icon)
  END IF
END FUNCTION

FUNCTION font_string(face, pitch, weight)
  DEFINE face VARCHAR(32)
  DEFINE pitch INTEGER
  DEFINE weight VARCHAR(32)
  DEFINE font_name VARCHAR(128)

  LET font_name = face, "-", weight, "-r--", pitch USING "<<&"

  RETURN font_name
END FUNCTION

#! set the font used for text within the current window

FUNCTION set_window_font(face, pitch, weight)
  DEFINE face VARCHAR(32)
  DEFINE pitch INTEGER
  DEFINE weight VARCHAR(32)
  DEFINE font_name VARCHAR(128)

  LET font_name = font_string(face, pitch, weight)
  CALL fgl_set_property("gui", "window.textfont", font_name)
END FUNCTION

#! set the font used for entry fields within the current window

FUNCTION set_field_font(face, pitch, weight)
  DEFINE face VARCHAR(32)
  DEFINE pitch INTEGER
  DEFINE weight VARCHAR(32)
  DEFINE font_name VARCHAR(128)

  LET font_name = font_string(face, pitch, weight)
  CALL fgl_set_property("gui", "window.fieldfont", font_name)
END FUNCTION

#! set the font face used in grid cells

FUNCTION set_grid_font(face, pitch, weight)
  DEFINE face VARCHAR(32)
  DEFINE pitch INTEGER
  DEFINE weight VARCHAR(32)
  DEFINE font_name VARCHAR(128)

  LET font_name = font_string(face, pitch, weight)
  CALL fgl_set_property("gui", "array.grid.cellfont", font_name)
END FUNCTION

#! Set the font face used in grid headers

FUNCTION set_header_font(face, pitch, weight)
  DEFINE face VARCHAR(32)
  DEFINE pitch INTEGER
  DEFINE weight VARCHAR(32)
  DEFINE font_name VARCHAR(128)

  LET font_name = font_string(face, pitch, weight)
  CALL fgl_set_property("gui", "array.grid.headerfont", font_name)
END FUNCTION

#! Set the default font used for all windows created after this call

FUNCTION set_default_font(face, pitch, weight)
  DEFINE face VARCHAR(32)
  DEFINE pitch INTEGER
  DEFINE weight VARCHAR(32)
  DEFINE font_name VARCHAR(128)

  LET font_name = font_string(face, pitch, weight)
  CALL fgl_set_property("gui", "default.font", font_name)
END FUNCTION

#! Set the verb used for command issued in a win[shell]exec()
#! style call. One of open (default)/edit/explore/print/properties

FUNCTION set_exec_verb(verb)
  DEFINE verb VARCHAR(32)

  IF verb IS NOT NULL THEN
    CALL fgl_set_property("gui", "window.winshellexec.verb", verb)
  END IF
END FUNCTION

#! set the window style for application windows created in a
#! win[shell]exec() style call

FUNCTION set_exec_window_style(winStyle)
  DEFINE winStyle VARCHAR(32)

  IF winStyle IS NOT NULL THEN
    CALL fgl_set_property("gui", "window.winshellexec.winStyle", winStyle)
  END IF
END FUNCTION

#! set the keypress to return to the application when the user double-clicks
#! within the window

FUNCTION set_double_click(key_name)
  DEFINE key_name VARCHAR(32)

  IF key_name IS NOT NULL THEN
    CALL fgl_set_property("gui", "window.doubleclick", key_name)
  END IF
END FUNCTION

#! The following functions determine the destination of text sent
#! to the message/error/help lines. Options include: 

#! form
#! line-number
#! statusbar
#! messagebox

#! 4GL ERROR instructions

FUNCTION set_error_line(line) 
  DEFINE line VARCHAR(32)

  IF line IS NOT NULL THEN
    CALL fgl_set_property("gui", "window.errorline", line)
  END IF
END FUNCTION

#! 4GL MESSAGE instructions

FUNCTION set_message_line(line) 
  DEFINE line VARCHAR(32)

  IF line IS NOT NULL THEN
    CALL fgl_set_property("gui", "window.messageline", line)
  END IF
END FUNCTION

#! field comments

FUNCTION set_comment_line(line) 
  DEFINE line VARCHAR(32)

  IF line IS NOT NULL THEN
    CALL fgl_set_property("gui", "window.commentline", line)
  END IF
END FUNCTION

#! help items associated with the current menu

FUNCTION set_help_line(line) 
  DEFINE line VARCHAR(32)

  IF line IS NOT NULL THEN
    CALL fgl_set_property("gui", "window.menuhelptextline", line)
  END IF
END FUNCTION

