sub init()
  m.top.backgroundURI = "pkg:/images/DeepSpace.jpg"

  m.viewHandler = CreateObject("RoSGNode","ViewHandler")
  m.top.viewHandler = m.viewHandler
  m.top.appendChild(m.viewHandler)

  m.apiTokenTask = CreateObject("RoSGNode", "ApiTokenTask")
  m.global.addFields({"config": {}})
  m.global.observeField("config", "onConfigReady")
  m.config = CreateObject("RoSGNode", "Config")

end sub

sub onConfigReady()
  m.global.unobserveField("config")
  m.apiTokenTask.observeField("token", "onTokenRecived")
  m.apiTokenTask.control = "RUN"
end sub

sub onTokenRecived(event)
  m.apiTokenTask = invalid
  m.global.addFields({"apiToken": event.getData()})
  m.viewHandler.goToView = "HomeView"
end sub

function onKeyEvent(key, press) as boolean
  handle = false
  if(press)
    if(key = "options")
      m.viewHandler.goToView = "SearchView"
      handle = true
    else if(key = "back")
      m.viewHandler.callFunc("backView")
      handle = true
    end if
  end if

  return handle
end function
