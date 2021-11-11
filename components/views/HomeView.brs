sub init()
    m.infoMoviesTask = CreateObject("roSGNode", "infoMoviesTask")
    m.infoMoviesTask.observeField("output", "onInfoRecived")
    m.group = m.top.findNode("group")
    m.rowList = m.top.findNode("rowList")
  
    centerNode()
  end sub
  
  sub centerNode()
    deviceInfo = CreateObject("roDeviceInfo")
    uiResolution = deviceInfo.GetUiResolution() 
  
    xAxis = (uiResolution.width/2)
    yAxis = 200
    m.group.translation = [xAxis, yAxis]
  end sub

sub onInfoRecived(event)
    m.rowList.content = event.getData()
end sub
