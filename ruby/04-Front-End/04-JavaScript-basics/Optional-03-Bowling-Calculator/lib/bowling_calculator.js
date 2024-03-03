const bowlingScore = rolls => {
  let [score, strike, spare, previous, round, i] = Array(6).fill(0);

  rolls.forEach(e => {
    if (spare) { score += e; spare = false; }
    if (strike > 2) { score += e; strike--; }
    if (strike) { score += e; strike--; }
    if (i === 0) round += 1;
    i++;

    if (i === 2 && round < 10) {
      if (e + previous === 10) spare = 1;
      i = 0;
    }

    if (e === 10 && round < 10) {
      strike += 2;
      i = 0;
    }

    previous = e;
    score += e;
  });

  return score;
};

module.exports = bowlingScore; // Do not remove this line.
