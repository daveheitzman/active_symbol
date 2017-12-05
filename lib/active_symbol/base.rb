# frozen_string_literal: true

require 'byebug'
require 'awesome_print'

module ActiveSymbol
  class Base
    attr_reader :predicate_method, :sanitized_string
    def initialize(sym, predicate_method)
      @sanitized_string=sym.to_s
      @raw_string=sym.to_s
      @predicate_method=predicate_method
      @symbol=sym
    end 

    def to_s
      @to_s_call_count ||= 0 
      @to_s_call_count += 1
      STDOUT.puts "call_counts => #{[ @to_s_call_count, @gsub_call_count, @to_sym_call_count,@include_call_count ]}" 
      # if @gsub_call_count > 0 && @to_sym_call_count > 0 
      #   return sanitized_string 
      # else 
      #   return self 
      # end 
      # if [ @to_s_call_count, @gsub_call_count, @to_sym_call_count,@include_call_count ].all?{ |v| 
      #   v && v > 0 
      # }
        return self 
        # return sanitized_string 
      # else 
      #   return self
      # end 

    end 
    
    def singularize
      STDOUT.puts "singularize called" 
      self
    end

    def include?(*args)
      #convert_dot_notation_to_hash
      @include_call_count ||= 0
      @include_call_count += 1
      true
      false
    end 
    
    def sanitized_string 
      STDOUT.puts "sanitized_string called" 
      
      @sanitized_string || @raw_string
    end 

    def gsub(needle, replacement, *rest)
      @gsub_call_count ||= 0
      @gsub_call_count += 1 
      STDOUT.puts "gsub called" 
      @sanitized_string = @raw_string.gsub(needle,replacement)
      self  
    end 

    def to_sym
      @to_sym_call_count ||= 0
      @to_sym_call_count += 1
      STDOUT.puts "to_sym called" 
      self
    end 

    ##########

    #<Arel::Nodes::BindParam:0x00563b484adf38 @value=#<ActiveRecord::Relation::QueryAttribute:0x00563b484adf60 @name=#<ActiveSymbol:0x00563b48464298 @sanitized_string="author_id", @raw_string="author_id", @predicate_method=:lt, @symbol=:author_id>, @value_before_type_cast=38291, @type=#<ActiveModel::Type::Value:0x00563b4895ee38 @precision=nil, @scale=nil, @limit=nil>, @original_attribute=nil>>
    def build_bind_attribute(attribute,value)
     # 59        attr = Relation::QueryAttribute.new(column_name.to_s, value, table.type(column_name))
     # 60:       Arel::Nodes::BindParam.new(attr)
      attr = ActiveRecord::Relation::QueryAttribute.new(attribute.name.to_s, value, nil)
      # bind_param=Arel::Nodes::BindParam.new()
      # byebug
      bind_param=Arel::Nodes::BindParam.new()
    end 
  end 
end 

