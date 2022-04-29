require 'mini-levenshtein/mini_levenshtein'

module MiniLevenshtein
  extend MiniLevenshteinInternal

  def self.distance(string1, string2)
    internal_distance(string1, string2, 0)
  end

  def self.ratio(string1, string2)
    lensum = string1.length + string2.length
    return 1.0 if lensum.zero?

    distance = internal_distance(string1, string2, 1)
    return 1.0 if distance.zero?

    (lensum - distance) / lensum.to_f
  end
end
