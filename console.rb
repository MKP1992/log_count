class Console
  def self.print(tally, title)
    tally.each do |path, count|
      puts "#{path} #{count} #{title}"
    end
  end
end
