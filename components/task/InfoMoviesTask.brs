sub init()
    m.top.functionName = "getInfo"
end sub

function getInfo()
    baseUrl = m.global.config.api.baseUrl + "vod"
    request = CreateObject("roUrlTransfer")
    request.setUrl(baseUrl)
    request.AddHeader("X-API-TOKEN", m.global.apiToken)
    stringResponse = request.getToString()
    response = parseJson(stringResponse)

    m.top.info = response

    content = createObject("roSGNode", "ContentNode")
    section = content.createChild("ContentNode")

    for each profile in response
        item = section.createChild("ContentNode")
        item.Description = profile.name
        item.Title = profile.name
        item.id = profile.id
        item.ContentType = profile.type
        item.EpisodeNumber = profile.episodeNo
        item.addFields({"parentId": profile.parentId})
    end for

    m.top.output = content

end function