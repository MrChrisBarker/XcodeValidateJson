####
#### Verison 1.0.1
#### Chris Barker http://twitter.com/MrChrisBarker
####

require 'json'

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

module AlertType
  WARNING = "warning"
  ERROR = "error"
end

class ValidateJson
    def validate

        alert_type = ARGV[0] == "warn" ? AlertType::WARNING : AlertType::ERROR

        items = []
        all_files = Dir.glob("**/*.json").reject do |path|
          File.directory?(path)
        end

        hasError = false
        all_files.each { |json_file|
          if parse_json?(File.read(json_file)) == false
            hasError = true
            base_filename = File.basename(json_file)
            $stderr.puts "#{base_filename}:0: #{alert_type}: #{base_filename} is malformed"
          end

        }

        # Correct exit code if we want to flag as a compiler error
        if hasError && alert_type == AlertType::ERROR
          exit 1
        end
        
        exit 0

  end

    def parse_json?(string)
      JSON.parse(string)
      return true
      rescue JSON::ParserError
      return false
    end 

end

ValidateJson.new.validate