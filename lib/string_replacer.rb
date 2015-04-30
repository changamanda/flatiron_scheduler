class StringReplacer
  def self.replace_file_line(number, file_path, new_line)
    contents = File.read(file_path)
    new_contents = ""
    contents.each_line.with_index(1) do |line, i|
      i != number ? new_contents << line : new_contents << new_line
    end
    File.open(file_path, "w+"){ |f| f.write(new_contents) }
  end
end