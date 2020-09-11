import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "dialog", "main", "remoteFragment" ]

  release() {
    this.remoteFragmentTargets.forEach(form => form.reset())
    this.mainTarget.inert = false
  }

  showModal() {
    this.dialogTarget.showModal()
    this.mainTarget.inert = true
  }
}
