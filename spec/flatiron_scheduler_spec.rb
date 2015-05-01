require 'flatiron_scheduler'

describe 'FlatironScheduler' do
  
  describe '#new' do

    it 'initializes a FlatironScheduler with a week and a day' do
      s = FlatironScheduler.new(5, 4)
      expect(s.week).to eq(5)
      expect(s.day).to eq(4)
    end

    it 'initializes a FlatironScheduler with a path' do
      path = File.read("/Users/#{ENV['USER']}/.fis_scheduler")
      expect(FlatironScheduler.new(5, 4).path).to eq(path)
    end

  end

  describe '#file_name' do

    it 'returns the corresponding file name' do
      expect(FlatironScheduler.new(5, 4).file_name).to eq("week-5/day-4.md")
    end

  end

  describe '#move_to_dir' do

    it 'navigates to the correct directory' do
      s = FlatironScheduler.new(5, 4)
      FlatironScheduler.move_to_dir(s.path)
      expect(Dir.pwd).to eq(s.path)
    end

  end

end