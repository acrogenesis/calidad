require_relative 'simpson'
#&p-CalcManager
#&b=26
class CalcManager
  attr_accessor :x, :dof, :p_user, :simpson, :d, :adjust_flag #&m
  E = 0.00000001

  #&i
  def initialize(args)
    self.p_user = args[:p_user]
    self.dof = args[:dof]
    self.x = 1.0 #&m
    self.d = 0.5
    self.adjust_flag = 0
    check_exceptions
    self.simpson = Simpson.new(x, dof)
    calculate
  end

  #&i
  def calculate
    p_calc = simpson.calculate.round(5)
    while (p_calc - p_user).abs > E
      if p_calc > p_user
        adjust_d(current: 1, previous: adjust_flag)
        self.x = x - d
        adjust_flag = 1
      else
        adjust_d(current: -1, previous: adjust_flag)
        self.x = x + d
        adjust_flag = -1
      end
      self.simpson = Simpson.new(x, dof)
      p_calc = simpson.calculate.round(5)
    end
    self
  end

  #&i
  def adjust_d(args)
    return if args[:previous] == 0
    return if args[:current] == args[:previous]
    self.d = d / 2
  end

  #&i
  def pretty_print
    puts "p   =  #{format('%.5f', p_user.round(5))}" #&m
    puts "dof = #{dof}"
    puts "x   = #{x.round(5)}" #&m
  end

  private

  #&i
  def check_exceptions
    if 0 < p_user && p_user < 0.5 #&m
      if (dof =~ /^\d*$/) && (dof.to_i > 0)
        self.dof = dof.to_i
        true
      else
        puts 'Error: dof debe ser numero entero mayor a cero.'
        exit(0)
      end
    else
      puts 'Error: P debe ser un numero entre 0 y 0.5' #&m
      exit(0)
    end
  end
end
