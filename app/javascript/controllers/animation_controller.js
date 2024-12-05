import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="animation"
export default class extends Controller {
  static targets = [ "form","loading" ]
  connect() {
    if (!this.hasLoadingTarget) {
      console.error("Loading target is missing!");
      return;
    }
    if (this.loadingTarget) {
      this.formTarget.style.display = 'none';
      setTimeout(() => {
        this.loadingTarget.style.display = 'none';
        this.formTarget.style.display = 'block';
      }, 3000);
    }
  }

}
