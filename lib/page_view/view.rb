module PageView
  # Data structure that holds information about page view
  class View
    attr_reader :path, :ip
    def initialize(path, ip)
      @path = path
      @ip = ip
    end
  end
end
