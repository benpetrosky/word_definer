class Word

  @@words = []

  define_method(:initialize) do |something|
  @something = something


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
end
