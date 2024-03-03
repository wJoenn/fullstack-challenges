const tbody = document.querySelector("tbody");
const hover = document.querySelector(".hover");
const leaderboard = document.querySelector(".leaderboard");
let newGame = true;
let start = null;

const buildGrid = n => {
  tbody.innerHTML += `<tr>${'<td class="unopened"></td>'.repeat(n)}</tr>`.repeat(n);
};
buildGrid(10);

const grid = [...tbody.children].map(child => [...child.children]);
tbody.addEventListener("click", e => {
  const td = e.target.classList;

  if (newGame) {
    start = Date.now();
    const randoms = grid.flat().sort(() => Math.random() - Math.random()).slice(0, 10);
    randoms.forEach(rand => rand.classList.add("mine"));

    for (let i = 0; i < grid.length; i++) {
      for (let j = 0; j < grid[i].length; j++) {
        const tile = grid[i][j];
        if (!tile.classList.contains("mine")) {
          let num = 0;
          if (i - 1 >= 0) {
            if (j - 1 >= 0 && grid[i - 1][j - 1].classList.contains("mine")) num++;
            if (grid[i - 1][j].classList.contains("mine")) num++;
            if (j + 1 < grid[i - 1].length && grid[i - 1][j + 1].classList.contains("mine")) num++;
          }
          if (j - 1 >= 0 && grid[i][j - 1].classList.contains("mine")) num++;
          if (j + 1 < grid[i].length && grid[i][j + 1].classList.contains("mine")) num++;
          if (i + 1 < grid.length) {
            if (j - 1 >= 0 && grid[i + 1][j - 1].classList.contains("mine")) num++;
            if (grid[i + 1][j].classList.contains("mine")) num++;
            if (j + 1 < grid[i + 1].length && grid[i + 1][j + 1].classList.contains("mine")) num++;
          }

          if (num > 0) tile.classList.add(`mine-neighbour-${num}`);
        }
      }
    }

    newGame = false;
  }

  if (td.contains("unopened")) {
    td.remove("unopened");
    if (td.contains("mine")) {
      hover.querySelector("h1").innerText = "You lost";
      hover.style.display = "flex";
    } else {
      if (td.length === 0) td.add("opened");

      const unopened = document.querySelectorAll(".unopened");
      for (let a = 0; a < unopened.length; a++) {
        for (let i = 0; i < grid.length; i++) {
          for (let j = 0; j < grid[i].length; j++) {
            const tile = grid[i][j];
            if (i - 1 >= 0) {
              if (j - 1 >= 0 && grid[i - 1][j - 1].classList.contains("opened")) {
                tile.classList.remove("unopened");
                if (tile.classList.length === 0) tile.classList.add("opened");
              }
              if (grid[i - 1][j].classList.contains("opened")) {
                tile.classList.remove("unopened");
                if (tile.classList.length === 0) tile.classList.add("opened");
              }
              if (j + 1 < grid[i - 1].length && grid[i - 1][j + 1].classList.contains("opened")) {
                tile.classList.remove("unopened");
                if (tile.classList.length === 0) tile.classList.add("opened");
              }
            }
            if (j - 1 >= 0 && grid[i][j - 1].classList.contains("opened")) {
              tile.classList.remove("unopened");
              if (tile.classList.length === 0) tile.classList.add("opened");
            }
            if (j + 1 < grid[i].length && grid[i][j + 1].classList.contains("opened")) {
              tile.classList.remove("unopened");
              if (tile.classList.length === 0) tile.classList.add("opened");
            }
            if (i + 1 < grid.length) {
              if (j - 1 >= 0 && grid[i + 1][j - 1].classList.contains("opened")) {
                tile.classList.remove("unopened");
                if (tile.classList.length === 0) tile.classList.add("opened");
              }
              if (grid[i + 1][j].classList.contains("opened")) {
                tile.classList.remove("unopened");
                if (tile.classList.length === 0) tile.classList.add("opened");
              }
              if (j + 1 < grid[i + 1].length && grid[i + 1][j + 1].classList.contains("opened")) {
                tile.classList.remove("unopened");
                if (tile.classList.length === 0) tile.classList.add("opened");
              }
            }
          }
        }
      }


      const flagged = document.querySelectorAll(".flagged");
      const question = document.querySelectorAll(".question");
      const unopenedLength = unopened.length + flagged.length + question.length;

      if (unopenedLength === document.querySelectorAll(".mine").length) {
        const time = Date.now() - start;
        hover.querySelector("h1").innerText = "You won";
        hover.style.display = "flex";

        const scores = [{ user: "LOU", score: time }];
        if (localStorage.getItem("scores")) [...JSON.parse(localStorage.getItem("scores"))].forEach(score => scores.push(score));
        localStorage.setItem("scores", JSON.stringify(scores));
      }
    }
  }
});


tbody.addEventListener("contextmenu", e => {
  e.preventDefault();
  const td = e.target.classList;
  if (td.contains("unopened")) {
    td.remove("unopened");
    td.add("flagged");
  } else if (td.contains("flagged")) {
    td.remove("flagged");
    td.add("question");
  } else if (td.contains("question")) {
    td.remove("question");
    td.add("unopened");
  }
});

hover.querySelector("button").addEventListener("click", () => window.location.reload());

if (localStorage.getItem("scores")) {
  [...JSON.parse(localStorage.getItem("scores"))].sort((a, b) => parseFloat(a.score) - parseFloat(b.score)).forEach(score => {
    leaderboard.innerHTML += `<div class="leaderboard__item">
                                <span class="username">${score.user}</span>
                                <span class=score">${score.score}</span>
                              </div>`;
  });
}
