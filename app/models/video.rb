class Video < ActiveRecord::Base
  include AlgoliaSearch

  algoliasearch per_environment: true do
    attributesToIndex ['title', 'description', 'expert', 'tag', 'category', 'subcategory']

  end

end
