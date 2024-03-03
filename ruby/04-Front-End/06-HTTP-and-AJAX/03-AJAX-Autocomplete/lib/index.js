const input = document.querySelector("#search");
const ul = document.querySelector("ul");

input.addEventListener("input", event => {
  if (event.target.value !== "") input.style.transitionDelay = "300ms";
  else input.style.transitionDelay = "0ms";

  fetch(`https://wagon-dictionary.herokuapp.com/autocomplete/${event.target.value}`)
    .then(res => res.json())
    .then(data => {
      ul.innerHTML = "";
      ul.style.display = "block";
      if (data.words) {
        data.words.forEach(e => { ul.innerHTML += `<li>${e}</li>`; });
        ul.style.transform = "scaleY(1)";
      } else ul.style.display = "none";
    });
});

input.addEventListener("blur", () => {
  if (ul.innerHTML !== "") { input.style.transitionDelay = "0ms"; ul.style.transform = "scaleY(0)"; }
});

input.addEventListener("focus", () => {
  if (ul.innerHTML !== "") { input.style.transitionDelay = "300ms"; ul.style.transform = "scaleY(1)"; }
});
