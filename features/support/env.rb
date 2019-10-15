require "httparty"
require "cucumber"
require "rspec"

api_configs = YAML.load_file('./features/support/api.yml')
$api = api_configs[$profile]