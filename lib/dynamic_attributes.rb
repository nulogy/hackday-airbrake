module DynamicAttributes
  def method_missing method_name, *args
    if method_name[-1] == '='
      method_name = method_name.slice(0..-2)
      self.class.send(:attr_accessor, method_name)
      self.send("#{method_name}=", args)
    else
      super
    end
  end
end