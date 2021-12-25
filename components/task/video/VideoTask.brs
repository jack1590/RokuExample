sub init()
    m.top.functionName = "requestVideo"
end sub
sub requestVideo()
    baseUrl = m.global.config.api.baseUrl  + "vod/" + m.top.movie + "/stream"
    request = CreateObject("roUrlTransfer")
    request.setUrl(baseUrl)
    request.AddHeader("X-API-TOKEN", m.global.apiToken)
    stringResponse = request.getToString()
    response = parseJson(stringResponse)

    content = createObject("roSGNode", "ContentNode")
    content.url = response.url

    m.top.output = content
end sub