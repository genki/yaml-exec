require "yaml/exec/version"
require 'yaml'

module Yaml
  module Exec
    class Cli
      def initialize
        *args, path = ARGV
        abort 'command is required for 1st arg' if args.empty?
        abort 'yml file is needed for 2nd arg' if path.nil?
        @cmd = args.join ' '
        @yml = YAML.load_file path
      end

      def run
        cmd_list @yml
      end

    private
      def cmd_list(hash)
        out = @cmd.dup
        hash.each do |value, args|
          cmd_args args, out
          out.concat " #{value}"
        end
        system out
      end

      def cmd_args(args, out)
        args.each do |(k,v)|
          case v
          when Hash; cmd_arg_hash(k, v, out)
          when Array
          else out.concat " --#{k} #{v}"
          end
        end
      end

      def cmd_arg_hash(key, hash, out)
        hash.each do |k,v|
          out.concat " --#{key} #{k}=#{v}"
        end
      end
    end
  end
end
