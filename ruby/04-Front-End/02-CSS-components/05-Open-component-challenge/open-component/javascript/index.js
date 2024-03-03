const htmlMonth = document.querySelector(".month h2");
const htmlDays = document.querySelector(".days");
const calendarForm = document.querySelector(".calendar__form");
const calendarToday = document.querySelector("#today");
const calendarPrevious = document.querySelector("#calendar__previous");
const calendarNext = document.querySelector("#calendar__next");
const xmark = document.querySelector(".xmark");

const today = new Date();
today.setHours(0, 0, 0, 0);

let currentYear = today.getFullYear();
let currentMonth = today.getMonth();

const yogaEvent = () => {
  const yogaDays = document.querySelectorAll(".yoga");
  yogaDays.forEach(e => {
    e.addEventListener("click", event => {
      event.preventDefault();
      showForm(calendarForm);
    });
  });
};

fillCalendar(today, htmlDays, htmlMonth, today);

calendarToday.addEventListener("click", e => {
  e.preventDefault();
  fillCalendar(today, htmlDays, htmlMonth, today);
  hideForm(calendarForm);
  yogaEvent();
  currentYear = today.getFullYear();
  currentMonth = today.getMonth();
});

calendarPrevious.addEventListener("click", e => {
  e.preventDefault();
  fillCalendar(new Date(currentYear, currentMonth -= 1, 1), htmlDays, htmlMonth, today);
  yogaEvent();
});

calendarNext.addEventListener("click", e => {
  e.preventDefault();
  fillCalendar(new Date(currentYear, currentMonth += 1, 1), htmlDays, htmlMonth, today);
  yogaEvent();
});

xmark.addEventListener("click", e => {
  e.preventDefault();
  hideForm(calendarForm);
});

yogaEvent();
