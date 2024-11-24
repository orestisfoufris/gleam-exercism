import gleam/list
import gleam/set
import gleam/string as s

pub fn is_isogram(phrase phrase: String) -> Bool {
  let cleaned =
    s.lowercase(phrase)
    |> s.to_utf_codepoints
    |> list.filter(fn(c) {
      let char = s.utf_codepoint_to_int(c)
      char >= 97 && char <= 122
    })

  let set_size = set.size(set.from_list(cleaned))
  list.length(cleaned) == set_size
}
