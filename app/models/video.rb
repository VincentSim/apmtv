class Video < ActiveRecord::Base
  include AlgoliaSearch

  CATEGORY = ["Développement du dirigeant", "Environnement de l'entreprise", "Management", "Technique d'entreprise"]
  TAG = ["Parole d'expert", "Extraclub", "Parole d'adhérent", "Maison APM", "Convention"]

  algoliasearch do
    attributesToIndex ['title', 'description', 'expert', 'tag', 'category', 'subcategory']

  end

end
