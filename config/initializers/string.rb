class String
  def html_newlines
    self.gsub(/(\r)\n[\r\n]+/m, '<br/><br/>')
  end
end