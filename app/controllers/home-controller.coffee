Controller = require 'controllers/base/controller'
HeaderView = require 'views/home/header-view'
HomePageView = require 'views/home/home-page-view'
Options = require 'models/options'

module.exports = class HomeController extends Controller
  beforeAction: ->
    super
    @reuse 'header', HeaderView, region: 'header'

  index: ->
    @model = new Options()
    @view = new HomePageView region: 'main', model: @model
