class Define
  @@definitions = []

  define_method(:initialize) do |word|
    @word = word
    @id = @@definitions.length().+(1)
    @definitions = []
  end

  define_method(:word) do
    @word
  end

  define_method(:id) do
    @id
  end

  define_method(:definitions) do
    @definitions
  end

  define_singleton_method(:all) do
   @@definitions
 end

 define_method(:save) do
   @@definitions.push(self)
 end

 define_singleton_method(:clear) do
   @@definitions = []
 end

 define_singleton_method(:find) do |id|
  found_definition = nil
  @@definitions.each() do |definition|
    if definition.id().eql?(id)
      found_definition = definition
    end
  end
  found_definition
end
end
