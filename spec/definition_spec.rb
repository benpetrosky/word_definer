require('rspec')
require('definition')

describe(Definition) do
  before() do
    Definition.clear()
end

describe('#id') do
  it("returns the id of the word") do
    test_definition = Definition.new("elephant")
    expect(test_definition.id()).to(eq(1))
  end
end



describe("#save") do
  it("adds a dealership to the array of saved definitions") do
    test_definition = Definition.new("pig")
    test_definition.save()
    expect(Definition.all()).to(eq([test_definition]))
  end
end

describe(".all") do
  it("is empty at first") do
    expect(Definition.all()).to(eq([]))
  end
end

describe(".clear") do
  it("empties out all of the saved definitions") do
    Definition.new("corks").save()
    Definition.clear()
    expect(Definition.all()).to(eq([]))
  end
end

describe(".find") do
  it("returns a definition by its id number") do
    test_definition = Definition.new("children")
    test_definition.save()
    test_definition2 = Definition.new("adults")
    test_definition2.save()
    expect(Definition.find(test_definition.id())).to(eq(test_definition))
  end
end
end
