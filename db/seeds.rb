# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Tag.delete_all
#....
Tag.create(
  title: 'Tin tức',
  description: 'Tạo các bài viết có nội dung là tin tức (Trang tin tức).'
)
Tag.create(
  title: 'Sự kiện',
  description: 'Tạo các bài viết có nội dung là sự kiện (Trang tin tức).'
)
Tag.create(
  title: 'Dịch vụ',
  description: 'Tạo các bài viết có nội dung là dịch vụ (Trang dịch vụ).'
)
Tag.create(
  title: 'Lời giới thiệu',
  description: 'Tạo các bài viết có nội dung là lời giới thiệu (Lời giới thiệu ở cuối trang).'
)
Tag.create(
  title: 'Giờ mở cửa',
  description: 'Cập nhật thông tin thời gian hoạt động của nhà hàng.'
)
Tag.create(
  title: 'Hình ảnh',
  description: 'Tạo các bài viết có nội dung là hình ảnh (Trang hình ảnh).'
)
#....

Manufacturer.delete_all
#....
Manufacturer.create(
  name: 'Chay vì sức khỏe',
  email: 'info@chayvisuckhoe.com',
  address: 'TP.HCM',
  phone: '0918 214 859'
)
Manufacturer.create(
  name: 'Thiện Nhân',
  email: 'info@thiennhan.com',
  address: 'Q.Gò Vấp, TP.HCM',
  phone: '0123 456 789'
)
#....

Category.delete_all
#....
Category.create(
  title: 'Thực đơn chính',
  description: '',
  level: '1'
)
Category.create(
  title: 'Thức uống',
  description: '',
  level: '1'
)
#....

User.delete_all
#....
User.create(:email => "admin@chayvisuckhoe.com", :password => "aA456321@", :password_confirmation => "aA456321@", :user_name => "Administrator", :role_id => 1)
User.create(:email => "chef@chayvisuckhoe.com", :password => "aA456321@", :password_confirmation => "aA456321@", :user_name => "Chef", :role_id => 2)
#....

['admin', 'chef'].each do |role|
  Role.find_or_create_by({name: role})
end