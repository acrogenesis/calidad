#!/usr/bin/env ruby
require_relative 'file_manager'
#&p-Main
#&b=48
class Main
  #&i
  def self.start
    file = read #&m
    file_print(file) #&m
    #&d=1
  end
  #&i
  def self.read
    #&d=2
    print 'Nombre del archivo: '
    file_name = gets.chomp
    #&d=1
    file = FileManager.new(file_name)
    file.calculate #&m
    file
    #&d=5
  end
  #&i
  def self.file_print(file)
    #&d=13
    file.pretty_print
  end
  #&d=15
end

Main.start
