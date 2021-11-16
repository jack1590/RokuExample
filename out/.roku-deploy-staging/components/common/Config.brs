sub init()
  m.global.setField("config", Config())
end sub

function Config()
  return {
    "api": {
        "baseUrl": "http://192.168.1.211:8080/"
    },
    "fonts": {
      "large": createFont("pkg:/fonts/Netflix-Semibold.ttf", 74),
      "medium": createFont("pkg:/fonts/Netflix-Semibold.ttf", 74),
      "small": createFont("pkg:/fonts/Netflix-Semibold.ttf", 74)
    }
  }
end function

function createFont(uri, size)
  font  = CreateObject("roSGNode", "Font")
  font.uri = uri
  font.size = size

  return font
end function
