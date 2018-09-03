#!/usr/bin/env ruby
require_relative 'file_manager'
#&d=1

#&p-Main
#&b=32
class Main
  #&i
  def self.start
    info = read
    #&d=1
    # sorted_files_array = sort(info[:files_array])
    pretty_print(info[:files_array], info[:total_lines]) #&m
    pretty_save(info[:files_array], info[:total_lines])
  end
  
  #&i
  def self.read
    total_lines = 0
    #&d=2
    files_array = []
    print 'Nombre del archivo: '
    file_name = gets.chomp
    while file_name != ''
      file = FileManager.new(file_name)
      files_array << file
      file.count
      #&d=2
      total_lines += file.total_lines #&m
      print 'Nombre del archivo: '
      file_name = gets.chomp
    end
    { files_array: files_array, total_lines: total_lines } #&m
  end

  #&d=3
  # def self.sort(files_array)
  #   files_array.sort! do |a1, a2|
  #     a1.info_lines <=> a2.info_lines
  #   end
  # end

  #&i
  def self.pretty_print(files_array, total_lines) #&m
    # sorted_files_array.each(&:pretty_print)
    #&d=5
    puts 'PARTES BASE:'
    files_array.map do |f|
      f.klass_array.map { |k| k.pretty_print('base') }
    end
    puts '--------------------------------------------'
    puts 'PARTES NUEVAS:'
    files_array.map do |f|
      f.klass_array.map { |k| k.pretty_print('nueva') }
    end
    puts '--------------------------------------------'
    puts 'PARTES REUSADAS:'
    files_array.map do |f|
      f.klass_array.map { |k| k.pretty_print('reusada') }
    end
    puts '--------------------------------------------'
    puts "Total de LDC=#{total_lines}"
  end

  #&i
  def self.pretty_save(files_array, total_lines)
    File.open('ConteoLDC.txt', 'w') do |s|
      s.puts 'PARTES BASE:'
      files_array.map do |f|
        f.klass_array.map { |k| k.pretty_string('base', s) }
      end
      s.puts '--------------------------------------------'
      s.puts 'PARTES NUEVAS:'
      files_array.map do |f|
        f.klass_array.map { |k| k.pretty_string('nueva', s) }
      end
      s.puts '--------------------------------------------'
      s.puts 'PARTES REUSADAS:'
      files_array.map do |f|
        f.klass_array.map { |k| k.pretty_string('reusada', s) }
      end
      s.puts '--------------------------------------------'
      s.puts "Total de LDC=#{total_lines}"
    end
  end
end

Main.start
