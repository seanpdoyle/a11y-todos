import { Controller } from "stimulus"

export default class extends Controller {
  static values = { outletSelector: String }

  replace({ detail: [ response ] }) {
    this.outletTargets.forEach(outlet => {
      outlet.innerHTML = response.body.innerHTML
      outlet.querySelector("[autofocus]")?.focus()
    })
  }

  remove() {
    this.outletTargets.forEach(outlet => outlet.innerHTML = "")
  }

  get outletTargets() {
    return document.querySelectorAll(this.outletSelectorValue)
  }
}
