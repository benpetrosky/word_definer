require('sinatra')
require('sinatra/reloader')
require('./lib/word_definer')

get('/') do
  @words = Word.all()
  erb(:index)
end

post('/words') do
  input = params.fetch('word')
  word = Word.new(input)
  word.save()
  erb(:success)
end
