require './string_methods'

RSpec.describe StringMethods do
  let (:dictionary) { ['below','down','go','going','horn','how','howdy','it','i','low','own','part','partner','sit'] }

  describe '#substrings' do
    it 'returns a hash of substrings when given a word and dictionary' do
      expect(subject.substrings('below', dictionary)).to eq({ 'below' => 1, 'low' => 1 })
    end

    it 'returns a hash of substrings when given a sentence and dictionary' do
      expect(subject.substrings("Howdy partner, sit down! How's it going?", dictionary)).to eq({ "down" => 1, "how" => 2, "howdy" => 1,"go" => 1, "going" => 1, "it" => 2, "i" => 3, "own" => 1,"part" => 1,"partner" => 1,"sit" => 1 })
    end

    it 'returns a hash of substrings when given another sentence and dictionary' do
      expect(subject.substrings("Yo! What is up? I just going down to downtown so I can get the low down", dictionary)).to eq({ "down" => 3, "low" => 1, "i" => 4, "go" => 1, "going" => 1, "own" => 4 })
    end
  end
end