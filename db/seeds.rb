# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@p = Project.create(:title => "gallery", :description => "Display Wafflestudio's project, idea, sketches")
(1..5).each do |i|
@i = ProjectImage.new()
@i.image = File.open("init_data/00"+i.to_s+".jpg")
@p.project_images << @i
@p.save
@i.save
end

@p = Sketch.create(:title => "keialks idea sketch", :description => "Display Wafflestudio's project, idea, sketches")
(6..9).each do |i|
@i = SketchImage.new()
@i.image = File.open("init_data/00"+i.to_s+".jpg")
@p.sketch_images << @i
@p.save
@i.save
end


@p = Project.create(:title => "infinite wall", :description => "hihihihihihiesdjfaoigjal;iewgfje;lw")
(10..14).each do |i|
@i = ProjectImage.new()
@i.image = File.open("init_data/0"+i.to_s+".jpg")
@p.project_images << @i
@p.save
@i.save
end



@p = Sketch.create(:title => "prizmas idea!!!", :description => "Display Wafflestudio's project, idea, sketches")
(15..20).each do |i|
@i = SketchImage.new()
@i.image = File.open("init_data/0"+i.to_s+".jpg")
@p.sketch_images << @i
@p.save
@i.save
end
