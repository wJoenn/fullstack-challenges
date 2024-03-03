const isGood = soldierType => ["Hobbits", "Elves", "Dwarves", "Eagles"].includes(soldierType);

const buildSoldierObject = bat => Object.fromEntries(bat.split(",").map(e => [e.split(":")[0], +e.split(":")[1]]));

const whoWinsTheWar = battlefield => {
  const sum = Object.entries(buildSoldierObject(battlefield)).reduce((acc, e) => {
    if (isGood(e[0])) return acc + e[1];
    if (e[0]) return acc - e[1];
    return acc;
  }, 0);

  if (sum < 0) return "Evil";
  if (sum > 0) return "Good";
  return "Tie";
};

module.exports = { whoWinsTheWar, buildSoldierObject, isGood }; // Do not remove this line
