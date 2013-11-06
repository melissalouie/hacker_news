#HOMEPAGE
#GET METHODS JUST DISPLAY THINGS
get '/' do
  # Look in app/views/index.erb
  erb :index
end

#POST METHOD JUST CREATE STUFF
#Post method for Signup 
post '/signup' do
  @user = User.create(params[:newuser])
  session[:id] = @user.id
  redirect to "/profile/#{session[:id]}"
end

# Post method for Login, see form
post '/login' do
  p params[:email]
  p params[:password]
  @user = User.find_by_email(params[:email])
   p @user
   if @user.password == params[:password]
      session[:id] = @user.id
      redirect "/profile/#{session[:id]}"
    else
      #Please create an account
      redirect '/'
    end
end

get "/profile/:user_id" do
  # session[:id] = @user.id

  @user = User.find(params[:user_id])
  @posts = @user.authored_posts
  #list of authored_post
  #list of posts where user commented
  #link to /news with all posts
  erb :profile
end

get '/post/:post_id' do
  #display particular post 
  @post = Post.find(params[:post_id])
  @comments = @post.comments
  p @post
  erb :post
end

get "/news" do
  @posts = Post.all

  erb :all_posts

end
# # Get all news headings in a list
# get '/news' do
#   @posts = Post.all
# end

#Create a post

