sub init()
    m.background = m.top.findNode("background")
    m.profile = m.top.findNode("profile")
    m.name = m.top.findNode("name")
    
    m.top.observeField("itemContent", "onItemContentChanged")
   
end sub

sub onItemContentChanged(event)
    item = event.getData()
    m.profile.uri = item.FHDPOSTERURL
    m.name.text = item.Title
end sub
