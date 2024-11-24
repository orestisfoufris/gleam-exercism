import gleam/int
import gleam/option.{type Option, None, Some}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  player.name
  |> option.unwrap("Mighty Magician")
}

pub fn revive(player: Player) -> Option(Player) {
  case player {
    Player(_, level, 0, _) if level >= 10 ->
      Some(Player(..player, health: 100, mana: Some(100)))
    Player(_, _, 0, _) -> Some(Player(..player, health: 100))
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    Some(mana) if mana >= cost -> {
      let new_mana = mana - cost
      let damage = cost * 2
      #(Player(..player, mana: Some(new_mana)), damage)
    }
    Some(_) -> #(player, 0)
    None -> {
      let new_health = int.max(player.health - cost, 0)
      #(Player(..player, health: new_health), 0)
    }
  }
}
