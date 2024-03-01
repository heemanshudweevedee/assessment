namespace :data do
    desc 'Import data from JSON file'
    task import_json: :environment do
      json_data = File.read('/home/protons/Downloads/data.json')
      data = JSON.parse(json_data)
      data.each do |user_data|
        person = Person.create(name: user_data["name"])
        Detail.create(person_id: person.id, title: user_data["info"]["title"], age: user_data["info"]["age"], email: user_data["info"]["email"], phone: user_data["info"]["phone"])
      end
  
      puts 'Data imported successfully!'
    end
  end