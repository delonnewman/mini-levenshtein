RSpec.describe MiniLevenshtein do
  describe '.edit_distance' do
    context 'when either argument is not a string' do
      it 'will raise a type error' do
        pairs_of_string_and_non_string.each do |(a, b)|
          expect { described_class.edit_distance(a, b) }.to raise_error(TypeError)
        end
      end
    end

    context 'when both arguments are strings' do
      it 'will return an edit distance' do
        examples = 50.times.map { 2.times.map { Faker::String.random } }

        examples.each do |(a, b)|
          expect(described_class.edit_distance(a, b)).to be_a(Numeric)
        end
      end
    end

    context 'when both arguments are strings with the same content' do
      it 'will return 0' do
        examples = 50.times.map { s = Faker::String.random; [s, s.dup] }

        examples.each do |(a, b)|
          expect(described_class.edit_distance(a, b)).to be_zero
        end
      end
    end
  end

  describe '.similarity' do
    context 'when either argument is not a string' do
      it 'will raise a type error' do
        pairs_of_string_and_non_string.each do |(a, b)|
          expect { described_class.similarity(a, b) }.to raise_error(TypeError)
        end
      end
    end

    context 'when both arguments are empty strings' do
      it 'will return 1.0' do
        expect(described_class.similarity('', '')).to be 1.0
      end
    end

    context 'when both arguments are strings with the same content' do
      it 'will return 1.0' do
        examples = 50.times.map { s = Faker::String.random; [s, s.dup] }

        examples.each do |(a, b)|
          expect(described_class.similarity(a, b)).to be 1.0
        end
      end
    end

    context 'when both arguments are strings' do
      it 'will return a Float ratio' do
        examples = 50.times.map { 2.times.map { Faker::String.random } }

        examples.each do |(a, b)|
          expect(described_class.similarity(a, b)).to be_a(Float)
        end
      end
    end

    context 'when the two stings share no characters' do
      it 'will return 0.0' do
        expect(described_class.similarity('mash', 'pot'))
      end
    end
  end

  def pairs_of_string_and_non_string
    [nil, 1, true, false, [], {}, :testing].each_with_index.map do |x, i|
      [].tap do |a|
        a[i % 2] = x
        a[(i % 2) ^ 1] = ''
      end
    end
  end
end
