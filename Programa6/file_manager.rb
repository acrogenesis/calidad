require_relative 'math_linear_regression'
#&p-FileManager
#&b=36
class FileManager
  # Get and Set for file_name, blank_lines, and info_lines
  attr_accessor :file_name, :linear_regression

  # FileManager.new arguments
  #&i
  def initialize(file_name)
    self.file_name = file_name
    check_exceptions
  end

  #&i
  def calculate
    self.linear_regression = MathLinearRegression.new(File.readlines(file_name).map(&:strip).reject { |x| x == '' }.compact)
    linear_regression.calculate
  end

  #&i
  def pretty_print
    puts "N = #{linear_regression.N}"
    puts "xk = #{linear_regression.xk}"
    puts "r = #{linear_regression.r.round(5)}"
    puts "r2 = #{linear_regression.r2.round(5)}"
    puts "b0 = #{linear_regression.b0.round(5)}"
    puts "b1 = #{linear_regression.b1.round(5)}"
    puts "yk = #{linear_regression.yk.round(5)}"

    puts "sig = #{format('%.10f', linear_regression.sig)}"
    puts "ran = #{linear_regression.ran.round(5)}"
    puts "LS = #{linear_regression.ls.round(5)}"
    puts "LI = #{linear_regression.li.round(5)}"
  end

  private

  #&i
  def check_exceptions
    # el archivo tiene xk
    if File.extname(file_name) == '.txt'
      if File.exist?(file_name)
        if File.readable?(file_name)
          content = File.readlines(file_name).map(&:strip).reject { |x| x == '' }.compact.first
          if content.to_i >= 0
            true
          else
            puts 'Error: El primer renglon debe ser mayor o igual a cero'
            exit(0)
          end
        else
          puts 'Error: Archivo no se puede leer.'
          exit(0)
        end
      else
        puts "Error: El archivo \"#{file_name}\" no existe."
        exit(0)
      end
    else
      puts 'Error: Solo se permite archivos .txt.'
      exit(0)
    end
  end
end
