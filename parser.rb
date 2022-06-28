 # Log parser
 require './page_view'
class Parser
  def parse(lines)
    lines.map { |line| parse_line(line) }.compact
  end

  private

  def parse_line(line)
    PageView.new(*line.split)
  rescue
    # Ignore unparsable lines
  end
end
