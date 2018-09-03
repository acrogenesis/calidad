require_relative 'test_helper'

class TestSimpson < Minitest::Test
  def setup
    @s = Simpson.new(1.1, 9)
  end

  def test_calculate
    assert_equal @s.calculate.round(5), 0.35006
    assert_equal @s.x, 1.1
    assert_equal @s.dof, 9
  end
end
