sub init()
    m.top.functionName = "getToken"
end sub

function getToken()
    baseUrl = m.global.config.api.baseUrl
    request = CreateObject("roUrlTransfer")
    request.setUrl(baseUrl)
    stringResponse = request.getToString()
    response = parseJson(stringResponse)

    m.top.token = response.apiToken
end function