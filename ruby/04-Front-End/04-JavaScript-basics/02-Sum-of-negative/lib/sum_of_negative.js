const sumOfNegative = numbers => (numbers.filter(number => (number < 0)).reduce((sum, num) => sum + num, 0));

console.log(sumOfNegative([1, 2]));
module.exports = sumOfNegative; // Do not remove.
