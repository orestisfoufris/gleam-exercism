import gleam/set as s

pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  [a, b, c]
  |> s.from_list()
  |> s.size()
  == 1
  && is_triangle(a, b, c)
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && { a == b || a == c || c == b }
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c)
  && [a, b, c]
  |> s.from_list()
  |> s.size()
  == 3
}

fn is_triangle(a: Float, b: Float, c: Float) -> Bool {
  a >. 0.0
  && b >. 0.0
  && c >. 0.0
  && a +. b >=. c
  && b +. c >=. a
  && a +. c >=. b
}
