require_relative 'test_helper'

class TestFileManager < Minitest::Test
  def setup
    @file = FileManager.new('Arch1.txt')
  end

  # Returns correct name
  def test_name
    assert_equal 'Arch1.txt', @file.file_name
  end
end
