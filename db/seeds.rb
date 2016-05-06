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
    description VARCHAR(255),
    link VARCHAR,
    github_link VARCHAR
  )"
)

# Blackjack
conn.exec("INSERT INTO projects (name, image, description, link, github_link) VALUES (
    'Blackjack',
    '/images/ga_blackjack_screenshot.png',
    'BlackJack game built with HTML5, CSS, and JavaScript.',
    'https://marinar578.github.io/',
    'https://github.com/marinar578/marinar578.github.io'
  )"
)

# wecreate
conn.exec("INSERT INTO projects (name, image, description, link, github_link) VALUES (
    'wecreate',
    '/images/ga_wecreate_screenshot.png',
    'Wiki-type application where users can view, add, and edit creative works. Built with HTML, CSS, JavaScript, Sinatra, and PostgreSQL.',
    'https://ga-project2.herokuapp.com/',
    'https://github.com/marinar578/ga-project2'
  )"
)

# Era
conn.exec("INSERT INTO projects (name, image, description, link, github_link) VALUES (
    'Era',
    '/images/ga_era_screenshot.png',
    'Book recommendations app built with HTML5, CSS, Material Design, JavaScript, and Rails. It calls the Google Books and Google Places APIs.',
    'https://yournewbooks.herokuapp.com/',
    'https://github.com/marinar578/your_book'  
  )"
)

# Innovation Cloud
conn.exec("INSERT INTO projects (name, image, description, link, github_link) VALUES (
    'Innovation Cloud',
    '/images/ca_innovation_screenshot.png',
    '',
    'https://young-tor-6274.herokuapp.com/',
    'https://github.com/marinar578/innovation-cloud'  
  )"
)

# Newstand
conn.exec("INSERT INTO projects (name, image, description, link, github_link) VALUES (
    'Newstand',
    '/images/ca_newstand_screenshot.png',
    '',
    'https://pure-tundra-5035.herokuapp.com/',
    'https://github.com/marinar578/newstand1'  
  )"
)

# threadly
conn.exec("INSERT INTO projects (name, image, description, link, github_link) VALUES (
    'threadly',
    '/images/ca_threadly_screenshot.png',
    '',
    'https://secret-peak-8161.herokuapp.com/',
    'https://github.com/marinar578/threadly'  
  )"
)
