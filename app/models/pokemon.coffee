Model = require 'models/base/model'
module.exports = class Pokemon extends Model

  validate: (attributes, options) ->
    if !attributes.species
      return "Pokémon species is required"
    if !_(Pokemon.abilities()).include(attributes.ability)
      return "Invalid Pokémon ability"
    if !_(Pokemon.natures()).include(attributes.nature)
      return "Invalid Pokémon nature"

  to_text: ->
    text = ''
    species = @getSpecies()
    if @get("nickname")
      text += "#{@get("nickname")} (#{species})"
    else
      text += species
    if @get("gender") then text += " (#{@get("gender")})"
    if @get("held_item")
      text += " @ #{@get("held_item")}\n"
    else
      text += "\n"
    if @get("ability") then text += "Ability: #{@get("ability")}\n"
    if @get("level") && @get("level") != 100
      text += "Level: #{@get("level")}\n"
    if @get("shiny") then text += "Shiny: Yes\n"
    if @get("happiness") && @get("happiness") < 255
      text += "Happiness: #{@get("happiness")}\n"
    if @get("evs") then text += "EVs: #{@get("evs")}\n"
    if @get("nature") then text += "#{@get("nature")} Nature\n"
    if @get("ivs") then text += "IVs: #{@get("ivs")}\n"
    if @get("move1") then text += "- #{@get("move1")}\n"
    if @get("move2") then text += "- #{@get("move2")}\n"
    if @get("move3") then text += "- #{@get("move3")}\n"
    if @get("move4") then text += "- #{@get("move4")}\n"
    text.replace(/\n+$/, "")

  getSpecies: ->
    species = @get("species") || '<<No Species Set>>'
    if @get("mega") == true
      if _(["Charizard", "Mewtwo"]).include species
        if @get("held_item").indexOf(" X")
          species += "-Mega-X"
        else if @geT("held_item").indexOf(" Y")
          species += "-Mega-Y"
        else species += "-Mega"
      else
        species += "-Mega"
    species

  @abilities: ->
    [
      "Adaptability", "Aerilate", "Aftermath", "Air Lock", "Analytic", "Anger Point",
      "Anticipation", "Arena Trap", "Aroma Veil", "Aura Break", "Bad Dreams", "Battle Armor",
      "Big Pecks", "Blaze", "Bulletproof", "Cheek Pouch", "Chlorophyll", "Clear Body",
      "Cloud Nine", "Color Change", "Competitive", "Compound Eyes", "Contrary", "Cursed Body",
      "Cute Charm", "Damp", "Dark Aura", "Defeatist", "Defiant", "Download", "Drizzle", "Drought",
      "Dry Skin", "Early Bird", "Effect Spore", "Fairy Aura", "Filter", "Flame Body", "Flare Boost",
      "Flash Fire", "Flower Gift", "Flower Veil", "Forecast", "Forewarn", "Friend Guard", "Frisk",
      "Fur Coat", "Gale Wings", "Gluttony", "Gooey", "Grass Pelt", "Guts", "Harvest", "Healer", "Heatproof",
      "Heavy Metal", "Honey Gather", "Huge Power", "Hustle", "Hydration", "Hyper Cutter", "Ice Body",
      "Illuminate", "Illusion", "Immunity", "Imposter", "Infiltrator", "Inner Focus", "Insomnia", "Intimidate",
      "Iron Barbs", "Iron Fist", "Justified", "Keen Eye", "Klutz", "Leaf Guard", "Levitate", "Light Metal",
      "Lightning Rod", "Limber", "Liquid Ooze", "Magic Bounce", "Magic Guard", "Magician", "Magma Armor",
      "Magnet Pull", "Marvel Scale", "Mega Launcher", "Minus", "Mold Breaker", "Moody", "Motor Drive", "Moxie",
      "Multiscale", "Multitype", "Mummy", "Natural Cure", "No Guard", "Normalize", "Oblivious", "Overcoat",
      "Overgrow", "Own Tempo", "Parental Bond", "Pickpocket", "Pickup", "Pixilate", "Plus", "Poison Heal",
      "Poison Point", "Poison Touch", "Prankster", "Pressure", "Protean", "Pure Power", "Quick Feet", "Rain Dish",
      "Rattled", "Reckless", "Refrigerate", "Regenerator", "Rivalry", "Rock Head", "Rough Skin", "Run Away",
      "Sand Force", "Sand Rush", "Sand Stream", "Sand Veil", "Sap Sipper", "Scrappy", "Serene Grace",
      "Shadow Tag", "Shed Skin", "Sheer Force", "Shell Armor", "Shield Dust", "Simple", "Skill Link", "Slow Start",
      "Sniper", "Snow Cloak", "Snow Warning", "Solar Power", "Solid Rock", "Soundproof", "Speed Boost", "Stall",
      "Stance Change", "Static", "Steadfast", "Stench", "Sticky Hold", "Storm Drain", "Strong Jaw", "Sturdy",
      "Suction Cups", "Super Luck", "Swarm", "Sweet Veil", "Swift Swim", "Symbiosis", "Synchronize",
      "Tangled Feet", "Technician", "Telepathy", "Teravolt", "Thick Fat", "Tinted Lens", "Torrent",
      "Tough Claws", "Toxic Boost", "Trace", "Truant", "Turboblaze", "Unaware", "Unburden", "Unnerve",
      "Victory Star", "Vital Spirit", "Volt Absorb", "Water Absorb", "Water Veil", "Weak Armor", "White Smoke",
      "Wonder Guard", "Wonder Skin", "Zen Mode"
    ]

  @natures: ->
    [
      "Adamant", "Bashful", "Bold", "Brave", "Calm", "Careful", "Docile",
      "Gentle", "Hardy", "Hasty", "Impish", "Jolly", "Lax", "Lonely",
      "Mild", "Modest", "Naive", "Naughty", "Quiet", "Quirky", "Rash",
      "Relaxed", "Sassy", "Serious", "Timid"
    ]
