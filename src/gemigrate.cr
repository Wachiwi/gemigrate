require "admiral"
require "./gemigrate/*"

# TODO: Write documentation for `Gemigrate`
module Gemigrate
  class Main < Admiral::Command
    define_version <<-VERSION
    gemigrate #{Gemigrate::VERSION}
    Copyright David Schwarzmann, 2018
    License MIT
    VERSION

    register_sub_command backup : Backup
    register_sub_command restore : Restore

    define_help

    def run
      puts help
    end
  end
end

Gemigrate::Main.run
