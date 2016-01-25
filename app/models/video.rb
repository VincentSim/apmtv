class Video < ActiveRecord::Base
  include AlgoliaSearch

  algoliasearch do
    attributesToIndex ['title', 'description', 'expert', 'tag', 'category', 'subcategory']

  end

end
