describe "NameController" do 
  tests NameController

  describe '#get_names' do 
    it 'should throw an error if bad gender' do 
      should.raise(ArgumentError) { controller.get_names('alien') }
    end
  #  it "should populate data" do 
  #    controller.get_names('female')
  #    controller.instance_variable_get("@data").count.should == 31
  #  end
  end

  describe '#parse_name' do 
    it 'should set the attributes' do 
      controller.parse_name()
    end
  end

end