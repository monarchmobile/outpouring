namespace :db do 
	desc "create partials"
	task :create_partials => :environment do

		Partial.create(name: "Article", position: 1)

	end
end