Model = require 'models/base/model'
module.exports = class Options extends Model
  defaults: {
    target_evs: 252,
    ev_per_pokemon: 1,
    pokerus: true,
    power_items: true,
    macho_brace: false
  }

  validate: (attributes, options) ->
    if !_(attributes.target_evs).isNumber() || _(attributes.target_evs).isNaN()
      return "Target effort value must be a number"
    if attributes.target_evs < 1 || attributes.target_evs > 252
      return "Target effort value target must be between 1 and 252"
    if !_(attributes.ev_per_pokemon).isNumber() || _(attributes.ev_per_pokemon).isNaN()
      return "Effort value per Pokémon must be a number"
    if attributes.ev_per_pokemon < 1 || attributes.ev_per_pokemon > 5
      return "Effort value per Pokémon must be between 1 and 5"
    if !_(attributes.pokerus).isBoolean()
      return "Pokérus must be true or false"
    if !_(attributes.power_items).isBoolean()
      return "Power Items must be true or false"
    if !_(attributes.macho_brace).isBoolean()
      return "Macho Brace must be true or false"
    if (attributes.power_items && attributes.macho_brace)
      return "Your Pokémon cannot wear both a Power Item and the Macho Brace"
