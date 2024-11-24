import gleam/list as l
import gleam/string as s

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  let word_sorted = l.sort(s.split(s.lowercase(word), ""), s.compare)

  candidates
  |> l.filter(fn(candidate) {
    let candidate_set = l.sort(s.split(s.lowercase(candidate), ""), s.compare)
    candidate_set == word_sorted && s.lowercase(candidate) != s.lowercase(word)
  })
}
