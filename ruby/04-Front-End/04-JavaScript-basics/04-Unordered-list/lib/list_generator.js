const listItem = content => `<li class="list-group-item">${content}</li>`;

const unorderedList = items => {
  const list = items.map(e => listItem(e)).join("\n  ");
  return `<ul class="list-group">\n  ${list}\n</ul>`;
};

module.exports = { listItem, unorderedList }; // Do not remove.
