require('sinatra')
require('sinatra/reloader')
require('./lib/album')
require('pry')
also_reload('lib/**/*.rb')



get('/test') do
  @something = "this is a variable"
  erb(:whatever)
end

get('/') do
  @albums = Album.all
  erb(:albums)
end

get('/albums') do
  @albums = Album.all
end

get('/albums/new') do
  erb(:new_album)
end

get('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.update(params[:name])
  @albums = Album.all
  erb(:album)
end

get('/albums/:id/edit') do
  @album = Album.find(params[:id].to_i())
  erb(:edit_album)
end

patch('/albums/:id') do
  "This route will update an album. We can't reach it with a URL. In a future lesson, we will use a form that specifies a PATCH action to reach this route."
end

delete('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.delete()
  @albums = Album.all
  erb(:albums)
end

get('/custom_route') do
  "We can even create custom routes, but we should only do this when needed."
end

post('/albums') do
  name = params[:album_name]
  album = Album.new(name, nil)
  album.save()
  @albums = Album.all() # Adding this line will fix the error.
  erb(:albums)
end
