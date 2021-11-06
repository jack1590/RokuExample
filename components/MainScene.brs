sub init()
  m.top.backgroundURI = "pkg:/images/DeepSpace.jpg"
  m.config = CreateObject("RoSGNode", "Config")
  m.apiTokenTask = CreateObject("RoSGNode", "ApiTokenTask")

  getApiToken()
end sub

sub getApiToken()
  m.apiTokenTask.control = "RUN"
  m.apiTokenTask.observeField("token", "onTokenRecived")
end sub

sub onTokenRecived(event)
  m.global.addFields({"apiToken": event.getData()})
  stop
end sub
