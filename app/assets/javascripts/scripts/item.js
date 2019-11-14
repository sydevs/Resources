/* global $ */
/* exported Item */

class Item {

  constructor(element) {
    this.$element = $(element)
    this.$modal = this.$element.children('.js-modal')
    this.$modal.modal({ inverted: true })
    this.$element.click(() => this.showModal())
  }

  showModal() {
    this.$modal.modal('show')
  }

}