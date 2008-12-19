# Start with supporting customizing your Sequel::Model#inspect

module Sequel
  class Model
    def self.opp_filter_out(*fields)
      return unless @values
      @filter_values = @values.dup
      fields.each {|field| @filter_values.delete(field)}
      "#<#{model.name} @values=#{@filter_values.inspect}>"
    end
  end
end
  
  