require_relative 'simpson'
#&p-CalcManager
class CalcManager
  attr_accessor :x, :dof, :simpson

  #&i
  def initialize(args)
    self.x = args[:x]
    self.dof = args[:dof]
    check_exceptions
    self.simpson = Simpson.new(x, dof)
    calculate
  end

  #&i
  def calculate
    simpson.calculate
  end

  #&i
  def pretty_print
    puts "x   = #{x.round(5)}"
    puts "dof = #{dof}"
    puts "p   =  #{format('%.5f', simpson.p.round(5))}"
  end

  private

  #&i
  def check_exceptions
    if x >= 0
      if (dof =~ /^\d*$/) && (dof.to_i > 0)
        self.dof = dof.to_i
        true
      else
        puts 'Error: dof debe ser numero entero mayor a cero.'
        exit(0)
      end
    else
      puts 'Error: X debe ser numero real >= 0'
      exit(0)
    end
  end
end
