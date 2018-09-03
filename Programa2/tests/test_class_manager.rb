require_relative 'test_helper'

class TestClassManager < Minitest::Test
  def setup
    file = FileManager.new('test1.src')
    file.count
    @klass_array = file.klass_array
  end

  def test_added_lines
    @klass_array.each do |klass|
      assert_equal klass.added_lines, klass.total_lines - klass.base_lines + klass.delete_count
    end
  end

  def test_real_type
    @klass_array.each do |klass|
      real_type = klass.type
      real_type = 'nueva' if klass.type.nil?
      real_type = 'reusada' if klass.total_lines == klass.base_lines
      assert_equal klass.real_type, real_type
    end
  end
end
