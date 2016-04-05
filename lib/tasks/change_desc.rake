require 'csv'
require_relative 'video_desc'


task change_desc: :environment do
  csv_options = { col_sep: ',', force_quotes: false, quote_char: '"' }
  filepath = 'videos.csv'
  CSV.open(filepath, 'wb', csv_options) do |csv|
    ACCOUNT.videos.each do |video|
      csv << [video.title]
    end
  end
  # result = []

  # video = ACCOUNT.videos.find{|v| v.title == "SYstème de management des idées"}
  # video.update(title: 'Système de management des idées', category_id:'27')
  # result << video.title
  # p result
end
