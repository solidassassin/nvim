local config = require("config_loader")

local conf = {}

-- Common configuration options
conf.common = {}
-- Linux specific configuration options
conf.linux = {}
-- Mac specific configuration options
conf.mac = {}
-- Windows specific configuration options
conf.win = {}

config.setup(conf)
