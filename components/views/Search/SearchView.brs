sub init()
  m.inputKeyboard = m.top.findNode("inputKeyboard")
  m.searchResults = m.top.findNode("searchResults")
  m.searchTask = CreateObject("RoSGNode", "SearchTask")

  m.inputKeyboard.observeField("text", "onTextChanged")
  m.searchTask.observeField("output", "onSearchCompleted")
  m.top.observeField("focusedChild", "onFocusChanged")
end sub

sub onFocusChanged(event)
  if m.top.isInFocusChain() and not m.inputKeyboard.isInFocusChain()
    m.inputKeyboard.setFocus(true)
  end if 
end sub

sub onTextChanged(event)
  text = event.getData()
  if(text.len() >= 3 )
    m.searchTask.query = text
    m.searchTask.control = "RUN"
  else
    m.searchTask.control = "STOP"
    m.searchResults.content = invalid
  end if
end sub

sub onSearchCompleted(event)
  print "onSearchCompleted "
  m.searchResults.content = event.getData()
end sub
  
function onKeyEvent(key, press) as boolean
  handle  = false
  if press
    if(key = "right" and m.searchResults.content <> invalid and m.inputKeyboard.isInFocusChain())
      m.searchResults.setFocus(true)
      'm.top.getScene().viewHandler.goToView = "DetailView"
    else if(key = "left" and m.searchResults.isInFocusChain())
        m.inputKeyboard.setFocus(true)
    end if
  end if 

  return handle
end function
