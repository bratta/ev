View = require 'views/base/view'
EvCalculator = require 'lib/ev_calculator'

module.exports = class HomePageView extends View
  autoRender: true
  className: 'home-page'
  template: require './templates/home'
  resultsTemplate: require './templates/results'

  bindings:
    '[name=pokerus]': {observe: 'pokerus', onSet: 'formatBoolean', onGet: 'formatBoolean'}
    '[name=power_items]': {observe: 'power_items', onSet: 'formatBoolean', onGet: 'formatBoolean'}
    '[name=macho_brace]': {observe: 'macho_brace', onSet: 'formatBoolean', onGet: 'formatBoolean'}
    '#target_evs': {observe: 'target_evs', onSet: 'formatNumber', onGet: 'formatNumber'}
    '#ev_per_pokemon': {observe: 'ev_per_pokemon', onSet: 'formatNumber', onGet: 'formatNumber'}

  initialize: (opts) ->
    super
    @listenTo @model, "change", @enableStatefulFeatures

  render: ->
    super
    @stickit(@model)
    @enableStatefulFeatures()

  formatBoolean: (value, options) ->
    if value == "true"
      true 
    else if value == "false"
      false
    else if value
      true
    else
      false

  formatNumber: (value, options) ->
    parseInt(value)

  enableStatefulFeatures: ->
    if @model.get("power_items")
      @$("#macho_brace_container").addClass("hide")
    else
      @$("#macho_brace_container").removeClass("hide")
    @calculateEvs()

  calculateEvs: ->
    if @model.isValid()
      @showSuccess(@resultsTemplate(calc: new EvCalculator(@model).calculate()))
    else
      @showError(@model.validationError)

  showSuccess: (contents) ->
      @$(".results-panel").removeClass("panel-danger")
      @$(".results-panel").addClass("panel-info")
      @$(".results-panel .panel-body").html(contents)

  showError: (contents) ->
      @$(".results-panel").removeClass("panel-info")
      @$(".results-panel").addClass("panel-danger")
      @$(".results-panel .panel-body").html(contents)
