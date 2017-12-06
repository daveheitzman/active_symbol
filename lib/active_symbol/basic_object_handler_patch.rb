module ActiveRecord
  class PredicateBuilder
    class BasicObjectHandler # :nodoc:
      alias :__original_call__ :call
      def call(attribute, value)
        if attribute.name.is_a?(ActiveSymbol::Base)
  # raise 'got to ActiveSymbolHandler'
  STDOUT.puts 'got to BasicObjectHandler'
  STDOUT.puts [attribute,value].inspect
          # new_predicate_builder = predicate_builder || PredicateBuilder.new(table_metadata)
  # byebug
          predicate_builder = PredicateBuilder.new(table_metadata)
          ActiveSymbolHandler.new(predicate_builder)
          # bind = predicate_builder.build_bind_attribute(attribute.name, value)
          # bind=attribute.name.build_bind_attribute(attribute,value)
# bind=nil
  # STDOUT.puts bind.inspect
  # STDOUT.puts attribute.inspect
    "jj=>ff"
          # attribute.name is where the ActiveSymbol instance is stored
          # bind=
          fyi=attribute.send(attribute.name.predicate_method , value)
  STDOUT.puts "fyi: " + fyi.inspect
          fyi.left.name=attribute.name.sanitized_string        
  STDOUT.puts "fyi b: " + fyi.inspect
          fyi
      
        else
# byebug          
          original_output=__original_call__(attribute,value)
          # original_output
          # bind = predicate_builder.build_bind_attribute(attribute.name, value)
          # attribute.eq(bind)
        end 
      end

    end
  end
end
