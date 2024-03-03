def circle_area(radius : Int) : Float64
  return 0.to_f64 if radius.negative?

  Math::PI * radius**2
end
