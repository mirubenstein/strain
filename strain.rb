module Strain
  def discard
    return self.to_enum { size } unless block_given?
    each_with_object([]) { |value, output| output << value unless yield(value) }
  end

  def keep
    return self.to_enum { size } unless block_given?
    each_with_object([]) { |value, output| output << value if yield(value) }
  end
end
Array.include Strain
