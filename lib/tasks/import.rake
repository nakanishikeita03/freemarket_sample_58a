require 'csv'

# rake import:カテゴリー系
namespace :import do
  desc "Import main_categories from csv"

  task main_categories: :environment do
    path = File.join Rails.root, "db/csv/main_data.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          name: row["name"]
      }
    end
    puts "start to create main_categories data"
    begin
      MainCategory.create!(list)
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end



  task sub_categories: :environment do
    path = File.join Rails.root, "db/csv/sub_data.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          name: row["name"],
          main_category_id: row["main_category_id"]
      }
    end
    puts "start to create sub_categories data"
    begin
      SubCategory.create!(list)
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end



  task sub2_categories: :environment do
    path = File.join Rails.root, "db/csv/sub2_data.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          name: row["name"],
          sub_category_id: row["sub_category_id"]
      }
    end
    puts "start to create sub2_categories data"
    begin
      Sub2Category.create!(list)
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end

end