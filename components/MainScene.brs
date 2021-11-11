sub init()
  m.top.backgroundURI = "pkg:/images/DeepSpace.jpg"
  m.config = CreateObject("RoSGNode", "Config")
  m.apiTokenTask = CreateObject("RoSGNode", "ApiTokenTask")
  m.infoMoviesTask = CreateObject("RoSGNode", "InfoMoviesTask")

  getApiToken()
end sub

sub getApiToken()
  m.apiTokenTask.observeField("token", "onTokenRecived")
  m.apiTokenTask.control = "RUN"
end sub

sub onTokenRecived(event)
  m.global.addFields({"apiToken": event.getData()})
  m.infoMoviesTask.control = "RUN"
  m.HomeView = m.top.findNode("homeView")
  m.HomeView.setFocus(true)
end sub

