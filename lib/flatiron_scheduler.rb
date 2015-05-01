require 'path_setup'
require 'git_helper'

class FlatironScheduler
  include PathSetup
  extend GitHelper
  attr_reader :week, :day, :path

  def initialize(week, day)
    @path = read_path
    @week = week
    @day = day
  end

  ## INSTANCE METHODS

  def file_name
    "week-#{week}/day-#{day}.md"
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

  ## GROUPS

  def future_branch_updates
    FlatironScheduler.checkout("future")
    FlatironScheduler.pull
    add_commit
    FlatironScheduler.push
  end

  def master_branch_updates
    FlatironScheduler.checkout("master")
    FlatironScheduler.pull
    checkout_today
    change_symlink
    add_commit
    FlatironScheduler.push
  end

  def run
    FlatironScheduler.move_to_dir(self.path)
    future_branch_updates
    master_branch_updates
  end

  ## CLASS METHODS

  def self.move_to_dir(dir)
    Dir.chdir(dir)
  end

  def self.new_schedule_commit
    system('git add --all')
    system("git commit -am \"New Schedule\"")
  end

  def self.clean_schedule(branch)
    if branch == 'future'
      system("rm -rf blogs")
      system("rm -rf presentations")
      system("rm -rf videos")
    elsif branch == 'master'
      dir = Dir.new(Dir.pwd)
      dir.each { |file_name| system("rm -rf #{file_name}") if file_name.start_with?("week") }   
    end
  end

  def self.create_schedule(name, path)
    git_clone(path, name)
    move_to_dir(name)

    checkout("future", ["-b"])

    clean_schedule("future")
    new_schedule_commit

    checkout("master")
    system("git merge future")

    clean_schedule("master")
    new_schedule_commit

    system("git remote remove origin")
  end
end