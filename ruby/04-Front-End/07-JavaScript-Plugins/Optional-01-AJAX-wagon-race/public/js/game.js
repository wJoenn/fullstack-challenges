const url = "http://localhost:4567";
const button = document.querySelector("button");
const form = document.querySelector("form");
const table = document.querySelector("table");
const player1 = document.querySelectorAll(".player1 td");
const player2 = document.querySelectorAll(".player2 td");
let sessId = null;
let gameId = null;
let players = [];
let start = null;

const playAgain = () => {
  for (let i = 0; i < player1.length; i++) {
    if (i === 0) {
      player1[i].classList.add("active"); player2[i].classList.add("active");
    } else { player1[i].classList.remove("active"); player2[i].classList.remove("active"); }
  }

  start = null;
  window.addEventListener("keyup", playGame);
};

const postFinish = (player, time) => {
  fetch(`${url}/games/${gameId}/finish`, {
    method: "PATCH",
    headers: { "Content-type": "application/json" },
    body: JSON.stringify({ winner: player.id, elapsed_time: time })
  }).then(() => {
    fetch(`${url}/sessions/${sessId}/games`)
      .then(res => res.json())
      .then(data => {
        data.games.completed.forEach(e => {
          fetch(`${url}/games/${e}/results`)
            .then(res => res.json())
            .then(gameData => console.log(gameData));
        });
      }).then(() => playAgain());
  });
};

const finish = () => {
  window.removeEventListener("keyup", playGame);
  const time = Math.ceil((Date.now() - start) / 1000);

  const i = player1.length - 1;
  if (player1[i].classList.contains("active")) postFinish(players[0], time);
  else postFinish(players[1], time);
};

const move = player => {
  let next = false;
  player.forEach(e => {
    if (e.classList.contains("active")) {
      next = true;
      e.classList.remove("active");
    } else if (next) {
      next = false;
      e.classList.add("active");
    }
  });

  if (player[player.length - 1].classList.contains("active")) finish();
};

const playGame = e => {
  if (!start) start = Date.now();
  if (e.key === "a") move(player1);
  else if (e.key === "p") move(player2);
};

fetch(`${url}/sessions`, {
  method: "POST"
}).then(res => res.json())
  .then(data => {
    sessId = data.id;
    button.classList.remove("hidden");
  });

button.addEventListener("click", () => {
  button.classList.add("hidden");
  form.classList.remove("hidden");
});

form.addEventListener("submit", e => {
  e.preventDefault();
  const formData = Object.fromEntries(new FormData(form));
  fetch(`${url}/sessions/${sessId}/games`, {
    method: "POST",
    headers: { "Content-type": "application/json" },
    body: JSON.stringify(formData)
  }).then(res => res.json())
    .then(data => {
      players = data.game.players;
      gameId = data.game.id;
      form.classList.add("hidden");
      table.classList.remove("hidden");
      window.addEventListener("keyup", playGame);
    });
});
