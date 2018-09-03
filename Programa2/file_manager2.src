require_relative 'line_counter'
#&p-FileManager
#&b=32
class FileManager
  # Get and Set for file_name, blank_lines, and info_lines
  attr_accessor :file_name, :total_lines, :klass_array #&m

  # FileManager.new arguments
  #&i
  def initialize(file_name)
    self.file_name = file_name
    #&d=1
    self.total_lines = 0
    check_exceptions
  end

  # Calls LineCounter to count lines
  #&i
  def count
    file_info = LineCounter.count(File.readlines file_name)#&m
    self.total_lines = file_info[:other_lines]
    self.klass_array = file_info[:klass_array]
    #&d=1
  end

  #&i
  def total_lines
    @total_lines + klass_array.map(&:total_lines).inject(:+)
    #&d=1
  end

  #&d=5

  private

  #&i
  def check_exceptions
    if File.extname(file_name) == '.src' #&m
      if File.exist?(file_name)
        if File.readable?(file_name)
          true
        else
          puts 'Error: Archivo no se puede leer.'
          exit(0)
        end
      else
        puts "Error: El archivo \"#{file_name}\" no existe."
        exit(0)
      end
    else
      puts 'Error: Solo se permite archivos .src.' #&m
      exit(0)
    end
  end
end
