def tag(tag_name, attributes = nil)
  if block_given?
    return "<#{tag_name}>#{yield}</#{tag_name}>" if attributes.nil?

    return "<#{tag_name} #{attributes[0]}=\"#{attributes[1]}\">#{yield}</#{tag_name}>"
  elsif attributes.nil?
    return "<#{tag_name}>"
  end
  return "<#{tag_name} #{attributes[0]}=\"#{attributes[1]}\">"
end
