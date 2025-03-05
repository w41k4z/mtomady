namespace :treatments do
  desc "Treatment repopulation"
  task repopulate: :environment do
    # TODO: treatment update mechanism
    puts "Treatments repopulated at #{Time.current}"
  end
end
