module ActiveRecord
  class PredicateBuilder
    class BasicObjectHandler # :nodoc:
      alias :__original_call__ :call
      def call(attribute, value)
        if attribute.name.is_a?(ActiveSymbol::Base)
          to_return = attribute.send(attribute.name.predicate_method, value)
          attribute.name.to_s_sanitized_string! 
          return to_return
        else
          original_output=__original_call__(attribute,value)
        end 
      end
    end
  end
end
