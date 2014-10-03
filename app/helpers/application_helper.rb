module ApplicationHelper
  def hash_to_html(key, value=nil)
    output = ""

    if value.nil?
      output += "<li>#{key}</li>"
    elsif value.is_a?(Hash)
      output += "<li>#{key}"
      output += "<ul>"
      value.each { |key, value| output += hash_to_html(key, value) }
      output += "</ul></li>"
    else
      output += "<li>#{key} :: #{value.inspect}</li>"
    end

    return output
  end
end
