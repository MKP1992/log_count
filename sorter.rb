class Sorter
  def self.sort(tally)
    tally.sort_by { |key, count| [-count, key] }.to_h
  end
end