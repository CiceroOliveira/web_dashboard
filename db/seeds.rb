# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Wiki.delete_all
Wiki.create(:uri => 'FrontPage',
            :name => 'FrontPage', 
            :content => "This is the FrontPage.\r\n\r\nIt all starts from here."
)