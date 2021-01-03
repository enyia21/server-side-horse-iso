namespace :slurp do
    desc "TODO"
    task breeds: :environment do
      require 'csv'
  
      csv_text = File.read(Rails.root.join('lib','csvs', 'horse_breed_data.csv'))
      csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
      csv.each do |row|
        b = Breed.new
        b.common_name = row["Most common name"]
        b.country = row["Country"]
        b.uses = row["Uses"]
        b.color_comments = row["Color comments"]
        b.adaptablity = row["Adaptability to specific environment"]
        b.save
      end
    end
  end

  