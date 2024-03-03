def circle_area(radius)
  radius.positive? ? Math::PI * (radius**2) : 0
end
