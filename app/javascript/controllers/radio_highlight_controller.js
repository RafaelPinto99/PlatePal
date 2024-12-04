// app/javascript/controllers/radio_highlight_controller.js

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["eachAnswer"]; // Optional, if you want to specifically target elements.

  connect() {
    document.querySelector('input[type="radio"]:checked').parentElement.classList.add("active-selected");
  }

  highlight(event) {
    // Remove `active-selected` from all sibling options
    this.element.querySelectorAll(".each-answer").forEach((el) => {
      el.classList.remove("active-selected");
    });

    // Add `active-selected` to the selected option
    const selectedOption = event.target.closest(".each-answer");
    if (selectedOption) {
      selectedOption.classList.add("active-selected");

      // Find and check the hidden radio button within the selected container
      const radioButton = selectedOption.querySelector('input[type="radio"]');
      if (radioButton) {
        radioButton.checked = true;
      }
    }
  }
}
