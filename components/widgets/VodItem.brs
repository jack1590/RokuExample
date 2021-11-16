sub init()
    m.background = m.top.findNode("background")
    m.vodItem = m.top.findNode("vodItem")
    m.name = m.top.findNode("name")
    
    m.top.observeField("itemContent", "onItemContentChanged")
   
end sub

sub onItemContentChanged(event)
    item = event.getData()
    m.vodItem.uri = item.FHDPOSTERURL
    m.name.text = item.Title
end sub
