import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "dialog", "remoteFragment" ]

  release() {
    this.remoteFragmentTargets.forEach(form => form.reset())
  }

  showModal() {
    this.dialogTarget.showModal()
  }
}
