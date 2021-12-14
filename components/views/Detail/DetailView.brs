sub init() 
  m.title = m.top.findNode("title")
  m.description = m.top.findNode("description")
  m.poster = m.top.findNode("poster")
  m.title.font = m.global.config.fonts.large
  m.description.font = m.global.config.fonts.small
  m.top.observeField("content", "onContentReceived")
end sub

sub onContentReceived(event)
  content = event.getData()
  m.poster.uri = content.FHDPOSTERURL
  m.title.text = content.TITLE
  m.description.text = content.DESCRIPTION
end sub
