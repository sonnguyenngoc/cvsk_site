# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Tag.delete_all
#....
Tag.create!(
  title: 'Tin tức',
  description: 'Tạo các bài viết có nội dung là tin tức'.
)
Tag.create!(
  title: 'Sự kiện',
  description: 'Tạo các bài viết có nội dung là sự kiện'.
)
Tag.create!(
  title: 'Dịch vụ',
  description: 'Tạo các bài viết có nội dung là dịch vụ'.
)
Tag.create!(
  title: 'Lời giới thiệu',
  description: 'Tạo các bài viết có nội dung là lời giới thiệu ngằn gọn về triết lý kinh doanh của nhà hàng'.
)
Tag.create!(
  title: 'Giờ mở cửa',
  description: 'Cập nhật thông tin thời gian hoạt động của nhà hàng'.
)
#....

Manufacturer.delete_all
#....
Manufacturer.create!(
  name: 'Chay vì sức khỏe'
)
#....