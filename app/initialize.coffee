Application = require 'application'
routes = require 'routes'

# Initialize the application on DOM ready event.
$ ->
  development = window.location.hostname == 'localhost'
  #root = if development then '/' else '/pokemon/'
  root = '/'
  new Application {
    title: 'Pokémon ORAS EV Training Calculator',
    controllerSuffix: '-controller',
    root: root,
    routes
  }
