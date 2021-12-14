sub init()
    m.viewStack = []
end sub

sub goToView(params)
    name = params.name
    fields = params.fields
    currentView = CreateObject("RoSGNode", name)
    if fields <> invalid then currentView.setFields(fields)
    m.top.appendChild(currentView)
    currentView.setFocus(true)
    lastView = m.viewStack.peek()
    if lastView <> invalid then lastView.visible = false
    m.viewStack.push(currentView) 
end sub

sub backView()
    'avoid to remove the main view
    if m.viewStack.count() = 1 then return
    toRemoveView = m.viewStack.pop() ' remove last element

    m.top.removeChild(toRemoveView)
    lastView = m.viewStack.peek() ' take the last element
    if(lastView <> invalid)
        lastView.visible = true
        lastView.setFocus(true)
    end if
end sub
