# frozen_string_literal: true
require 'active_record'

module ActiveRecord
  class PredicateBuilder
    class ActiveSymbolHandler # :nodoc:
      def initialize(predicate_builder)
        @predicate_builder = predicate_builder
      end

      def call(attribute, value)
# raise 'got to ActiveSymbolHandler'
STDOUT.puts 'got to ActiveSymbolHandler'
# STDOUT.puts [attribute,value].inspect
#         bind = predicate_builder.build_bind_attribute(attribute.name, value)
# STDOUT.puts bind.inspect
# STDOUT.puts attribute.inspect
#   "jj=>ff"
#         # attribute.name is where the ActiveSymbol instance is stored
#         fyi=attribute.send(attribute.name.predicate_method , bind)
STDOUT.puts "fyi: " + fyi.inspect
        # fyi.left.name=attribute.name.sanitized_string        
STDOUT.puts "fyi b: " + fyi.inspect
        fyi
      end

      protected

        attr_reader :predicate_builder
    end
#       alias :original_expand_from_hash :expand_from_hash
#       def expand_from_hash(attributes)
# STDOUT.puts "expand_from_hash(attributes) "+attributes.inspect
#         return ["1=0"] if attributes.empty?
#         attributes.flat_map do |key, value|
#           if key.is_a?(ActiveSymbol)
#             # taak=table.arel_attribute(key)
#             # STDOUT.puts "taak " + taak.inspect
#             # build(table.arel_attribute(key), value)
#             ActiveSymbolHandler.new(self).call(table.arel_attribute(key), value)
#             # apb=associated_predicate_builder(key)
#             # STDOUT.puts "associated_predicate_builder(key)  " + apb.inspect 
#             # associated_predicate_builder(key).expand_from_hash(value)
#           elsif value.is_a?(Hash) && !table.has_column?(key)
#             associated_predicate_builder(key).expand_from_hash(value)
#           elsif table.associated_with?(key)
#             # Find the foreign key when using queries such as:
#             # Post.where(author: author)
#             #
#             # For polymorphic relationships, find the foreign key and type:
#             # PriceEstimate.where(estimate_of: treasure)
#             associated_table = table.associated_table(key)
#             if associated_table.polymorphic_association?
#               case value.is_a?(Array) ? value.first : value
#               when Base, Relation
#                 value = [value] unless value.is_a?(Array)
#                 klass = PolymorphicArrayValue
#               end
#             end

#             klass ||= AssociationQueryValue
#             queries = klass.new(associated_table, value).queries.map do |query|
#               expand_from_hash(query).reduce(&:and)
#             end
#             queries.reduce(&:or)
#           # FIXME: Deprecate this and provide a public API to force equality
#           elsif (value.is_a?(Range) || value.is_a?(Array)) &&
#             table.type(key.to_s).respond_to?(:subtype)
#             BasicObjectHandler.new(self).call(table.arel_attribute(key), value)
#           else
#             build(table.arel_attribute(key), value)
#           end
#         end
#       end

  end
end
