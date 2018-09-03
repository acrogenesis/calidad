#!/usr/bin/env ruby
require_relative 'calc_manager' #&m
#&p-Main
#&b=13
class Main
  #&i
  def self.start
    calc = user_input #&m
    pretty_print(calc) #&m
  end

  #&i
  def self.user_input
    print 'Ingrese x: ' #&m
    x = gets.chomp #&m
    print 'Ingrese dof: '
    dof = gets.chomp
    CalcManager.new(x: x.to_f, dof: dof) #&m
    #&d=2
  end

  #&i
  def self.pretty_print(calc) #&m
    calc.pretty_print #&m
  end
end

Main.start
