require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word_definer')
require('./lib/define')

get('/') do
  @words = Word.all()
  erb(:index)
end
get("/words") do
  @words = Word.all()
  erb(:definitions)
end

get('/words/new')do
  erb(:words_form)
end

post('/words') do
  input = params.fetch('word')
  input_definition = params.fetch('define')
  word = Word.new(input, input_definition)
  word.save()
  erb(:success)
end

get('/words/:id') do
  @word = Word.find(params.fetch("id"))
  erb(:words)
end
