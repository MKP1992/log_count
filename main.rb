require_relative "lib/page_view"
begin
  PageView::FileProcessor.new.call(ARGV[0])
rescue PageView::FileProcessor::FileProcessorError => e
  puts e
  exit 1
end