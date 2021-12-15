sub init() 
  m.title = m.top.findNode("title")
  m.description = m.top.findNode("description")
  m.poster = m.top.findNode("poster")
  m.playButton = m.top.findNode("playButton")
  m.backButton = m.top.findNode("backButton")
  m.title.font = m.global.config.fonts.large
  m.description.font = m.global.config.fonts.small
  m.top.observeField("content", "onContentReceived")
  m.top.observeField("focusedChild", "onFocusedChanged")
end sub

sub onFocusedChanged()
  if m.top.hasFocus()
    m.playButton.setFocus(true)
  end if
end sub

sub onContentReceived(event)
  content = event.getData()
  m.poster.uri = content.FHDPOSTERURL
  m.title.text = content.TITLE
  m.description.text = content.DESCRIPTION
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
  handled = false
  if press
    if (key = "down" and m.playButton.hasFocus())
      m.backButton.setFocus(true)
    else if (key = "up" and m.backButton.hasFocus())
      m.playButton.setFocus(true)
    end if
  end if 
  return handled
end function