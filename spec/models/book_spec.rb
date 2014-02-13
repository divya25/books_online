require 'spec_helper'

describe Book do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :author => "value for author",
      :publisher => "value for publisher",
      :description => "value for description",
      :category_id => 1,
      :number_rated => 1,
      :average_rating => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Book.create!(@valid_attributes)
  end
end
