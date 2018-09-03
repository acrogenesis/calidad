require_relative 'test_helper'

class TestFileManager < Minitest::Test
  def setup
    @file = FileManager.new('test1.src')
    @file.count
  end

  # Returns correct name
  def test_name
    assert_equal 'test1.src', @file.file_name
  end

  def test_total_lines
    assert_equal @file.total_lines, 158
  end
end
