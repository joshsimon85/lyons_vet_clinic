module ApplicationHelper
  def format_name(name)
    if name == nil
      ''
    else
      name.split.map(&:capitalize).join(' ')
    end
  end

  def format_string(str)
    if str == nil
      ''
    else
      str.strip[0].capitalize + str.strip[1..-1]
    end
  end
end
