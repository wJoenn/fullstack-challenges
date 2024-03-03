import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl";

const key = "pk.eyJ1Ijoiam9lbm4iLCJhIjoiY2xjaGs2b3dmMDE5cDNvcDZiZjRsazVsdSJ9.Kv5z3Bl6rk65Y--QpyjYZQ";

export default class extends Controller {
  connect() {
    console.log("The 'geocoder' controller is now loaded");
  }

  static targets = ["input", "coords", "map"]

  fetchCoords(event) {
    event.preventDefault();
    const address = this.inputTarget.value;

    fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${address}.json?access_token=${key}`)
      .then(res => res.json())
      .then(data => {
        console.log(data);
        const coords = data.features[0].center;
        this.coordsTarget.innerText = coords.join(", ");

        mapboxgl.accessToken = key;
        const map = new mapboxgl.Map({
          container: "map",
          style: "mapbox://styles/mapbox/streets-v9",
          center: coords,
          zoom: 12
        });

        new mapboxgl.Marker()
          .setLngLat(coords)
          .addTo(map);
      });
  }
}
