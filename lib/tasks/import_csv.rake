require 'csv'
namespace :import_csv do
  desc "CSVデータをインポートするタスク"

  task users: :environment do
    path = "db/csv_data/user_data.csv"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << row.to_h
    end
    puts "インポート処理を開始"
    begin
      User.transaction do
      User.create!(list)
      end
      puts "インポート完了！！"
    rescue StandardError => enum_for
      puts "#{e.class}: #{e.message}"
      puts "------------------------"
      puts e.backtrace
      puts "------------------------"
      puts "インポート失敗"
    end
  end
end
