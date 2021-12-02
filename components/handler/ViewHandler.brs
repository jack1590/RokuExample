sub init()
    m.viewStack = []
end sub

sub onGoToViewChanged(event)
    name = event.getData()
    currentView = CreateObject("RoSGNode", name)
    m.top.appendChild(currentView)
    currentView.setFocus(true)
    lastView = m.viewStack.peek()
    if lastView <> invalid then lastView.visible = false
    m.viewStack.push(currentView) 
end sub

sub backView()
    toRemoveView = m.viewStack.pop() ' remove last element
    m.top.removeChild(toRemoveView)
    lastView = m.viewStack.peek() ' take the last element
    if(lastView <> invalid) 
        lastView.visible = true
        lastView.setFocus(true)
    end if
end sub
