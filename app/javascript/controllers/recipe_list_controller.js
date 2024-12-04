import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="highlight"
export default class extends Controller {
  static targets = ["item"];

  connect() {
    console.log("HELLO");
  }

  highlight(event) {
    this.itemTargets.forEach((item) => {
      item.classList.remove("highlight")
    });
    event.currentTarget.classList.add("highlight");
  }
}
