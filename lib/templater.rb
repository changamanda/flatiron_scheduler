module Templater
  def new_file(file_name)
    FileUtils.mkdir_p(file_name.split('/')[0..-2].join('/'))
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