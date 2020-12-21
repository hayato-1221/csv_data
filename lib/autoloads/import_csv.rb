class ImportCsv
  def self.import(path)
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << row.to_h
    end
    list
  end

  def self.user_data
    list = import('db/csv_data/user_data.csv')
    puts "インポート開始"
    User.create!(list)
    puts "インポート完了"
  end
end
