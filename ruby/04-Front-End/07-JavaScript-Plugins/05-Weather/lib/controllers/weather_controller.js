import { Controller } from "@hotwired/stimulus";

const key = "90c3ad06e12a0dc4c531ef9f2f9e2f98";

export default class extends Controller {
  static targets = ["input", "city", "time", "description", "icon", "temp"]

  connect() {
    this.getLocalWeather(null);
  }

  getLocalWeather(event) {
    if (event) event.preventDefault();
    navigator.geolocation.getCurrentPosition(pos => {
      const lat = pos.coords.latitude;
      const lon = pos.coords.longitude;
      this.#fetchWeather(`lat=${lat}&lon=${lon}`)
        .then(data => this.#buildHTML(data));
    });
  }

  getWeather(event) {
    event.preventDefault();
    const city = this.inputTarget.value;
    this.#fetchWeather(`q=${city}`)
      .then(data => this.#buildHTML(data));
  }

  #buildHTML(data) {
    this.cityTarget.innerText = data.city;
    this.descriptionTarget.innerText = data.description;
    this.timeTarget.innerText = data.time;
    this.iconTarget.src = data.icon;
    this.tempTarget.innerText = `${data.temp}°C`;
  }

  #fetchWeather(query) {
    return fetch(`https://api.openweathermap.org/data/2.5/weather?${query}&appid=${key}&units=metric`)
      .then(res => res.json())
      .then(data => {
        const localTime = Date.now() + (data.timezone * 1000) + (new Date().getTimezoneOffset() * 60000);
        const option = {
          weekday: "long",
          month: "long",
          day: "numeric",
          hour: "numeric",
          hour12: true
        };

        return {
          city: data.name,
          time: new Date(localTime).toLocaleDateString("en-GB", option).replace(/ at/, ","),
          description: data.weather[0].description,
          icon: `https://openweathermap.org/img/w/${data.weather[0].icon}.png`,
          temp: Math.round(data.main.temp)
        };
      });
  }
}
