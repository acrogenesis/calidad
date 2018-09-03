#&p-ClassManager
class ClassManager
  attr_accessor :name, :type, :base_lines, :item_count, :delete_count, :modified_count, :total_lines
  #&i
  def initialize(args)
    @name = args[:name]
    @item_count = 0
    @delete_count = 0
    @modified_count = 0
    @total_lines = 0
    @base_lines = 0
  end

  #&i
  def added_lines
    total_lines - base_lines + delete_count
  end

  #&i
  def real_type
    return 'nueva' if type.nil?
    return 'reusada' if total_lines == base_lines && (modified_count + delete_count) == 0
    type
  end

  # Pretty prints file info
  #&i
  def pretty_print(print_type)
    return unless print_type == real_type
    print "#{name}: T=#{total_lines}, I=#{item_count} "
    print "B=#{base_lines}," if type == 'base'
    if real_type == 'base'
      print " D=#{delete_count}, "
      print "M=#{modified_count}, "
      print "A=#{added_lines}"
    end
    puts
  end

  #&i
  def pretty_string(print_type, s)
    return unless print_type == real_type
    s.print "#{name}: T=#{total_lines}, I=#{item_count} "
    s.print "B=#{base_lines}," if type == 'base'
    if real_type == 'base'
      s.print " D=#{delete_count}, "
      s.print "M=#{modified_count}, "
      s.print "A=#{added_lines}"
    end
    s.puts
  end
end
