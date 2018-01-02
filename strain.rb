module Strain
  def discard
    return enum_for(__method__) { size } unless block_given?
    each_with_object([]) { |value, output| output << value unless yield(value) }
  end

  def keep
    return enum_for(__method__) { size } unless block_given?
    each_with_object([]) { |value, output| output << value if yield(value) }
  end
end

Array.include Strain
