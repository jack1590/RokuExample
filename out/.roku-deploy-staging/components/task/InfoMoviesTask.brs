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
end function