sub init()
  'Todo: load in a task
  config = parseJson(ReadAsciiFile("pkg:/config/config.json"))
  m.global.addFields({"config": config})
end sub
