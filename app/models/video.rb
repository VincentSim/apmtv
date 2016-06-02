class Video < ActiveRecord::Base
  belongs_to :mooc
  include AlgoliaSearch

  CATEGORY = ["Développement du dirigeant", "Environnement de l'entreprise", "Management", "Technique d'entreprise", "Tutos", "Autres"]
  TAG = ["Parole d'expert", "Extraclub", "Parole d'adhérent", "Maison APM", "Convention"]
  POSITION = [1, 2, 3, 4, 5, 6, 7, 8, 8, 9, 10]

  algoliasearch per_environment: true do
    attributesToIndex ['title', 'description', 'expert', 'tag', 'category', 'subcategory']

  end

end
