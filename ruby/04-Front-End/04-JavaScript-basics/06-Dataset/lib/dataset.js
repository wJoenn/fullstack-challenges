const dataset = element => {
  if (element === "") return {};

  let data = element.split(">")[0];
  if (/data-\w+=".+"/.test(data)) {
    data = data.match(/data-\w+=".+"/g)[0]
      .replace(/data-|"/g, "")
      .split(" ")
      .map(e => e.split("="))
      .map(e => (+e[1] ? [e[0], +e[1]] : e))
      .map(e => (["true", "false"].includes(e[1]) ? [e[0], e[1] === "true"] : e));

    return Object.fromEntries(data);
  }

  return {};
};

module.exports = dataset; // Do not remove.
