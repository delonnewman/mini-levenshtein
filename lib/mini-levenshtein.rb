require 'mini-levenshtein/mini_levenshtein'

module MiniLevenshtein
  class << self
    alias distance edit_distance
    alias ratio similarity
  end
end
