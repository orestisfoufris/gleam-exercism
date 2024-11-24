import gleam/list as l
import gleam/result
import gleam/string as s

pub fn message(log_line: String) -> String {
  s.trim(log_line)
  |> s.split(on: ":")
  |> l.rest
  |> result.map(l.first)
  |> result.flatten
  |> result.unwrap("")
  |> s.trim
}

pub fn log_level(log_line: String) -> String {
  let level =
    s.trim(log_line)
    |> s.split(":")
    |> l.first

  case level {
    Ok(level) ->
      level
      |> s.slice(1, s.length(level) - 2)
      |> s.lowercase
    Error(_) -> ""
  }
}

pub fn reformat(log_line: String) -> String {
  let parts = s.split(log_line, on: ":")

  case l.first(parts), l.last(parts) {
    Ok(level), Ok(message) -> {
      let clean_level =
        s.trim(level)
        |> s.slice(1, s.length(level) - 2)
        |> s.lowercase

      let clean_message = s.trim(message)

      s.concat([clean_message, " (", clean_level, ")"])
    }
    _, _ -> log_line
  }
}
