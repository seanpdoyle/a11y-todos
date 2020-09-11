import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "output" ]

  connect() {
    if (this.hasOutputTarget) {
      this.announceChecked()
    }
  }

  announceChecked() {
    const { length } = this.inputTargets.filter(input => input.checked)
    const attribute = length === 1 ?
      `data-${this.identifier}-singular-value` :
      `data-${this.identifier}-plural-value`
    const message = `${length} ${this.outputTarget.getAttribute(attribute)}`

    this.outputTarget.innerHTML = message
  }

  get inputTargets() {
    return Array.from(this.element.elements)
  }
}
