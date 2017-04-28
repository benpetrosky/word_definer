require('rspec')
require('define')

describe(Define) do
  before() do
    Define.clear()
end
describe('#word') do
  it("returns the name of the word") do
    test_definition = Define.new("pug")
    expect(test_definition.word()).to(eq("pug"))
  end
end

describe('#id') do
  it("returns the id of the word") do
    test_definition = Define.new("elephant")
    expect(test_definition.id()).to(eq(1))
  end
end

describe('#definitions') do
  it("initially returns an empty array of cars for the definitions") do
    test_definition = Define.new("animal")
    expect(test_definition.definitions()).to(eq([]))
  end
end

describe("#save") do
  it("adds a dealership to the array of saved definitions") do
    test_definition = Define.new("pig")
    test_definition.save()
    expect(Define.all()).to(eq([test_definition]))
  end
end

describe(".all") do
  it("is empty at first") do
    expect(Define.all()).to(eq([]))
  end
end

describe(".clear") do
  it("empties out all of the saved definitions") do
    Define.new("corks").save()
    Define.clear()
    expect(Define.all()).to(eq([]))
  end
end

describe(".find") do
  it("returns a definition by its id number") do
    test_definition = Define.new("children")
    test_definition.save()
    test_definition2 = Define.new("adults")
    test_definition2.save()
    expect(Define.find(test_definition.id())).to(eq(test_definition))
  end
end
end
