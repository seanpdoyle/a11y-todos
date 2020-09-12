import { Controller } from "stimulus"

export default class extends Controller {
  resetIfAllUnchecked() {
    if (this.inputTargets.some(input => input.checked)) return

    this.reset()
  }

  reset() {
    this.formTarget.reset()
  }

  get inputTargets() {
    return Array.from(this.formTarget.elements)
  }

  get formTarget() {
    const selector = `[data-${this.identifier}-target="form"]`

    return this.element.querySelector(selector)
  }
}
