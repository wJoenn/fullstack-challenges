# This is a comment to remind you not to push too early dumbass

def compute_name(first_name, middle_name, last_name)
  # TODO: return full name using string interpolation
  middle_name == "" ? "#{first_name} #{last_name}" : "#{first_name} #{middle_name} #{last_name}"
end
