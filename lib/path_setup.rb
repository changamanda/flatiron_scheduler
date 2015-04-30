module PathSetup
  def setup_path(path)
    File.open("/Users/#{ENV['USER']}/.fis_scheduler", "w+"){ |f| f.write(path) }
  end

  def read_path
    File.read("/Users/#{ENV['USER']}/.fis_scheduler")
  end
end