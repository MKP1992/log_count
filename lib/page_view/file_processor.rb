module PageView
  # Total and unique view report builder for log files
  class FileProcessor
    FileProcessorError = Class.new(StandardError)

    TOTAL_VIEWS_TITLE = 'visits'
    UNIQUE_VIEWS_TITLE = 'unique views'

    def initialize(
      parser:   Parser.new,
      sorter:   Sorter.new,
      console: Console.new
    )
      @parser   = parser
      @sorter   = sorter
      @console = console
    end

    # Outputs total and unique views report for given filename
    #
    # @param filename [String]
    # @return [void]
    def call(filename)
      page_views = File.open(filename, 'r') { |file| @parser.parse(file) }
      counter = Counter.new(page_views)
      puts "Total view counts"
      total_page_views = @sorter.sort(counter.total_count_by_path)
      @console.output(total_page_views, TOTAL_VIEWS_TITLE)
      puts "---------------------------------------------------"
      puts "Total unique view counts"
      total_unique_page_views = @sorter.sort(counter.unique_count_by_path)
      @console.output(total_unique_page_views, UNIQUE_VIEWS_TITLE)
      puts "---------------------------------------------------"
    rescue Errno::ENOENT => e
      raise FileProcessorError, e
    end
  end
end
