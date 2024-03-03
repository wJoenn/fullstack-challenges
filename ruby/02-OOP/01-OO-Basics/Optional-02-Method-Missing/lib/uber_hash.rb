class UberHash
  def method_missing(symbol, *args)
    symbol.to_s[-1] == "=" ? sym = "@#{symbol[0...-1]}".to_sym : sym = "@#{symbol}".to_sym

    if args == []
      instance_variable_get(sym)
    else
      instance_variable_set(sym, args[0])
    end
  end
end
