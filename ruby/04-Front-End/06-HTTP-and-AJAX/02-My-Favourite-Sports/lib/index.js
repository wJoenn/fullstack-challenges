const clickables = document.querySelector(".clickables");
clickables.addEventListener("click", e => {
  if (e.target.classList.contains("clickable")) e.target.classList.toggle("active");
  else if (e.target.parentElement.classList.contains("clickable")) e.target.parentElement.classList.toggle("active");
});
