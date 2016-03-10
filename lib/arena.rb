# require 'pry'
require_relative 'gladiator'

class Arena
  attr_accessor :name, :gladiators, :fight_weapons
  def initialize name, gladiators = [], fight_weapons = []
    @name = name.capitalize
    @gladiators = gladiators
    @fight_weapons = fight_weapons
  end
  def add_gladiator(gladiator)
    if @gladiators.length < 2
      @gladiators << gladiator
      @fight_weapons << gladiator.weapon
    end
  end
  def fight
    if @gladiators.length < 2
    else getWinner
    end
  end
  def getWinner
    if fight_weapons.sort! == ["Spear","Trident"]
      gladiators.delete_if {|gladiator| gladiator.weapon == "Spear"}
      "#{gladiators[0].name} wins"
    elsif fight_weapons.sort! == ["Club","Spear"]
      gladiators.delete_if {|gladiator| gladiator.weapon == "Club"}
      "#{gladiators[0].name} wins"
    elsif fight_weapons.sort! == ["Club","Trident"]
      gladiators.delete_if {|gladiator| gladiator.weapon == "Trident"}
      "#{gladiators[0].name} wins"
    else gladiators.clear
      "Same weapon. Both die."
    end
  end
end

#testing purposes:
arena = Arena.new("Metropolis")
max = Gladiator.new("Max","Trident")
ren = Gladiator.new("Ren","Spear")
arena.add_gladiator(max)
arena.add_gladiator(ren)

# binding.pry
