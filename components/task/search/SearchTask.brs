sub init()
    m.top.functionName = "getSearchResults"
end sub

function getSearchResults()
    baseUrl = m.global.config.api.baseUrl + "vod/search?s=" + m.top.query
    request = CreateObject("roUrlTransfer")
    request.setUrl(baseUrl)
    request.AddHeader("X-API-TOKEN", m.global.apiToken)
    stringResponse = request.getToString()
    response = parseJson(stringResponse)

    content = createObject("roSGNode", "ContentNode")
    searchSection = content.createChild("ContentNode")
    searchSection.title = "Results"

    for each obj in response
        item = createObject("RoSgNode", "ContentNode")
        item.FHDPOSTERURL = "https://johnhockenberry.com/es/wp-content/uploads/sites/5/2021/09/you-season-3-october-2021-release-date-what-we-know-so-far-scaled.jpg"
        item.HDPOSTERURL = "https://johnhockenberry.com/es/wp-content/uploads/sites/5/2021/09/you-season-3-october-2021-release-date-what-we-know-so-far-scaled.jpg"
        item.SDPOSTERURL = "https://johnhockenberry.com/es/wp-content/uploads/sites/5/2021/09/you-season-3-october-2021-release-date-what-we-know-so-far-scaled.jpg"
        item.Description = obj.description
        item.Title = obj.title
        item.id = obj.id
        item.ContentType = obj.type
        item.EpisodeNumber = obj.episodeNo.toStr()
        item.addFields({"parentId": obj.parentId, "seasonNumber": obj.seasonNo.toStr()})

    end for

    m.top.output = content
end function
