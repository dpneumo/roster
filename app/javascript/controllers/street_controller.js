import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  static targets = ["houseSelect"]

  change(event) {
    let street = event.target.selectedOptions[0].value
    let target = this.houseSelectTarget.id

    get(`/people/houses?target=${target}&street=${street}`, {
        responseKind: "turbo-stream"
      })
  }
}
