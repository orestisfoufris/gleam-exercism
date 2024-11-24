import gleam/string

pub fn hey(remark: String) -> String {
  let trimmed = string.trim(remark)
  let last_char = string.last(trimmed)
  let is_capitals =
    string.uppercase(trimmed) == trimmed && string.lowercase(trimmed) != trimmed
  let is_empty = trimmed == ""

  let is_question_mark = case last_char {
    Ok(c) -> c == "?"
    _ -> False
  }
  case is_question_mark, is_capitals, is_empty {
    True, False, _ -> "Sure."
    True, True, _ -> "Calm down, I know what I'm doing!"
    False, True, _ -> "Whoa, chill out!"
    _, _, True -> "Fine. Be that way!"
    _, _, _ -> "Whatever."
  }
}
