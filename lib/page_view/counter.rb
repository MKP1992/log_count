module PageView
  # Page view counter
  class Counter
    def initialize(page_views)
      @page_views = page_views
    end

    #total page view count per path
    def total_count_by_path
      page_views_by_route.transform_values(&:count)
    end

    # unique page view count per path
    def unique_count_by_path
      page_views_by_route.transform_values { |page_views| page_views.uniq(&:ip).count }
    end

    private

    def page_views_by_route
      @page_views.group_by(&:path)
    end
  end
end
