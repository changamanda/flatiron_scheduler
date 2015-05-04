require 'templater'
include Templater

describe 'Templater' do

  describe '#new_file' do

    it 'creates a new file based on the file name argument' do
      new_file('tEst637324.rb')
      expect(Dir.entries('.')).to include('tEst637324.rb')
      File.delete("tEst637324.rb")
    end

    it 'has the proper contents' do
      new_file('tEst637324.rb')
      expect(File.read('tEst637324.rb')).to include('The Plan        |      |')
      File.delete("tEst637324.rb") 
    end

    it 'can add files in directories' do
      new_file('test92346/tEst637324.rb')
      expect(Dir.entries('test92346')).to include('tEst637324.rb')
      File.delete("test92346/tEst637324.rb")
      Dir.rmdir('test92346')
    end

  end

end