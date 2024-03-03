# This "require" line loads the contents of the "date" file from the standard
# Ruby library, giving you access to the Date class.
require "date"

# This is a comment to remind you not to push too early dumbass

def age_in_days(day, month, year)
  # TODO: return the age expressed in days given the day, month, and year of birth
  Date.today.mjd - Date.new(year, month, day).mjd
end
