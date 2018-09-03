#&p-LineCounter
class LineCounter
  #&i
  def self.count(file)
    f = File.read(file.file_name)
    if f == ''
      file.blank_lines = 1
      return 1
    end
    total = f.scan(/$|\Z/).count
    file.blank_lines = f.scan(/^( |\t|)*(\n|\r\n|\r)/).count + f.scan(/\n\Z/).count
    file.info_lines = total - file.blank_lines
    total
  end
end
