/* global $, Grid */
/* exported Application */

const Application = {

  load: function() {
    console.log('Load JavaScript') // eslint-disable-line no-console
    
    $('.ui.sticky').sticky()
    $('.ui.dropdown').dropdown()

    const grid = document.getElementById('js-grid')
    if (grid) {
      Application.grid = new Grid(grid)
    }
  },

  unload: function() {
    if (Application.grid) {
      Application.grid.unload()
      Application.griid = null
    }
  },

}

$(document).on('turbolinks:load', Application.load)
$(document).on('turbolinks:before-cache', Application.unload)
