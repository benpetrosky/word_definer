require('rspec')
require('word')
require('definition')

describe(Word) do
  before()do
    Word.clear()
  end

  describe('#word') do
    it('returns a word') do
      test_word = Word.new("dog")
      expect(test_word.word()).to(eq("dog"))
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
  describe('#definitions') do
    it("initially returns an empty array for the definitions for the word") do
      test_word = Word.new("animal")
      expect(test_word.definitions()).to(eq([]))
    end
  end
  describe('#add_definition') do
  it("adds a new definition to a word") do
    test_word = Word.new("Dog")
    test_definition = Definition.new("enemy of all things feline.")
    test_word.add_definition(test_definition)
    expect(test_word.definitions()).to(eq([test_definition]))
  end
end
end
