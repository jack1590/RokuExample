sub main()
    screen= CreateObject("roSGScreen")
    m.port= CreateObject("roMessagePort")
    screen.setMessagePort(m.port)
    Scene= screen.CreateScene("MainScene")

    screen.show()
    while(true)
        msg= wait(0, m.port)
        msgType= type(msg)
        if msgType= "roSGScreenEvent"
            if msg.isScreenClosed()then return
        end if
    end while
end sub

sub setApplicationTheme()
    app = createObject("roAppManager")
    theme = createObject("roAssociativeArray")
    theme.backgroundColor = "100"
    app.setTheme(theme)
end sub
