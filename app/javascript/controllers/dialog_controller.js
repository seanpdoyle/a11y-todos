import { Controller } from "stimulus"
import dialogPolyfill from "dialog-polyfill"
import "dialog-polyfill/dist/dialog-polyfill.css"

export default class extends Controller {
  connect() {
    dialogPolyfill.registerDialog(this.element)
  }
}
