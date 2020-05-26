module ApplicationHelper
  def format_name(name)
    if name == nil
      ''
    else
      name.split.map(&:capitalize).join(' ')
    end
  end
end
