def age_in_days(day : Int32, month : Int32, year : Int32) : Int64
  (Time.utc - Time.utc(year, month, day)).days
end
