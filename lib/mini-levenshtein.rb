require 'mini-levenshtein/mini_levenshtein'

module MiniLevenshtein
  extend MiniLevenshteinInternal

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
    def edit_distance(string1, string2)
      validate_string!(string1)
      validate_string!(string2)
      
      internal_distance(string1, string2, 0)
    end
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
    def similarity(string1, string2)
      validate_string!(string1)
      validate_string!(string2)

      lensum = string1.length + string2.length
      return 1.0 if lensum.zero?
  
      distance = internal_distance(string1, string2, 1)
      return 1.0 if distance.zero?
  
      (lensum - distance) / lensum.to_f
    end
    alias ratio similarity

    private

    def validate_string!(string)
      raise TypeError, "no implicit conversion of #{string.class} to String" unless string.is_a?(String)
    end
  end
end
