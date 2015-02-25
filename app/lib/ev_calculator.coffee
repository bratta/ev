module.exports = class EvCalculator
  constructor: (model)->
    @hordes = 0
    @individuals = 0
    @itemless = 0
    @remaining_evs = 0
    @model = model

  calculate: ->
    max_evs = @model.get("ev_per_pokemon")
    max_evs = max_evs + 4 if @model.get("power_items")
    max_evs = max_evs * 2 if @model.get("macho_brace")
    max_evs = max_evs * 2 if @model.get("pokerus")
    max_horde_evs = max_evs * 5

    max_itemless_evs = @model.get("ev_per_pokemon")
    max_itemless_evs = max_itemless_evs * 2 if @model.get("pokerus")

    @remaining_evs = @model.get("target_evs")
    if max_horde_evs <= @remaining_evs
      @hordes = Math.floor(@remaining_evs / max_horde_evs)
      @remaining_evs = @remaining_evs % max_horde_evs

    if max_evs <= @remaining_evs
      @individuals = Math.floor(@remaining_evs / max_evs)
      @remaining_evs = @remaining_evs % max_evs

    if max_itemless_evs <= @remaining_evs
      @itemless = Math.floor(@remaining_evs / max_itemless_evs)
      @remaining_evs = @remaining_evs % max_itemless_evs

    @
