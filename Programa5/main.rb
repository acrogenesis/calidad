#!/usr/bin/env ruby
require_relative 'calc_manager'
#&p-Main
#&b=13
class Main
  #&i
  def self.start
    calc = user_input
    pretty_print(calc)
  end

  #&i
  def self.user_input
    print 'Ingrese p: ' #&m
    p_user = gets.chomp
    print 'Ingrese dof: ' #&m
    dof = gets.chomp
    CalcManager.new(p_user: p_user.to_f, dof: dof) #&m
  end

  #&i
  def self.pretty_print(calc)
    calc.pretty_print
  end
end

Main.start
