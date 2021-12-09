sub init()
    m.vodItem = m.top.findNode("VodItem")
    m.name = m.top.findNode("name")
    m.group = m.top.findNode("group")
    
    m.top.observeField("itemContent", "onItemContentChanged")
   
end sub

sub onItemContentChanged(event)
    item = event.getData()
    m.vodItem.uri = item.FHDPOSTERURL
    m.vodItem.height = m.top.getParent().itemSize[1] - 100
    m.vodItem.width = m.top.getParent().itemSize[0] - 10
    m.group.translation = [m.vodItem.width/2, 0 ]
    m.name.text = item.Title
end sub
