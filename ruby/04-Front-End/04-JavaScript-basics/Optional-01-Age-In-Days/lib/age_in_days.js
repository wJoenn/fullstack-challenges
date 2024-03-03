const ageInDays = (day, month, year) => {
  const birth = new Date(year, month - 1, day);
  return Math.round((new Date() - birth) / 1000 / 60 / 60 / 24);
};

module.exports = ageInDays; // Do not remove. We need this for the spec to know about your method.
