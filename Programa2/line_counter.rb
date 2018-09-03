require_relative 'class_manager'
#&p-LineCounter
#&b=10
class LineCounter
  #&i
  def self.count(content)
    inclass = false
    # skip = false
    klass = nil
    klass_array = []
    other_lines = 0
    content.each_with_index do |val, inx|
      val = val.strip
      # if skip
      #   skip = false if val =~ %r{^.*\*/}
      #   next
      # end
      # if val =~ %r{^\s*/\*}
      #   skip = true unless val =~ %r{^.*\*/}
      #   next
      # end

      if inclass
        # puts val if klass.name = 'Cliente'
        klass.total_lines += 1 unless val =~ /^(#.*|end|\s*)*$/
        # puts "#{inx}: #{val}" unless val =~ /^(#.*|end|\s*)$/
        if val =~ /#&b=/
          klass.type = 'base'
          klass.base_lines += val.gsub(/#&b=/, '').to_i
        elsif val =~ /#&i/
          klass.item_count += 1
        elsif val =~ /#&d/
          klass.delete_count += val.delete('^0-9').to_i
        elsif val =~ /#&m\s*$/
          klass.modified_count += 1
        end
        if content[inx + 1] =~ /^#&p/
          inclass = false
          klass_array << klass
        end
      elsif val =~ /#&p/
        klass = ClassManager.new(name: val.gsub(/#&p-/, '').strip)
        inclass = true
      else
        other_lines += 1 unless val =~ /^(#.*|end|\s*)*$/
      end
    end
    klass_array << klass
    #&d=8
    # f = File.read(file.file_name)
    # if f == ''
    #   file.blank_lines = 1
    #   return 1
    # end
    # total = f.scan(/$|\Z/).count
    # file.blank_lines = f.scan(/^( |\t|)*(\n|\r\n|\r)/).count + f.scan(/\n\Z/).count
    # file.info_lines = total - file.blank_lines
    # total
    { klass_array: klass_array, other_lines: other_lines }
  end
end
