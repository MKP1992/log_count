module PageView
  class Sorter
    def sort(page_views)
      page_views.sort_by { |key, count| [-count, key] }.to_h
    end
  end
end
