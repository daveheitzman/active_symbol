# require "rails/cases/helper"
# require "models/author"
# require "models/binary"
# require "models/cake_designer"
# require "models/car"
# require "models/chef"
# require "models/post"
# require "models/comment"
# require "models/edge"
# require "models/essay"
# require "models/price_estimate"
# require "models/topic"
# require "models/treasure"
# require "models/vertex"

require 'active_symbol'

class Mixin < ActiveRecord::Base
end 
Mixin.reset_column_information

# setup_db

RSpec.describe ActiveSymbol do
  it "has a version number" do
    expect(ActiveSymbol::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end


  it "generates correct sql for :symbol.gt" do
    # byebug
    actual = Mixin.where( :children_count.gt => 38291 ).to_sql 
    expected = "SELECT \"mixins\".* FROM \"mixins\" WHERE \"mixins\".\"children_count\" > 38291"
    expect(actual).to eq(expected)
  end

end
