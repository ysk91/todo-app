# Categoryを50個作成
categories_array = 50.times.map {|n| {
  title: "#{Faker::Lorem.sentence(word_count: 2)}-#{n+1}"
} }
Category.create!(categories_array)

# 各Categoryに5個ずつToDoをもたせる
statuses = %w(waiting working done)
Category.all.each do |cat|
  contents_array = 5.times.map {|n| {
    content: Faker::Lorem.sentence(word_count: 5),
    status: statuses[rand(3)],
    deadtime: Time.zone.today + n + 1
  }}
  cat.todos.create!(contents_array)
end