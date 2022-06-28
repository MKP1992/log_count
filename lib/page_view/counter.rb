module PageView
  # Page view counter
  class Counter
    attr_reader :size

    def initialize(page_views)
      @page_views = page_views
      @size = page_views.count
    end

    # total page view count per path
    def total_count_by_path
      page_views_by_path.transform_values(&:count)
    end

    # unique page view count per path
    def unique_count_by_path
      page_views_by_path.transform_values { |page_views| page_views.uniq(&:ip).count }
    end

    def empty?
      size < 1
    end

    private

    def page_views_by_path
      @page_views.group_by(&:path)
    end
  end
end
