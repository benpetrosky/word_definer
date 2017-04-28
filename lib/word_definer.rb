class Word

  @@words = []

  define_method(:initialize) do |something|
  @something = something
  @id = @@words.length().+(1)

  end
  define_method(:something) do
    @something
  end
  define_method(:save) do
    @@words.push(self)
  end
  define_singleton_method(:all) do
    @@words
  end
  define_singleton_method(:clear) do
    @@words = []
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |identification|
    found_word = nil
    @@words.each() do |word|
      if word.id().eql?(identification.to_i())
        found_word = word
      end
    end
    found_word

  end
end
