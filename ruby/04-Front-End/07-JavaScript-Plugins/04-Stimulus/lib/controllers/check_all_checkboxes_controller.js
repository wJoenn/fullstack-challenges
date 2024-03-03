import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("The 'check_all_checkboxes' controller is now loaded");
  }

  static targets = ["checkbox"]

  checkAll(event) {
    this.checkboxTargets.forEach(e => { e.checked = event.target.checked; });
  }
}
