sub init()
    m.focusEdge = m.top.findNode("focusEdge")

    m.top.observeField("focusedChild", "onFocusedChanged")
   
end sub
sub onFocusedChanged(event)
    if m.top.isInFocusChain()
        m.focusEdge.color= "#00D4D9"
    else 
        m.focusEdge.color= "#00D4D900"
    end if
end sub