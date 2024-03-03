const button = document.querySelector("button");
const displayAlertOnButtonClick = () => {
  button.addEventListener("click", () => alert("Thank you!"));
};

displayAlertOnButtonClick();
