sub init() 
  m.group = m.top.findNode("group")
  m.title = m.top.findNode("title")
  m.description = m.top.findNode("description")
  m.poster = m.top.findNode("poster")
  m.playButton = m.top.findNode("playButton")
  m.backButton = m.top.findNode("backButton")
  m.video = m.top.findNode("video")
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
  m.content = event.getData()
  m.poster.uri = m.content.FHDPOSTERURL
  m.title.text = m.content.TITLE
  m.description.text = m.content.DESCRIPTION
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
  handled = false
  if press
    if (key = "down" and m.playButton.hasFocus())
      m.backButton.setFocus(true)
    else if (key = "up" and m.backButton.hasFocus())
      m.playButton.setFocus(true)
    else if (key = "OK")
      if m.playButton.isInFocusChain() then playVideo()
      if m.backButton.isInFocusChain() then goBack()
    end if
  end if 
  return handled
end function

sub goBack()
  m.top.getScene().viewHandler.callFunc("backView")
end sub

sub playVideo()
  m.videoTask = CreateObject("RoSGNode", "VideoTask")
  m.videoTask.movie = m.content.id
  m.videoTask.observeField("output", "onVideoSelected")
  m.videoTask.control = "RUN"
  m.video.control = "play"
  m.video.visible = true
  m.group.visible = false
  m.video.setFocus(true)
end sub

sub onVideoSelected(event)
  videoContent = event.getData()
  videoContent.title = m.content.title
  m.video.content = videoContent
  m.videoTask = invalid
end sub
