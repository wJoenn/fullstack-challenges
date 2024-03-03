let action = document.querySelector(".actions");
const minus = document.querySelector(".minus");
const priceInput = document.querySelector("#price-input");
const submit = document.querySelector("#submit");
const price = document.querySelector("#price").dataset.amountCents;

const toggleDisabled = counter => {
  if (counter === 1) minus.classList.add("disabled");
  else minus.classList.remove("disabled");
};

const updateInputs = counter => {
  priceInput.value = price * counter;
  submit.value = `Pay ${price * counter / 100}€`;
};

const incrementCounter = (counter, offset) => {
  const count = +counter.dataset.count + offset;

  counter.dataset.count = count;
  counter.innerText = count;

  action = document.querySelector(".actions");

  toggleDisabled(count);
  updateInputs(count);
};

action.addEventListener("click", event => {
  const counter = action.querySelector("#counter");
  if (event.target.classList.contains("incrementer")) incrementCounter(counter, +event.target.dataset.offset);
});
