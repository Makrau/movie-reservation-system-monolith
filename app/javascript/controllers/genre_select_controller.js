import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.classList.add('w-full', 'p-2', 'border', 'rounded')
    this.element.size = 5
  }
}