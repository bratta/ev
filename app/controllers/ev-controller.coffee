Controller = require 'controllers/base/controller'
HeaderView = require 'views/header/header-view'
EvView = require 'views/ev/ev-view'
Options = require 'models/options'

module.exports = class EvController extends Controller
  beforeAction: ->
    super
    @reuse 'header', HeaderView, region: 'header'

  index: ->
    @model = new Options()
    @view = new EvView region: 'main', model: @model
