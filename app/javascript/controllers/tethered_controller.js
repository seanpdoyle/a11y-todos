import { Controller } from "stimulus"

export default class extends Controller {
  static values = { selector: String }

  connect() {
    const destinationTarget = document.querySelector(this.selectorValue)

    if (destinationTarget) {
      const { top, left, height } = destinationTarget.getBoundingClientRect()

      this.element.style.left = left + "px"
      this.element.style.height = height + "px"
      this.element.style.top = top + "px"
    }
  }
}
