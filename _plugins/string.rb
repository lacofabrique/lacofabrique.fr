class String
  def capitalize_first_char
    self[0].capitalize + self[1..-1]
  end

  def uncapitalize
    self[0].downcase + self[1..-1]
  end
end
