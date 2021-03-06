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


RSpec.describe ActiveSymbol do
  before(:all) do 
    setup_for_sqlite
  end 

  it "has a version number" do
    expect(ActiveSymbol::VERSION).not_to be nil
  end

  it "generates correct sql for :symbol.gt" do
    actual = Mixin.where( :children_count.gt => 38291 ).to_sql 
    expected = "SELECT \"mixins\".* FROM \"mixins\" WHERE (\"mixins\".\"children_count\" > 38291)"
    expect(actual).to eq(expected)
  end

  it "generates correct instantiated output for :symbol.gt" do
    actual = Mixin.where( :children_count.gt => 38291 ).to_a 
    expected = Mixin.where("children_count > 38291").to_a
    expect(actual).to eq(expected)
  end
  it "generates correct instantiated output for :symbol.gte" do
    actual = Mixin.where( :children_count.gte => 38291 ).to_a 
    expected = Mixin.where("children_count >= 38291").to_a
    expect(actual).to eq(expected)
  end

  it "with multiple hash args, generates correct sql for :symbol.gt" do
    actual = Mixin.where( :children_count.gt => 38291, :children_count.gt => 234324 ).to_sql 
    expected = "SELECT \"mixins\".* FROM \"mixins\" WHERE (\"mixins\".\"children_count\" > 38291) AND (\"mixins\".\"children_count\" > 234324)"
    expect(actual).to eq(expected)
  end

  it "generates correct sql for :symbol.lt" do
    actual = Mixin.where( :children_count.lt => 38291 ).to_sql 
    expected = "SELECT \"mixins\".* FROM \"mixins\" WHERE (\"mixins\".\"children_count\" < 38291)"
    expect(actual).to eq(expected)
  end

  it "generates correct sql for :symbol.in" do
    actual = Mixin.where( :children_count.in => (38291..789790) ).to_sql 
    expected = "SELECT \"mixins\".* FROM \"mixins\" WHERE (\"mixins\".\"children_count\" BETWEEN 38291 AND 789790)"
    expect(actual).to eq(expected)
  end

  it "generates correct sql for :symbol.ne" do
    actual = Mixin.where( :children_count.ne => 38291 ).to_sql 
    expected = "SELECT \"mixins\".* FROM \"mixins\" WHERE (\"mixins\".\"children_count\" != 38291)"
    expect(actual).to eq(expected)
  end

  it "generates correct sql for default :symbol => 123" do
    actual = Mixin.where( :children_count => 38291 ).to_sql 
    expected = "SELECT \"mixins\".* FROM \"mixins\" WHERE \"mixins\".\"children_count\" = 38291"
    expect(actual).to eq(expected)
  end

  it "generates correct sql for default :symbol.like => '123'" do
    actual = Mixin.where( :typa.like => "aard" ).to_sql 
    expected = "SELECT \"mixins\".* FROM \"mixins\" WHERE (\"mixins\".\"typa\" LIKE 'aard')"
    expect(actual).to eq(expected)
  end

end
