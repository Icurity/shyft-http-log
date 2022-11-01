package = "kong-plugin-shyft-http-log"
version = "1.0-3"

source = {
  url = "https://github.com/Icurity/shyft-http-log.git"
}

description = {
  summary = "send http requests and responses to loki in the event of failure",
  license = "MIT"
}

dependencies = {
  "lua ~> 5.1"
}

build = {
  type = "builtin",
  modules = {
    ["kong-plugin-shyft-http-log.handler"] = "plugin/handler.lua",
    ["kong-plugin-shyft-http-log.schema"] = "plugin/schema.lua",
  }
}
