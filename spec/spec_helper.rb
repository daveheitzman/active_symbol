require "bundler/setup"
# require 'active_record'
require "active_symbol"

def capture_stdout(&block)
  real_stdout = $stdout

  $stdout = StringIO.new
  yield
  $stdout.string
ensure
  $stdout = real_stdout
end
#################################################################################
# 
#   DB setup code thanks to acts_as_tree gem 
#   https://github.com/amerine/acts_as_tree
# 
#################################################################################

def setup_for_postgres
  ActiveRecord::Base.establish_connection adapter: "postgresql", 
    database: "active_symbol_test",
    :username=>:active_symbol_test, :password=>"active_symbol_test"
  setup_db
end 

def setup_for_sqlite
  ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"
  setup_db
end 


class Mixin < ActiveRecord::Base ; end
def setup_db(options = {})
  # AR keeps printing annoying schema statements
  capture_stdout do
    ActiveRecord::Base.logger
    ActiveRecord::Schema.define(version: 1) do
      drop_table :mixins, :if=>:exists rescue nil
      create_table :mixins, force: true do |t|
        t.column :typa, :string
        t.column :parent_id, :integer
        t.column :children_count, :integer, default: 0
        t.timestamps null: false
      end
    end

    # Fix broken reset_column_information in some activerecord versions.
    if ActiveRecord::VERSION::MAJOR == 3 && ActiveRecord::VERSION::MINOR == 2 ||
       ActiveRecord::VERSION::MAJOR == 4 && ActiveRecord::VERSION::MINOR == 1
      ActiveRecord::Base.connection.schema_cache.clear!
    end
    Mixin.reset_column_information
    Mixin.new(:typa=>"aardvark", :children_count=>50023).save!
    Mixin.new(:typa=>"wolfvark", :children_count=>1).save!
  end
  

end
  


RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
