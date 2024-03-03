/* eslint-disable no-multiple-empty-lines */
const { faker } = require("@faker-js/faker");

const hasNewMessage = () => Math.random() <= 0.2;

const newMessage = () => {
  return { sender: faker.name.fullName(), subject: faker.lorem.sentence(Math.floor(Math.random() * 6) + 1) };
};

const appendMessageToDom = message => {
  const inboxElement = document.querySelector("#inbox");
  inboxElement.innerHTML = `<div class="row message unread">
                       <div class="col-3">${message.sender}</div>
                       <div class="col-9">${message.subject}</div>
                     </div>
                     ${inboxElement.innerHTML}`;
};

const refresh = () => {
  if (hasNewMessage()) appendMessageToDom(newMessage());
};















// Do not remove these lines:
document.addEventListener("DOMContentLoaded", () => {
  setInterval(refresh, 1000); // Every 1 second, the `refresh` function is called.
});

module.exports = { hasNewMessage, newMessage };
