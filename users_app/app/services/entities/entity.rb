# frozen_string_literal: true

module Entities
  class Entity
    def initialize(entity)
      @entity = entity
    end

    def mapped
      values = {}
      self.class.options.each_key do |key|
        values[key] = if self.class.options[key].respond_to?(:call)
                        self.class.options[key].call(@entity)
                      else
                        self.class.options[key]
                      end
      end

      values
    end

    def self.string(name, value = nil, &block)
      raise Error, "String name need to be a symbol" unless name.instance_of?(Symbol)

      raise Error, "String value must be nil or a string" unless value.nil? || value.instance_of?(String)

      options[name] = block and return if value.nil?

      options[name] = value
    end

    def self.options
      @options ||= {}
    end
  end
end
