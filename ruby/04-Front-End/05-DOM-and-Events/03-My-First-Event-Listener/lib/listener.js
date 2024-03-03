const btn = document.querySelector("#clickme");
btn.addEventListener("click", () => {
  btn.classList.add("disabled");
  btn.innerText = "Bingo!";
  new Audio("../sound.mp3").play();
});
