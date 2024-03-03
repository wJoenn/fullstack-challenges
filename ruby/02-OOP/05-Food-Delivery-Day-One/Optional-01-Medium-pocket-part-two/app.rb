require_relative "views/view"
require_relative "fetch"
require_relative "router"

require_relative "models/post"
require_relative "repositories/post_repository"
require_relative "views/posts_view"
require_relative "controllers/posts_controller"


require_relative "models/author"
require_relative "repositories/author_repository"
require_relative "views/authors_view"
require_relative "controllers/authors_controller"

author_repo = AuthorRepository.new("data/authors.csv")
authors_con = AuthorsController.new(author_repo)

post_repo = PostRepository.new("data/posts.csv")
posts_con = PostsController.new(post_repo, author_repo)

Router.new(posts_con, authors_con).run
