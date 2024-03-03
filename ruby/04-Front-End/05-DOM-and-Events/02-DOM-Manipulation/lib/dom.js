/* eslint-disable no-multiple-empty-lines */
/* eslint-disable prefer-const */

// INSTRUCTIONS - PLEASE READ!!
// Here are some challenges. Solve them from top to bottom

// **Each time** you complete a challenge, please commit and push!
// This is a good practice. Each time you make some progress in software
// development, you want to save a snapshot.


module.exports = function runChallenges(check) {
  const email = document.querySelector("#email");
  const getEmail = () => email.value;

  // /!\ DO NOT CHANGE THIS LINE - TEST PURPOSES
  const borisesEmail = getEmail();

  // Ex 2. Change the content of the email input by writing your own email address
  email.value = "louisjdramos@gmail.com";

  // Ex 3. Replace the email hint (next to the input) with 'This is my email now'
  //       The text should be emphasized using a <strong> tag
  const emailHint = document.querySelector("#email-hint");
  emailHint.innerHTML = "<strong>This is my email now</strong>";


  // Ex 4. Add the .blue CSS class to the th elements
  const ths = document.querySelectorAll("th");
  ths.forEach(e => e.classList.add("blue"));


  // Ex 5. Count the number of table body rows there are
  //       Make the function teamCount() return it
  const trs = document.querySelectorAll("tbody tr");
  const teamCount = () => trs.length;

  // /!\ DO NOT CHANGE THIS LINE - TEST PURPOSES
  const teamCountBeforeAddition = teamCount();

  // Ex 6. Say there is a 15th team added to the table.
  //       Add a row at the bottom, this new team should have zero points.
  const tbody = document.querySelector("tbody");
  tbody.innerHTML += "<tr><td>15</td><td>Yes </td><td>0</td></tr>";


  // Ex 7. Write some code to sum all points given to all teams
  //       Make the function summarizePoints() return it
  const scores = document.querySelectorAll("tbody tr td:last-child");
  const summarizePoints = () => [...scores].reduce((sum, e) => sum + +e.innerText, 0);


  // Ex 8. Change the background color of all `<th>` cells to #DDF4FF
  ths.forEach(e => { e.style.backgroundColor = "#DDF4FF"; });



  // Ex 9. Remove the "Email:" label from the DOM
  const label = document.querySelector("label");
  label.remove();









  // Checking exercise answers. DO NOT MODIFY THIS LINE
  check(borisesEmail, teamCountBeforeAddition, summarizePoints());
};
