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

  describe('#id') do
    it('returns the id of the word') do
      test_word = Word.new("dog")
      test_word.save()
      expect(test_word.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('returns the word by its id number') do
      test_word = Word.new("dog")
      test_word.save()
      test_word_two = Word.new("cat")
      test_word_two.save()

      expect(Word.find(test_word.id())).to(eq(test_word))
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
