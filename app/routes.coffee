# Application routes.
module.exports = (match) ->
  match '', 'home#index'
  match 'ev', 'ev#index'
