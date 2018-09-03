#!/usr/bin/env ruby
require_relative 'file_manager'
require_relative 'line_counter'

Main.start

#&p-Main
class Main
  #&i
  def self.start
    info = read
    sorted_files_array = sort(info[:files_array])
    pretty_print(sorted_files_array, info)
  end

  #&i
  def self.read
    total_files = 0
    total_blank_lines = 0
    total_info_lines = 0
    files_array = []
    print 'Nombre del archivo: '
    file_name = gets.chomp
    while file_name != ''
      file = FileManager.new(file_name)
      files_array << file
      file.count
      total_blank_lines += file.blank_lines
      total_info_lines += file.info_lines
      total_files += 1
      print 'Nombre del archivo: '
      file_name = gets.chomp
    end
    { files_array: files_array, total_blank_lines: total_blank_lines,
      total_info_lines: total_info_lines, total_files: total_files }
  end

  #&i
  def self.sort(files_array)
    files_array.sort! do |a1, a2|
      a1.info_lines <=> a2.info_lines
    end
  end

  #&i
  def self.pretty_print(sorted_files_array, info)
    sorted_files_array.each(&:pretty_print)

    puts 'TOTALES:'
    puts "Cantidad de archivos: #{info[:total_files]}"
    puts "Cantidad total de líneas en blanco: #{info[:total_blank_lines]}"
    puts "Cantidad total de líneas con información: #{info[:total_info_lines]}"
  end
end
