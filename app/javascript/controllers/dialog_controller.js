import { Controller } from "stimulus"
import dialogPolyfill from "dialog-polyfill"
import "babe9fad4a65625b301ba482dad284d1/dialog-focus-restore"
import "dialog-polyfill/dist/dialog-polyfill.css"

export default class extends Controller {
  connect() {
    dialogPolyfill.registerDialog(this.element)
  }

  close() {
    if (this.element.open) {
      this.element.close()
    }
  }
}
