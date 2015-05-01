module GitHelper
  def git_clone(path, name = "")
    system("git clone #{path} #{name}")
  end

  def checkout(branch_name, flags = [])
    system("git checkout #{flags.join(' ')} #{branch_name}")
  end

  def pull
    system('git pull')
  end

  def push
    system('git push')
  end
end