sub init()
  m.infoMoviesTask = CreateObject("roSGNode", "InfoMoviesTask")
  m.infoMoviesTask.observeField("output", "onInfoRecived")
  m.group = m.top.findNode("group") 
  m.title = m.top.findNode("title")
  m.rowList = m.top.findNode("rowList")

  m.top.observeField("focusedChild", "onFocusChanged")

  m.title.font = m.global.config.fonts.large

  centerNode()
end sub
  
sub centerNode()
  deviceInfo = CreateObject("roDeviceInfo")
  uiResolution = deviceInfo.GetUiResolution() 

  xAxis = (uiResolution.width/2)
  yAxis = 200
  m.group.translation = [xAxis, yAxis]
end sub

sub onFocusChanged(event)
  if m.top.isInFocusChain() and not m.rowList.isInFocusChain()
    m.infoMoviesTask.control = "RUN"
  end if 
end sub


sub onInfoRecived(event)
  m.infoMoviesTask = invalid
  m.rowList.content = event.getData()
  m.rowList.setFocus(true)
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
