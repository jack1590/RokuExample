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

    content = createObject("roSGNode", "ContentNode")
    movieSection = content.createChild("ContentNode")
    movieSection.title = "Movies"
    serieSection = content.createChild("ContentNode")
    serieSection.title = "Series"
    seasonSection = content.createChild("ContentNode")
    seasonSection.title = "Seasons"
    episodeSection = content.createChild("ContentNode")
    episodeSection.title = "Episodes"

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

        if obj.type = "movie" then movieSection.appendChild(item)
        if obj.type = "series" then serieSection.appendChild(item)
        if obj.type = "season" then seasonSection.appendChild(item)
        if obj.type = "episode" then episodeSection.appendChild(item)
    end for

    m.top.output = content
end function
