require_relative 'test_helper'

class TestMathLinearRegression < Minitest::Test
  def setup
    @mlr = MathLinearRegression.new(File.readlines('Arch1.txt').map(&:strip).reject { |x| x == '' }.compact)
  end

  def test_calculate
    assert_equal @mlr.calculate.round(5), 644.42938
    assert_equal @mlr.N, 10
    assert_equal @mlr.xk, 386
    assert_equal @mlr.r.round(5), 0.9545
    assert_equal @mlr.r2.round(5), 0.91106
    assert_equal @mlr.b0.round(5), -22.55253
    assert_equal @mlr.b1.round(5), 1.72793
    assert_equal @mlr.yk.round(5), 644.42938
  end
end
