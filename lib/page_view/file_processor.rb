module PageView
  # Total and unique view report builder for log files
  class FileProcessor
    FileProcessorError = Class.new(StandardError)

    PAGE_VIEW_TITLES = {
      "total": 'total_count_by_path',
      "unique": 'unique_count_by_path'
    }.freeze


    attr_reader :counter

    def initialize(
      parser:   Parser.new,
      sorter:   Sorter.new,
      console: Console.new
    )
      @parser   = parser
      @sorter   = sorter
      @console = console
    end

    # Parse file and give array of counter class object
    # Also check file size is greater than 1
    def counter_parse_file(filename)
      page_views = File.open(filename, 'r') { |file| @parser.parse(file) }
      counter = Counter.new(page_views)
      check_counter_size(counter) ? counter : return
    end

    def sort_page_views(method_name)
      @sorter.sort(counter.send(method_name))
      @sorter.sort(counter.send(method_name))
    end

    def page_views_output
      PAGE_VIEW_TITLES.each do |title, method_name|
        @console.output(sort_page_views(method_name), title)
      end
    end

    # Outputs total and unique views report for given filename
    def call(filename)
      if filename && File.extname(filename) == '.log'
        begin
          @counter = counter_parse_file filename
          page_views_output
        rescue Errno::ENOENT => e
          raise FileProcessorError, e
        end
      else
        puts 'Input file parameter is not passed or it is not a log file!'
      end
    end

    private

    def check_counter_size(counter)
      puts 'Input file is empty' if counter.empty?
      false if counter.empty?
      true
    end
  end
end
