describe "Name" do 
  it "Should initialize correctly" do 
    n = Name.new()
    n.id.should == nil
    n = Name.new( { id: 1, spelling: 'Cliona', phonetic: 'clee o nuh', gender:'female'})
    n.id.should == 1
    n.spelling.should == 'Cliona'
    n.phonetic.should == 'clee o nuh'
  end
end