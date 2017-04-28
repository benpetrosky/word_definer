require('rspec')
require('word_definer')

describe(Word) do
  before()do
    Word.clear()
  end

  describe('#something') do
    it('returns a word') do
      test_word = Word.new("dog")
      expect(test_word.something()).to(eq("dog"))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Word.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('returns list of words') do
      test_word = Word.new("dog")
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe('.clear') do
    it('empties out all saved words') do
      test_word = Word.new("dog")
      test_word.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end
end
