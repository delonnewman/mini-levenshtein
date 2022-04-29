require 'mini-levenshtein/mini_levenshtein'

module MiniLevenshtein
  extend MiniLevenshteinInternal

  class << self
    def distance(string1, string2)
      validate_string!(string1)
      validate_string!(string2)
      
      internal_distance(string1, string2, 0)
    end
  
    def ratio(string1, string2)
      validate_string!(string1)
      validate_string!(string2)

      lensum = string1.length + string2.length
      return 1.0 if lensum.zero?
  
      distance = internal_distance(string1, string2, 1)
      return 1.0 if distance.zero?
  
      (lensum - distance) / lensum.to_f
    end

    private

    def validate_string!(string)
      raise TypeError, "no implicit conversion of #{string.class} to String" unless string.is_a?(String)
    end
  end
end
