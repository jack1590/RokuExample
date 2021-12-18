sub init()
    m.focusEdge = m.top.findNode("focusEdge")
    m.name = m.top.findNode("name")
    m.background = m.top.findNode("background")
    m.top.observeField("focusedChild", "onFocusedChanged")
   
end sub

sub onFocusedChanged(event)
    if m.top.isInFocusChain()
        m.focusEdge.color= "#00D4D9"
    else 
        m.focusEdge.color= "#00D4D900"
    end if
end sub

sub onTextChanged(event)
    xAxis = (m.background.width / 2) - (m.name.boundingRect().width/2)
    yAxis = (m.background.height / 2) - (m.name.boundingRect().height/2)
    
    m.name.translation = [xAxis, yAxis]
end sub
