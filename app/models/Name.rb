class Name
  # NOTE: the name class on the back end will have a number_of_syllables attribute
  PROPERTIES = [:id, :spelling, :phonetic, :gender]
  PROPERTIES.each { |p| attr_accessor p }

  def initialize(hash={})
    hash.each {|k,v| self.send("#{k.to_s}=",v) if PROPERTIES.include? k.to_sym}
  end
end