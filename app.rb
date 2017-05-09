require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get('/') do
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
  @words = Word.all()
  erb(:words)
end

get("/words/:id") do
  word_id = params.fetch('id').to_i()
  @word = Word.find(word_id)
  erb(:word)
end

post('/definitions/') do
  definition = params.fetch('definition')
  @definition = Definition.new(definition)
  @definition.save()
  @word = Word.find(params.fetch('word_id').to_i())
  @word.add_definition(@definition)
  erb(:word)
end
