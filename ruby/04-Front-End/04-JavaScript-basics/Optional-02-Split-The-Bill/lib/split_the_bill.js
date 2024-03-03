const splitTheBill = group => {
  const groupArr = Object.entries(group);
  if (groupArr.length === 0) return {};

  const average = groupArr.reduce((sum, e) => sum + e[1], 0) / groupArr.length;
  return Object.fromEntries(groupArr.map(e => [e[0], e[1] - average]));
};

module.exports = splitTheBill; // Do not remove this line.
