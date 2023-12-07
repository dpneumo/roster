// app/javasctipt/controllers/dropdown_controller.js
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = ["content"]

  connect() {
    this.close()
  }

  toggle() {
    if (this.contentTarget.classList.contains("hidden")) {
      this.open()
    }
    else {
      this.close()
    }
  }

  open() {
    this.contentTarget.classList.remove("hidden")
  }

  close() {
    this.contentTarget.classList.add("hidden")
  }
}
