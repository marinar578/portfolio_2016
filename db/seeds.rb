require 'pg'

if ENV["RACK_ENV"] == "production"
    conn = PG.connect(
        dbname: ENV["POSTGRES_DB"],
        host: ENV["POSTGRES_HOST"],
        password: ENV["POSTGRES_PASS"],
        user: ENV["POSTGRES_USER"]
     )
else
    conn = PG.connect(dbname: "marina_portfolio")
end

conn.exec("DROP TABLE IF EXISTS projects")

conn.exec("CREATE TABLE projects(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    image VARCHAR(255),
    description VARCHAR(255)
  )"
)

# Blackjack
conn.exec("INSERT INTO projects (name, image, description) VALUES (
    'Blackjack',
    '/images/ga_blackjack_screenshot.png',
    'BlackJack game built with HTML5, CSS, and JavaScript.'
  )"
)

# wecreate
conn.exec("INSERT INTO projects (name, image, description) VALUES (
    'wecreate',
    '/images/ga_wecreate_screenshot.png',
    'Wiki-type application where users can view, add, and edit creative works. Built with HTML, CSS, JavaScript, Sinatra, and PostgreSQL.'
  )"
)

# Era
conn.exec("INSERT INTO projects (name, image, description) VALUES (
    'Era',
    '/images/ga_era_screenshot.png',
    'Book recommendations app built with HTML5, CSS, Material Design, JavaScript, and Rails. It calls the Google Books and Google Places APIs.'
  )"
)

# Innovation Cloud
conn.exec("INSERT INTO projects (name, image, description) VALUES (
    'Innovation Cloud',
    'https://36.media.tumblr.com/9dab05c01743a5d960f5c857a96f5bc3/tumblr_nqghz9YmMx1tqrkono1_1280.png',
    ''
  )"
)

# Newstand
conn.exec("INSERT INTO projects (name, image, description) VALUES (
    'Newstand',
    'https://41.media.tumblr.com/82345b653b7133db0122813c95a8efed/tumblr_nqghyv5TGk1tqrkono1_1280.png',
    ''
  )"
)

# threadly
conn.exec("INSERT INTO projects (name, image, description) VALUES (
    'threadly',
    'https://40.media.tumblr.com/97661035a17a6de379e4541e20f3f024/tumblr_nqmar3ZseP1tqrkono1_1280.png',
    ''
  )"
)
