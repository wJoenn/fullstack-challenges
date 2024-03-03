const inputs = document.querySelectorAll("input, textarea");
const submit = document.querySelector("button");

inputs.forEach(input => {
  input.addEventListener("input", () => {
    if (input.value === ""
    || (input.name === "tos" && !input.checked)
    || (input.name === "zip_code" && !/^\d{5}$/.test(input.value))
    || (input.name === "email" && !/^[^@]+@\w+\.\w{2,3}$/.test(input.value))
    || (input.name === "mobile_phone" && !/^((\+|00 ?)33|0) ?[67] ?(\d{2} ?){4}$/.test(input.value))) {
      input.classList.add("is-invalid");
      input.classList.remove("is-valid");
    } else {
      input.classList.remove("is-invalid");
      input.classList.add("is-valid");
    }

    if ([...inputs].every(e => e.classList.contains("is-valid"))) submit.classList.remove("disabled");
    else submit.classList.add("disabled");
  });
});
