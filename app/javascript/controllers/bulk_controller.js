import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "form" ]

  select({ currentTarget }) {
    const value = currentTarget.getAttribute(`data-${this.identifier}-value`)
    const input = this.inputTargets.find(input => input.value === value)

    if (input) {
      input.checked = true
      input.focus()
    }
  }

  resetIfAllUnchecked() {
    if (this.inputTargets.some(input => input.checked)) return

    this.resetForm()
  }

  resetForm() {
    this.formTarget.reset()
  }

  get inputTargets() {
    return Array.from(this.formTarget.elements)
  }
}
