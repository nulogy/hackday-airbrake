module DynamicAttributes
  extend ActiveSupport::Concern

  module ClassMethods
    attr_reader :attributes

    def define_attrs *args
      @attributes ||= []

      args.each do |arg|
        attr_accessor arg
        self.attributes << arg
      end
    end
  end

  def method_missing method_name, *args
    if method_name[-1] == '='
      method_name = method_name.slice(0..-2)
      self.class.send(:attr_accessor, method_name)
      self.class.attributes << method_name
      self.send("#{method_name}=", args)
    else
      super
    end
  end

  def attributes
    self.class.attributes
  end
end