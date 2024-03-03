const timer = document.querySelector("#timer");
const playerOne = document.querySelectorAll("#player1-race td");
const playerTwo = document.querySelectorAll("#player2-race td");
const result = document.querySelector("#result");
let next = false;


const advance = player => {
  player.forEach(e => {
    if (next) e.classList.add("active");
    if (e.classList.contains("active") && !next) { next = true; e.classList.remove("active"); }
    if (e.classList.contains("active") && next) next = false;
  });
};

const showResult = player => {
  result.querySelector("h2").innerText = `Player ${player} won the race !`;
  result.style.display = "flex";
  result.querySelector("button").addEventListener("click", () => window.location.reload());
};

const preventTab = event => { if (event.keyCode === 9) event.preventDefault(); };

const runEvent = event => {
  if (event.key === "a") { advance(playerOne); }
  if (event.key === "p") { advance(playerTwo); }

  if ([...playerOne].pop().classList.contains("active")) {
    showResult(1);
    window.removeEventListener("keydown", preventTab);
    window.removeEventListener("keyup", runEvent);
  } else if ([...playerTwo].pop().classList.contains("active")) {
    showResult(2);
    window.removeEventListener("keydown", preventTab);
    window.removeEventListener("keyup", runEvent);
  }
};

const run = async () => {
  for (let i = 3; i > 0; i--) {
    timer.querySelector("span").innerText = i;
    await new Promise(r => setTimeout(r, 1000));
  }
  timer.style.display = "none";

  window.addEventListener("keydown", preventTab);
  window.addEventListener("keyup", runEvent);
};

run();
