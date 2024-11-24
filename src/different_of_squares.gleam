import gleam/list

// Find the difference between the square of the sum 
// and the sum of the squares of the first N natural numbers.
pub fn square_of_sum(n: Int) -> Int {
  let square_sum = list.range(1, n) |> list.reduce(fn(acc, x) { acc + x })
  case square_sum {
    Ok(result) -> result * result
    Error(_) -> 0
  }
}

pub fn sum_of_squares(n: Int) -> Int {
  let sum_of_squares =
    list.range(1, n)
    |> list.map(fn(x) { x * x })
    |> list.reduce(fn(acc, x) { acc + x })

  case sum_of_squares {
    Ok(result) -> result
    Error(_) -> 0
  }
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
