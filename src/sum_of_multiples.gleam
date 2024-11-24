import gleam/list
import gleam/set

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  list.map(factors, fn(x) { find_multiples(x, limit, 1) })
  |> list.fold(set.new(), fn(p, s) { set.union(s, p) })
  |> set.fold(0, fn(x, y) { x + y })
}

pub fn find_multiples(base: Int, limit: Int, multiplier: Int) -> set.Set(Int) {
  case base, limit {
    0, _ -> set.new()
    _, 0 -> set.new()
    _, _ -> {
      let value = base * multiplier
      case value {
        i if i >= limit -> set.new()
        _ ->
          set.new()
          |> set.insert(value)
          |> set.union(find_multiples(base, limit, multiplier + 1))
      }
    }
  }
}
