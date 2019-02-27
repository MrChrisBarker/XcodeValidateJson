require 'json'

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

class ValidateJson
    def validate

        items = []
        all_files = Dir.glob("**/*.json").reject do |path|
          File.directory?(path)
        end

        hasError = false
        all_files.each { |my_text_file|
          if parse_json?(File.read(my_text_file)) == false
            hasError = true
            if ARGV[0] == "xcode"
              base_filename = File.basename(my_text_file)
              $stderr.puts "#{base_filename}:0: error: #{base_filename} is malformed"
            end
          end

        }

        hasError ? (exit 1) : (exit 0)

    end

    def parse_json?(string)
      JSON.parse(string)
      return true
      rescue JSON::ParserError
      return false
    end 

end

ValidateJson.new.validate