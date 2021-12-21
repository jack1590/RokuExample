sub init()
    m.top.functionName = "requestVideo"
end sub
sub requestVideo()
    baseUrl = m.global.config.api.baseUrl  + m.top.movie + "/stream"
    request = CreateObject("roUrlTransfer")
    request.setUrl(baseUrl)
    request.AddHeader("X-API-TOKEN", m.global.apiToken)
    stringResponse = request.getToString()
    response = parseJson(stringResponse)

    content = createObject("roSGNode", "ContentNode")
    videoSection = content.createChild("ContentNode")
    videoSection.title = "Video"

    for each obj in response
        item = videoSection.createChild("ContentNode")
        item.addFields({"videoUrl": obj.url})
    end for

    m.top.output = content
end sub