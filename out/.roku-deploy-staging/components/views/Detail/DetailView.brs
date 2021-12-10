sub init() 
m.title = m.top.findNode("title")
m.description = m.top.findNode("description")
m.poster = m.top.findNode("poster")
m.title.font = m.global.config.fonts.large
m.description.font = m.global.config.fonts.small
m.poster.uri = m.global.vodDetail.FHDPOSTERURL
m.title.text = m.global.vodDetail.TITLE
m.description.text = m.global.vodDetail.DESCRIPTION
end sub
