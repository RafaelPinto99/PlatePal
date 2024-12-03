// app/javascript/controllers/hello_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  greet() {
    console.log("Hello from the Stimulus controller!");
  }
}
