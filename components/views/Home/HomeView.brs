sub init()
  m.infoMoviesTask = CreateObject("roSGNode", "InfoMoviesTask")
  m.infoMoviesTask.observeField("output", "onInfoRecived")
  m.group = m.top.findNode("group") 
  m.title = m.top.findNode("title")
  m.rowList = m.top.findNode("rowList")

  m.top.observeField("focusedChild", "onFocusChanged")
  m.rowList.observeField("rowItemSelected", "onRowItemSelected")

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
    if m.infoMoviesTask <> invalid
      m.infoMoviesTask.control = "RUN"
    else
      m.rowList.setFocus(true)
    end if
  end if 
end sub

sub onInfoRecived(event)
  m.infoMoviesTask = invalid
  m.rowList.content = event.getData()
  m.rowList.setFocus(true)
end sub

sub onRowItemSelected(event)
  indexPositions = event.getData()
  content = m.rowList.content.getChild(indexPositions[0]).getChild(indexPositions[1])
  fields = {"content": content}
  m.top.getScene().viewHandler.callFunc("goToView", {"name": "DetailView", "fields": fields})
end sub
