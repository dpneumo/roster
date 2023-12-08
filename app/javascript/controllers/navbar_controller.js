import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = { state: Boolean };
  static targets = ["menu"];

  connect() {
    console.log(this.stateValue);
    console.log("this is another log entry!");
  }

  toggle() {
    console.log("this is another toggle!");
    this.stateValue = !this.stateValue;

    if (this.stateValue) {
      this.openMenu();
    } else {
      this.closeMenu();
    }
  }

  openMenu() {
    this.menuTarget.classList.remove("hidden");
  }

  closeMenu() {
    this.menuTarget.classList.add("hidden");
  }
}
