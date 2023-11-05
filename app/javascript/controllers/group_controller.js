import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["group", "options"];
  buildHouseOptions() {
    this.optionsTarget.options = this.groupTarget.value;
  }
}
