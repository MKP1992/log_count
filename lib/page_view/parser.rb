module PageView
  # Log parser
  class Parser
    FORMAT = %r(^\/(\w+\/\d+|\w+) (\d{3}\.\d{3}\.\d{3}.\d{3})$).freeze
    def parse(lines)
      @parse ||= lines.map(&:chomp).inject([]) do |parse, line|
        if line.match(FORMAT)
          parse << parse_line(line)
        else
          parse
        end
      end
    end

    private

    def parse_line(line)
      View.new(*line.split)
    rescue ArgumentError
      # Ignore unparsable lines
    end
  end
end
