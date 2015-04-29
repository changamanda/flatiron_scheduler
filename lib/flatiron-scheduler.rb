class FlatironScheduler
  attr_accessor :week, :day

  def initialize(week, day)
    @path = '/Users/amandachang/Development/staff-ruby007/curriculum/web-0415'
    @week = week
    @day = day
  end

  def file_name
    "week-#{week}/day-#{day}.md"
  end

  def move_to_dir
    Dir.chdir(@path)
  end

  def checkout_future
    system('git checkout future')
  end

  def checkout_master
    system('git checkout master')
  end

  def pull
    system('git pull')
  end

  def push
    system('git push')
  end

  def add_commit
    system('git add .')
    system("git commit -am \"Week #{self.week}, Day #{self.day}\"")
  end

  def checkout_today
    system("git checkout future -- #{file_name}")
  end

  def change_symlink
    system("ln -sfn #{file_name} README.md")
  end

  def run
    move_to_dir
    checkout_future
    pull
    add_commit
    push
    checkout_master
    pull
    checkout_today
    change_symlink
    add_commit
    push
  end
end