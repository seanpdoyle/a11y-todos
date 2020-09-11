import { Controller } from "stimulus"

export default class extends Controller {
  static values = { horizontal: Boolean }

  trapFocus({ target }) {
    if (this.focusableElements.some(element => element.contains(target))) {
      this.focusableElements.forEach(element => element.setAttribute("tabindex", -1))

      target.setAttribute("tabindex", 0)
    }
  }

  navigate(event) {
    if (this.navigationKeys.includes(event.key)) {
      event.preventDefault()

      const { activeElement } = document
      const index = this.focusableElements.findIndex(element => element == activeElement)
      const direction = this.directions[event.key]
      const element = this.focusableElements[index + direction]

      element?.focus()
    }
  }

  get navigationKeys() {
    const vertical = [ "ArrowUp", "ArrowDown" ]
    const horizontal = [ "ArrowRight", "ArrowLeft" ]

    return this.horizontalValue ?
      vertical + horizontal :
      vertical
  }

  get directions() {
    return {
      ArrowUp: -1,
      ArrowLeft: -1,
      ArrowDown: +1,
      ArrowRight: +1,
    }
  }

  get focusableElements() {
    const selector = `button, textarea, select, input:not([type="hidden"])`

    return Array.from(this.element.querySelectorAll(selector))
  }
}
