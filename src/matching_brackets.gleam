import gleam/list
import gleam/string

pub fn is_paired(value: String) -> Bool {
  let graphemes = string.to_graphemes(value)

  let stack =
    list.fold(graphemes, [], fn(acc, char) {
      case char {
        "{" -> push(acc, "{")
        "[" -> push(acc, "[")
        "(" -> push(acc, "(")
        "}" ->
          case pop(acc) {
            Error(Nil) -> push(acc, "*")
            Ok(result) ->
              case result.0 {
                "{" -> result.1
                _ -> push(acc, "*")
              }
          }
        "]" ->
          case pop(acc) {
            Error(Nil) -> push(acc, "*")
            Ok(result) ->
              case result.0 {
                "[" -> result.1
                _ -> push(acc, "*")
              }
          }
        ")" ->
          case pop(acc) {
            Error(Nil) -> push(acc, "*")
            Ok(result) ->
              case result.0 {
                "(" -> result.1
                _ -> push(acc, "*")
              }
          }
        _ -> acc
      }
    })

  list.is_empty(stack)
}

pub fn push(stack: List(a), item: a) -> List(a) {
  [item, ..stack]
}

pub fn pop(stack: List(a)) -> Result(#(a, List(a)), Nil) {
  case stack {
    [] -> Error(Nil)
    [head, ..tail] -> Ok(#(head, tail))
  }
}
