module Templater
  def new_file(file_name)
    dir_path = file_name.split('/')[0..-2].join('/')
    FileUtils.mkdir_p(dir_path) if dir_path != ""
    File.open(file_name, "w+"){ |f| f.write(blank_template) }
  end

  def blank_template
'''# Day Number - Date

The Plan        |      |
----------------|-------
                |
                |
                |

# Labs

# Readings

# HW'''
  end
end