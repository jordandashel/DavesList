class Validator
  def self.has_title?(listing)
    !listing[:title].empty?
  end
end
