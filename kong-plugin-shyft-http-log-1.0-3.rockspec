package = "kong-plugin-jwt2header"
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
    ["kong.plugin.kong-jwt2header.handler"] = "plugin/handler.lua",
    ["kong.plugin.kong-jwt2header.schema"] = "plugin/schema.lua",
  }
}
