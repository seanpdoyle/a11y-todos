import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "dialog" ]

  showModal() {
    this.dialogTarget.showModal()
  }
}
