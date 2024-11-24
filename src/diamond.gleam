import gleam/list
import gleam/pair
import gleam/string

pub fn build(letter: String) -> String {
  let index = letter_to_index(letter)

  let #(middle, second_half) =
    list.fold(
      over: list.range(from: 1, to: index),
      from: #([], #(0, index - 1)),
      with: fn(acc, index) {
        let #(lines, #(inner_spaces, outer_spaces)) = acc

        let line = build_line(index, inner_spaces, outer_spaces)

        case index {
          1 -> #([line, ..lines], #(inner_spaces + 1, outer_spaces - 1))
          _ -> #([line, ..lines], #(inner_spaces + 2, outer_spaces - 1))
        }
      },
    )
    |> pair.first()
    |> list.split(1)

  let first_half = list.reverse(second_half)

  [first_half, middle, second_half]
  |> list.flatten()
  |> string.join("\n")
}

fn build_line(index: Int, inner_spaces: Int, outer_spaces: Int) -> String {
  let letter = letter_from_index(index)

  case index {
    1 -> {
      let outer_fill = string.concat(list.repeat(" ", outer_spaces))

      string.concat([outer_fill, letter, outer_fill])
    }

    _ -> {
      let outer_fill = string.concat(list.repeat(" ", outer_spaces))
      let inner_fill = string.concat(list.repeat(" ", inner_spaces))

      string.concat([outer_fill, letter, inner_fill, letter, outer_fill])
    }
  }
}

fn letter_from_index(index: Int) -> String {
  let assert Ok(codepoint) = string.utf_codepoint(index + 64)

  string.from_utf_codepoints([codepoint])
}

fn letter_to_index(letter: String) -> Int {
  let assert [codepoint] = string.to_utf_codepoints(letter)

  string.utf_codepoint_to_int(codepoint) - 64
}
