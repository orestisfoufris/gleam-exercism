import gleam/int
import gleam/list

// If a given number:

// is divisible by 3, add "Pling" to the result.
// is divisible by 5, add "Plang" to the result.
// is divisible by 7, add "Plong" to the result.
// is not divisible by 3, 5, or 7, the result should be the number as a string.
pub fn convert(number: Int) -> String {
  let array = []

  let array = case number {
    i if i % 3 == 0 -> list.append(array, ["Pling"])
    _ -> array
  }
  let array = case number {
    i if i % 5 == 0 -> list.append(array, ["Plang"])
    _ -> array
  }
  let array = case number {
    i if i % 7 == 0 -> list.append(array, ["Plong"])
    _ -> array
  }

  case array {
    [] -> int.to_string(number)
    _ -> {
      let result = list.reduce(array, fn(a, b) { a <> b })
      case result {
        Ok(s) -> s
        _ -> ""
      }
    }
  }
}
