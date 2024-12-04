import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.element.addEventListener("hidden.bs.modal", this.saveChanges.bind(this));
  }

  saveChanges(event) {
    const forms = this.element.querySelectorAll("form");
    forms.forEach((form) => {
      if (form.reportValidity()) {
        form.requestSubmit(); 
      }
    });
  }

  disconnect() {
    this.element.removeEventListener("hidden.bs.modal", this.saveChanges.bind(this));
  }
}
