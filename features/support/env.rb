require "httparty"
require "cucumber"
require "rspec"

CONFIG = YAML.load_file(File.join(Dir.pwd, "configs/#{ENV["ENV_TYPE"]}.yml"))
