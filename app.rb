require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get('/') do
@words = Word.all()
  erb(:index)
end

get("/words/new") do
  erb(:words_form)
end

post('/words') do
  word = params.fetch('word')
  @word = Word.new(word)
  @word.save()
  erb(:success)
end
get('/words') do
@words = Word.all()  #this is the page you got to when going through the programdfadf
  erb(:words)
end

get("/word/:id") do
  @words = Word.all()
  word_id = params.fetch('id').to_i()
  @word = Word.find(word_id)
  @definitions = @word.definitions()


  erb(:word)

end


get("/word_definition_form/new") do
  @word = Word.all()
  erb(:word_definition_form)
end
post('/definitions') do
  definition = params.fetch('definition')
  Definition.new(definition).save()
  @definitions = Definition.all()
  erb(:definitions)
end



get('/definitions')do
@word = Word.all()
  erb(:definitions)
end

post('/definitions') do
  definition = params.fetch('definition')
  Definition.new(definition).save()
  @definitions = Definition.all()
  erb(:definition_success)
end


get('/definitions/:id') do
  @definition = Definition.find(params.fetch('id').to_i())
  erb(:definitions)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

get('/words/:id/definitions/new') do
    @word = Word.find(params.fetch('id').to_i())
    erb(:word_definition_form)
end


get('/words/new')do
  erb(:words_form)
end

post('/definitions') do
  input = params.fetch('definition')
  @definition = Definition.new(input)
  @definition.save()
  @word = Word.find(params.fetch('word_id').to_i())
  @word.add_definition(@definition)
  erb(:definition_success)
end
