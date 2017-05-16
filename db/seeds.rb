# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "admin@gmail.com", password: "111111", isadmin: 2, accept: true)
User.create(email: "ehdrjsdlzzzz@gmail.com", password: "qpxk0606", isadmin: 1, auclub_id:1)

Auclub.create(name: "멋쟁이 사자처럼", introduce: "코딩 노예 양성", description: "코딩의 노예를 생성하자!" ,apply_time: "1200", meeting_time: "1300", facebook: "http://fb.me/likelion.net", tel: "02111", logo: "http://placehold.it/200x200", category: 1)

i = 0
5.times do
    Auclub.create(name: i.to_s, description: i.to_s, apply_time: 0, tel: i.to_s,category: 0)
    i += 1
end