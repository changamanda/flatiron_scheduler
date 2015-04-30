require 'path_setup'

class FlatironScheduler
  include PathSetup
  attr_reader :week, :day, :path

  def initialize(week, day)
    @path = read_path
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

  def future_branch_updates
    checkout_future
    pull
    add_commit
    push
  end

  def master_branch_updates
    checkout_master
    pull
    checkout_today
    change_symlink
    add_commit
    push
  end

  def run
    move_to_dir
    future_branch_updates
    master_branch_updates
  end
end