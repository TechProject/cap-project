require 'test_helper'

class ProgramTest < ActiveSupport::TestCase
  def setup
    @developer = Developer.create(developername: "kirk", email: "kirk@example.com")
    @program = @developer.programs.build(name: "bottles of beer", summary: "counts bottles of beer",
        description: "
        number = 99
        while number >= 1
        	puts '''# {number} bottles of beer on the wall.\
        		# {number} bottles of beer.  You take one down,\
        		pass it around, # {number} bottles of beer on the wall.'''
        	number -= 1	
        end
        ")
  end
  
  test "program should be valid" do
    assert @program.valid?
  end
  
  test "developer_id should be present" do
    @program.developer_id = nil 
    assert_not @program.valid?
  end
  
  test "name should be present" do
    @program.name = " "
    assert_not @program.valid?
  end
  
  test "name length should not be too long" do
    @program.name = "a" * 101
    assert_not @program.valid?
  end
  
  test "name length should not be too short" do
    @program.name = "aaaa"
    assert_not @program.valid?
  end
  
  test "summary should be present" do
    @program.summary = ""
    assert_not @program.valid?
  end
  
  test "summary length should not be too long" do
    @program.summary = "a" * 151
    assert_not @program.valid?
  end
  
  test "summary length should not be too short" do
    @program.summary = "a" * 5
    assert_not @program.valid?
  end
  
  test "description must be present" do
    @program.description = ""
    assert_not @program.valid?
  end

end


