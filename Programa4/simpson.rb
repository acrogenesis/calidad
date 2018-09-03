#&p-Simpson
class Simpson
  attr_accessor :x, :dof, :p
  E = 0.0000001

  #&i
  def initialize(x, dof)
    self.x = x
    self.dof = dof
  end

  #&i
  def calculate
    n = 10
    p_10 = calculate_p(n)
    p_20 = calculate_p(n * 2)
    while (p_10 - p_20) < E
      n *= 2
      p_10 = calculate_p(n)
      p_20 = calculate_p(n * 2)
    end
    self.p = p_10
    p
  end

  #&i
  def calculate_p(n)
    w = x / n
    xi = 0.0
    f_array = []
    result = 0.0
    (n + 1).times do
      f_array << calculate_f(xi)
      xi = (xi + w).round(6)
    end
    result += (f_array.first * (w / 3.0)) + (f_array.last * (w / 3.0))
    m = 4.0
    (1..(n - 1)).each do |i|
      result += f_array[i] * m * (w / 3.0)
      m == 4.0 ? m = 2.0 : m = 4.0
    end
    result
  end

  private

  #&i
  def calculate_f(xi)
    calc_left * calc_right(xi)
  end

  #&i
  def calc_left
    (calc_nom / calc_denom).round(6)
  end

  #&i
  def calc_right(xi)
    ((1.0 + ((xi**2.0) / dof))**(-(dof + 1.0) / 2.0)).round(6)
  end

  #&i
  def calc_nom
    Math.gamma((dof + 1.0) / 2.0)
  end

  #&i
  def calc_denom
    ((dof * Math::PI)**(1.0 / 2.0)) * Math.gamma(dof / 2.0)
  end
end
