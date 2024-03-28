require 'faker'
require 'factory_bot_rails'

namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    # Step 0: initial set-up
    # Drop the old db and recreate from scratch
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    # Invoke rake db:migrate to set up db structure based on latest migrations
    Rake::Task['db:migrate'].invoke

    # STEP 1: Create Users
    sweetdweems = FactoryBot.create(:user)
    capcom      = FactoryBot.create(:user, username: "capitalcomic")
    zainlo      = FactoryBot.create(:user, username: "zainlo")
    puts "Created Users"
    users = [sweetdweems, capcom, zainlo]

    # STEP 2: Create Games
    tekken_8      = FactoryBot.create(:game)
    sea_of_stars  = FactoryBot.create(:game, title: "Sea of Stars")
    megaman_x     = FactoryBot.create(:game, title: "Mega Man X", release_year: "1993")
    hollow_knight = FactoryBot.create(:game, title: "Hollow Knight", release_year: "2017")
    doom_eternal  = FactoryBot.create(:game, title: "DOOM Eternal", release_year: "2020")
    totk          = FactoryBot.create(:game, title: "The Legend of Zelda: Tears of the Kingdom", release_year: "2023")
    ssbu          = FactoryBot.create(:game, title: "Super Smash Bros. Ultimate", release_year: "2018")
    persona_5     = FactoryBot.create(:game, title: "Persona 5", release_year: "2016")
    hi_fi_rush    = FactoryBot.create(:game, title: "Hi-Fi Rush", release_year: "2023")
    pk_platinum   = FactoryBot.create(:game, title: "Pokemon Platinum Version", release_year: "2009")
    puts "Created Games"
    games = [tekken_8, sea_of_stars, megaman_x, hollow_knight, doom_eternal, totk, ssbu, persona_5, hi_fi_rush, pk_platinum]

    # STEP 3: Create Gamelogs
    users.each do |u|
      5.times do 
        FactoryBot.create(:gamelog, game: games.sample, user: u, review_score: rand(6), review_content: Faker::Lorem.paragraph)
      end
    end
    puts "Created Gamelogs"

  end
end