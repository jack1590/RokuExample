sub init()
  m.top.backgroundURI = "pkg:/images/DeepSpace.jpg"

  m.apiTokenTask = CreateObject("RoSGNode", "ApiTokenTask")
  m.global.addFields({"config": {}})
  m.global.observeField("config", "onConfigReady")
  m.config = CreateObject("RoSGNode", "Config")
  m.searchTask = CreateObject("RoSGNode", "SearchTask")

end sub

sub onConfigReady()
  m.global.unobserveField("config")
  m.apiTokenTask.observeField("token", "onTokenRecived")
  m.apiTokenTask.control = "RUN"
end sub

sub onTokenRecived(event)
  m.apiTokenTask = invalid
  
  m.global.addFields({"apiToken": event.getData()})

  m.homeView = m.top.createChild("HomeView")
  m.homeView.setFocus(true)
  m.searchTask.control = "RUN"
end sub