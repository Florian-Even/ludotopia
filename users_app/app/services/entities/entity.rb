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

    def self.string(key, value = nil, &block)
      unless key.instance_of?(Symbol) || key.instance_of?(String)
        raise Error, "String key need to be a symbol or a string"
      end

      raise Error, "String value must be nil or a string" unless value.nil? || value.instance_of?(String)

      options[key] = block and return if value.nil?

      options[key] = value
    end

    def self.options
      @options ||= {}
    end
  end
end
