#coding : utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@m = Member.create(:email => "keialk@wafflestudio.com", :name => "조겨리", :twitter => "keialk", :facebook => "keialk", :password => "whrufl", :password_confirm => "whrufl", :admin => true)
@m1 = Member.create(:email => "prizma@wafflestudio.com", :name => "이재린", :facebook => "prizma", :password => "dlwofls", :password_confirm => "dlwofls", :admin => true)
@m2 = Member.create(:email => "jineok12@wafflestudio.com", :name => "김진억", :twitter => "gin1231", :facebook => "gin1231", :password => "rlawlsdjr", :password_confirm => "rlawlsdjr", :admin => true)
@m3 = Member.create(:email => "kindone@wafflestudio.com", :name => "홍원욱", :twitter => "kindone", :facebook => "kindone", :password => "ghddnjsdnr", :password_confirm => "ghddnjsdnr")
@m.save
@m1.save
@m2.save
@m3.save

@p = Project.create(:title => "gallery", :description => "Display Wafflestudios project, idea, sketches")
@p.designers << @m
@p.designers << @m1
@p.developers << @m
@p.developers << @m2
(1..5).each do |i|
@i = ProjectImage.new()
@i.image = File.open("init_data/"+i.to_s.rjust(3,'0')+".jpg")
@p.project_images << @i
@p.save
end

@p = Sketch.create(:title => "keialks idea sketch", :description => "Display Wafflestudio's project, idea, sketches")
(6..9).each do |i|
@i = SketchImage.new()
@i.image = File.open("init_data/"+i.to_s.rjust(3,'0')+".jpg")
@p.sketch_images << @i
@p.save
end
@p.designers << @m
@p.designers << @m1

@p = Project.create(:title => "infinite wall", :description => "hihihihihihiesdjfaoigjal;iewgfje;lw")
(10..14).each do |i|
@i = ProjectImage.new()
@i.image = File.open("init_data/"+i.to_s.rjust(3,'0')+".jpg")
@p.project_images << @i
@p.save
end

@p.designers << @m
@p.developers << @m
@p.developers << @m2
@p.developers << @m3


@p = Sketch.create(:title => "prizmas idea!!!", :description => "Display Wafflestudio's project, idea, sketches")
(15..20).each do |i|
@i = SketchImage.new()
@i.image = File.open("init_data/"+i.to_s.rjust(3,'0')+".jpg")
@p.sketch_images << @i
@p.save
end
@p.designers << @m1

(0..9).each do |i|
  p = Project.create(:title => "test project"+i.to_s, :description => "hello")
  im = ProjectImage.new
  im.image = File.open("init_data/"+(i+21).to_s.rjust(3,'0')+".jpg")
  p.project_images << im
end

(0..9).each do |i|
  p = Sketch.create(:title => "test sketch"+i.to_s, :description => "hello")
  im = SketchImage.new
  im.image = File.open("init_data/"+(i+31).to_s.rjust(3,'0')+".jpg")
  p.sketch_images << im
end
