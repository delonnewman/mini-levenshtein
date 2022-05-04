require 'mini-levenshtein/mini_levenshtein'

module MiniLevenshtein
  class << self
    # Compute absolute Levenshtein distance of two strings.
    #
    # @example (it's hard to spell Levenshtein correctly):
    #   distance('Levenshtein', 'Lenvinsten')  # => 4
    #   distance('Levenshtein', 'Levensthein') # => 2
    #   distance('Levenshtein', 'Levenshten')  # => 1
    #   distance('Levenshtein', 'Levenshtein') # => 0
    #   "Yeah, we've managed it at last."
    #
    # @param string1 [String]
    # @param string2 [String]
    #
    # @return [Integer]
    alias distance edit_distance

    # Compute similarity of two strings.
    #
    # The similarity is a number between 0 and 1.
    #
    # @example
    #   similarity('Hello World!', 'Holly grail!') # => 0.5833...
    #
    # @example
    #   similarity('Holmes', 'Jack') # => 0.0
    #
    # @param string1 [String]
    # @param string2 [String]
    #
    # @return [Float]
    alias ratio similarity
  end
end
