# frozen_string_literal: true

require 'byebug'
require 'awesome_print'

module ActiveSymbol
  class Base
    attr_reader :predicate_method #, :sanitized_string
    def initialize(sym, predicate_method)
      @sanitized_string=sym.to_s
      @raw_string=sym.to_s
      @predicate_method=predicate_method
      @to_s_sanitized_string=false
      @symbol=sym
    end 

    def show_counts 
      self.inspect
    end 
    
    def is_a?(klass)
# STDOUT.puts "is_a? "+show_counts
      [Hash, ActiveSymbol::Base, Symbol].include? klass 
    end 

    def to_s
# STDOUT.puts "to_s "+show_counts
      @to_s_call_count ||= 0 
      @to_s_call_count += 1
      if @to_s_sanitized_string
        return sanitized_string
      else 
        # quirk in the postgresql adapter for quote_column_name
        if [:within, :in].include?(predicate_method)
          if @to_s_call_count > 10 
            return sanitized_string
          else 
            return self 
          end 
        else 
          return self 
        end 
      end 
    end 

    def to_s_sanitized_string!
      @to_s_sanitized_string = true     
    end 

    def singularize
# STDOUT.puts "singularize "+show_counts
      self
    end

    def include?(*args)
# STDOUT.puts "include? "+show_counts
      #convert_dot_notation_to_hash
      @include_call_count ||= 0
      @include_call_count += 1
      true
      false
    end 
    
    def sanitized_string 
# STDOUT.puts "sanitized_string "+show_counts
      @sanitized_string || @raw_string
    end 

    def gsub(needle, replacement, *rest)
# STDOUT.puts "gsub "+show_counts
      @gsub_call_count ||= 0
      @gsub_call_count += 1 
      @sanitized_string = @raw_string.gsub(needle,replacement)
      self  
    end 

    def to_sym
# STDOUT.puts "to_sym "+show_counts
      @to_sym_call_count ||= 0
      @to_sym_call_count += 1
      self
    end 

  end 
end 

