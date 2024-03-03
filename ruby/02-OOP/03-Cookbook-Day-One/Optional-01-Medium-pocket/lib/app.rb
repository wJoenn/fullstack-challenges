require_relative "router"
require_relative "controller"
require_relative "repository"
require_relative "post"
require_relative "view"


repository = Repository.new("lib/posts.csv")
controller = Controller.new(repository)
Router.new(controller).run
