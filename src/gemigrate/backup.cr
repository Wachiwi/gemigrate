require "admiral"
require "file_utils"
require "file"

module Gemigrate
  class Backup < Admiral::Command
    define_help description: "Generate a gempack of your current local installed gems."

    define_flag overwrite : Bool, "Overwrite the file if it exists", short: "f"
    define_argument gempack_file

    @@file_name = ".gempack"
    @@gempack_file = "#{FileUtils.pwd}/#{@@file_name}"

    @@gem_command = "gem query --local"

    @gempack = Array(String).new

    def write_gempack
      File.write @@gempack_file, @gempack.join('\n')
    end

    def check_args
      @@gempack_file = arguments.gempack_file || @@gempack_file unless arguments.gempack_file.nil?
      unless arguments.gempack_file.nil?
        @@file_name = @@gempack_file.split('/').last
      end
    end

    def query_gems
      local_gems = `#{@@gem_command}`
      raise ("Command not found") if $?.exit_status != 0
      local_gems.each_line do |gem|
        @gempack.push gem.split.first
      end
    end

    def generate_gempack
      if File.exists? @@gempack_file
        if flags.overwrite
          write_gempack
          puts "[Warning] #{@@file_name} was overwritten".colorize :yellow
        else
          puts "[Warning] #{@@file_name} already exists".colorize :yellow
        end
      else
        write_gempack
        puts "[Info] #{@@file_name} was created".colorize :cyan
      end
    end

    #
    def run
      check_args
      begin
        query_gems
        if @gempack.empty?
          puts "[Warning] No gems installed? Cancelling...".colorize :yellow
          Process.exit 0
        end
        generate_gempack
        Process.exit 0
      rescue ex : Exception
        puts "[Error] #{ex.message}".colorize :red
        Process.exit 1
      end
    end
  end
end
