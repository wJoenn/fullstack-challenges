const fillCalendar = (date, htmlDays, htmlMonth, today) => {
  htmlDays.innerHTML = "";

  const year = date.getFullYear();
  const monthString = date.toLocaleDateString("en-GB", { month: "long" });

  htmlMonth.innerHTML = `${monthString}, ${year}`;

  const month = date.getMonth();
  let firstDay = new Date(year, month, 1).getDay();

  if (firstDay === 0) firstDay = 7;

  const lastMonthDaysAmount = new Date(year, month, 0).getDate();
  for (let i = firstDay - 2; i >= 0; i--) {
    htmlDays.innerHTML += `<span class="day day-grey">${lastMonthDaysAmount - i}</span>`;
  }

  const daysAmount = new Date(year, month + 1, 0).getDate();
  for (let i = 1; i <= daysAmount; i++) {
    htmlDays.innerHTML += `<span class="day ${today.getTime() === new Date(year, month, i).getTime() ? "today" : ""} ${["Mon", "Sat", "Sun"].includes(new Date(year, month, i).toLocaleDateString("en-GB", { weekday: "short" })) ? "yoga" : ""}">${i}</span>`;
  }

  let lastDay = new Date(year, month + 1, 0).getDay();
  if (lastDay === 0) lastDay = 7;

  for (let i = 1; i <= 7 - lastDay; i++) {
    htmlDays.innerHTML += `<span class="day day-grey">${i}</span>`;
  }
};
