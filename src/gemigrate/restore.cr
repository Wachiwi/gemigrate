require "admiral"
require "file_utils"
require "file"

module Gemigrate
  class Restore < Admiral::Command
    define_help description: "Restore a backup of a old gempack."

    @gempack = Array(String).new

    define_argument gempack_file

    @@file_name = ".gempack"
    @@gempack_file = "#{FileUtils.pwd}/#{@@file_name}"

    def check_args
      @@gempack_file = arguments.gempack_file || @@gempack_file unless arguments.gempack_file.nil?
      unless arguments.gempack_file.nil?
        @@file_name = @@gempack_file.split('/').last
      end
    end

    def read_gempack
      if File.exists? @@gempack_file
        @gempack = File.read_lines @@gempack_file
      else
        puts "[Error] gempack with the name '#{@@file_name}' not found!".colorize :red
        Process.exit 1
      end
    end

    def install_gems
      puts "[Info] Installing #{@gempack.size} gems! That could take a while...".colorize :cyan
      output = `gem install #{@gempack.join(' ')}`
      if $? != 0
        puts "[Error] A error seems to be occurred! See .gempack.log for more details!".colorize :red
        File.write ".gempack.log", output
        Process.exit 1
      end
    end

    def run
      check_args
      read_gempack
      if @gempack.empty?
        puts "[Warning] No gems in gempack? Cancelling...".colorize :yellow
        Process.exit 0
      end
      install_gems
      puts "[Info] Gems installed!".colorize :cyan
    end
  end
end
