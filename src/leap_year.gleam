// Determine whether a given year is a leap year.

// A leap year (in the Gregorian calendar) occurs:

// In every year that is evenly divisible by 4.
// Unless the year is evenly divisible by 100, in which case it's only a leap year if the year is also evenly divisible by 400.
pub fn is_leap_year(year: Int) -> Bool {
  let divided_by_4 = year % 4 == 0
  let divided_by_100 = year % 100 == 0
  let divided_by_400 = year % 400 == 0

  case divided_by_100 {
    True -> divided_by_4 && divided_by_400
    False -> divided_by_4
  }
}
