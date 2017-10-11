module ApplicationHelper
  def dollars(price)
    str = price.to_s.split(//)
    if str.length == 1
      str.unshift('0', '0')
    elsif str.length == 2
      str.unshift('0')
    end
    '$'+str.insert(-3, '.').join
  end
end
