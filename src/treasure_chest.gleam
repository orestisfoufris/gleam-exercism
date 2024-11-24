// Please define the TreasureChest generic custom type
pub type TreasureChest(a) {
  TreasureChest(password: String, treasure: a)
}

// Please define the UnlockResult generic custom type
pub type UnlockResult(a) {
  Unlocked(a)
  WrongPassword
}

pub fn get_treasure(
  chest: TreasureChest(treasure),
  password: String,
) -> UnlockResult(treasure) {
  case chest {
    TreasureChest(p, t) -> {
      case p == password {
        True -> Unlocked(t)
        _ -> WrongPassword
      }
    }
  }
}
