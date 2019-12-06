/* global $, Item */
/* exported Grid */

class Grid {

  constructor(element) {
    console.log('Load Grid', element) // eslint-disable-line no-console
    
    this.$element = $(element)
    this.$filters = $('a[data-filter]')
    this.filters = {}
    this.$element.imagesLoaded(() => {
      this.$element.isotope({
        itemSelector: '.js-item',
        layoutMode: element.dataset.layout,
        masonry: {
          fitWidth: true,
          columnWidth: '.js-grid-sizer',
        }
      })
    }, true)
  
    this.$items = this.$element.children('.js-item')
    this.items = []
    this.$items.each((index, item) => {
      this.items.push(new Item(item))
    })

    this.$filters.click(event => this.selectFilter(event.target))
  }

  unload() {
    this.$element.isotope('destroy')
  }

  selectFilter(filter) {
    const $filter = $(filter)
    const filterSelector = $filter.data('filter')
    const filterSelectorSplit = filterSelector.substr(1).split('--')
    const filterGroup = filterSelectorSplit[0]
    const filterValue = filterSelectorSplit[1]

    if (this.filters[filterGroup] == filterSelector || (filterValue == '*' && this.filters[filterGroup] == null)) {
      return
    } else if (filterValue == '*') {
      delete this.filters[filterGroup]
    } else {
      this.filters[filterGroup] = filterSelector
    }

    const filter_expression = $.map(this.filters, value => { return value }).join('')
    this.$element.isotope({ filter: filter_expression.length > 0 ? filter_expression : '*' })
  }

  toggleFilter(filter) {
    const $filter = $(filter)
    const filterSelector = $filter.data('filter')
    const filterGroup = filterSelector.substr(1).split('--')[0]
    const $filters = this.$filters.filter(`[data-filter="${filterSelector}"]`)

    if (this.filters[filterGroup] == filterSelector) {
      $filters.removeClass('active')
      delete this.filters[filterGroup]
    } else {
      $filters.siblings('.active').removeClass('active')
      $filters.addClass('active')
      this.filters[filterGroup] = filterSelector
    }

    const filter_expression = $.map(this.filters, value => { return value }).join('')
    this.$element.isotope({ filter: filter_expression.length > 0 ? filter_expression : '*' })
  }

}