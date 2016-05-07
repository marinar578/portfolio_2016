require "sinatra/base"
require "pg"
require 'digest/md5'
require "pry"
require "active_support/all"
require "redcarpet"
require "bcrypt"


class Server < Sinatra::Base
  enable :sessions
  set :method_override, true

# -------------------------------------
# db connection & helpers
# -------------------------------------

  def db
    if ENV["RACK_ENV"] == "production"
      @db ||= PG.connect(
        dbname: ENV["POSTGRES_DB"],
        host: ENV["POSTGRES_HOST"],
        password: ENV["POSTGRES_PASS"],
        user: ENV["POSTGRES_USER"]
       )
    else
      @db ||= PG.connect(dbname: "marina_portfolio")
    end
  end

  def current_user
    if session["user_id"]
      "Marina"
    else
      {}
    end
  end

# -------------------------------------

  get "/" do
    @index = true
    erb :index
  end

  get "/projects/:id" do
    @project = db.exec_params("SELECT * FROM projects WHERE id = $1", [params[:id]]).first
    
    renderer = Redcarpet::Render::HTML
    markdown = Redcarpet::Markdown.new(renderer, extensions = {})
    @content = markdown.render(@project["description"])

    erb :project
  end

  get "/projects/:id/edit" do
    @project = db.exec_params("SELECT * FROM projects WHERE id = $1", [params[:id]]).first
    if current_user == "Marina"
      erb :update_project
    else
      redirect "/"
    end
  end

  put "/projects/:id/edit" do
    name = params[:name]
    image = params[:image]
    description = params[:description]

    db.exec_params("UPDATE projects SET name = $1, image = $2, description = $3 WHERE id = $4", [name, image, description, params[:id]])

    redirect "/projects/#{params[:id]}"
  end

  get "/about" do
    erb :about
  end

  get "/resume" do
    erb :resume
  end

  get "/contact" do
    erb :contact
  end

  post "/contact" do
      name = params["name"]
      email = params["email"]
      message = params["message"]

      db.exec_params("INSERT INTO contact_info (name, email, message) VALUES ($1, $2, $3)", [name, email, message])

      @contact_submitted = true

      erb :contact
  end


  get "/admin" do
    erb :admin
  end

  post "/admin" do
    @user = db.exec_params("SELECT * FROM admin WHERE name = 'marinaroze'").first
    # binding.pry
    if BCrypt::Password.new(@user["password_digest"]) == params[:password]
      session["user_id"] = @user["id"]
      redirect "/"
    else
      @error = "Invalid Password"
      erb :admin
    end
  end

  get "/signout" do
    session.clear
    redirect "/"
  end

end
