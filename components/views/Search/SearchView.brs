sub init()

end sub
  
function onKeyEvent(key, press) as boolean
  handle  = false
  if press
    if key = "options"
      ' go to search view
      handle = true
    end if
  end if 

  return handle
end function
