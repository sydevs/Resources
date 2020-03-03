/* global $, Grid, Item */
/* exported Application */

const Application = {

  load: function() {
    console.log('Load JavaScript') // eslint-disable-line no-console
    
    $('.ui.dropdown').dropdown()

    const grid = document.getElementById('js-grid')
    
    if (grid) {
      Application.grid = new Grid(grid)
    } else {
      document.querySelectorAll('.js-item').forEach(item => { new Item(item) }) // eslint-disable-line no-new
    }
  },

  unload: function() {
    if (Application.grid) {
      Application.grid.unload()
      Application.grid = null
    }
  },

}

$(document).on('turbolinks:load', Application.load)
$(document).on('turbolinks:before-cache', Application.unload)
