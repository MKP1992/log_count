# simpliarly change into class in place of OpenStruct
class PageView
  attr_reader :path, :ip
  def initialize(path, ip)
    @path = path
    @ip = ip
  end
end