const refresh = document.querySelector("#refresh");
const commentForm = document.querySelector("#comment-form");
const ul = document.querySelector("#messages ul");

const batch = 1086;
const baseUrl = "https://wagon-chat.herokuapp.com/";

const addMessages = messages => {
  ul.innerHTML = "";
  messages.forEach(e => {
    const minutes = Math.floor((new Date(Date.now()) - new Date(e.created_at)) / 60000);
    ul.innerHTML += `<li>${e.content} (posted <span class="date">${minutes} minutes ago</span>) by ${e.author}</li>`;
  });
};

const fetchMessages = () => {
  fetch(`${baseUrl}${batch}/messages`)
    .then(res => res.json())
    .then(data => {
      addMessages(data.messages);
    });
};

const postMessage = event => {
  event.preventDefault();
  const messageContent = event.currentTarget.querySelector("#your-message");
  const messageAuthor = event.currentTarget.querySelector("#your-name");
  fetch(`${baseUrl}${batch}/messages`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ content: messageContent.value, author: messageAuthor.value })
  }).then(res => res.json())
    .then(fetchMessages());

  messageContent.value = "";
  messageAuthor.value = "";
};

fetchMessages();
commentForm.addEventListener("submit", postMessage);
