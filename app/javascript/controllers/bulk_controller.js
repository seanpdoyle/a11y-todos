import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "form" ]

  select({ currentTarget }) {
    const value = currentTarget.getAttribute(`data-${this.identifier}-value`)
    const inputTargets = Array.from(this.formTarget.elements)

    const input = inputTargets.find(input => input.value === value)

    if (input) {
      input.checked = true
      input.focus()
    }
  }

  resetForm() {
    this.formTarget.reset()
  }
}
