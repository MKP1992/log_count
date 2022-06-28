module PageView
  # Log parser
  class Parser
    FORMAT = %r(^\/(\w+\/\d+|\w+) (\d{3}\.\d{3}\.\d{3}.\d{3})$).freeze
    def parse(lines)
      @views ||= lines.map(&:chomp).inject([]) do |views, line|
        if line.match(FORMAT)
          views << parse_line(line)
        else
          views
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
