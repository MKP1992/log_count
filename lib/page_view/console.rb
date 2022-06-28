module PageView
  # Report builder
  class Console
    def output(page_views, title)
      page_views.each do |path, count|
        puts "#{path} #{count} #{title}"
      end
    end
  end
end
