const hideForm = calendarForm => {
  calendarForm.style.opacity = 0;
  calendarForm.style.zIndex = -10;
};

const showForm = calendarForm => {
  calendarForm.style.opacity = 1;
  calendarForm.style.zIndex = 10;
};
