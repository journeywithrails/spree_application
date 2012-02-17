# Use this file to load your own seed data from extensions.  
# See the db/seeds.rb file in the Spree core for some ideas on what you can do here.
if Country.count == 0
  Rake::Task["db:load_dir"].invoke( "states" )
  puts "Default data has been loaded"
end

puts("Creating mail method")
mail_method = MailMethod.find_or_initialize_by_environment("production")

if mail_method.new_record?
  mail_method.preferred_mails_from="no-reply@smokefit.com"
  mail_method.preferred_mail_port="25"
  mail_method.preferred_intercept_email=""
  mail_method.preferred_smtp_username="simon@smokefit.com"
  mail_method.preferred_mail_bcc="simon@smokefit.com"
  mail_method.preferred_secure_connection_type="SSL"
  mail_method.preferred_mail_domain="smtp.gmail.com"
  mail_method.preferred_mail_host="smtp.gmail.com"
  mail_method.preferred_mail_auth_type="login"
  mail_method.preferred_smtp_password="tifekoms21"
  mail_method.preferred_enable_mail_delivery="1"
  
  mail_method.save
  puts("   Mail method created.")
end

puts("Creating Admin User")
user = User.find_or_initialize_by_email("admin@ezeesmoke.com")
if user.new_record?
  user.password = "password"
  user.password_confirmation = "password"
  user.roles << Role.find_by_name("admin")
  user.save
  puts("   Admin user created.")
end

puts("Creating Pages")
pages = ['Testimonials', "How it works", "Terms of Service", "Benefits", "Refills"]
pages.each do |page|
  pa = Page.find_or_initialize_by_title(page)
  if pa.new_record?
    pa.slug = page.downcase.gsub(/\s/, "_")
    pa.body = "This is the #{page} Page"
    pa.foreign_link = ""
    pa.meta_keywords = page + " Smokefit"
    pa.meta_description = page + " Smokefit"
    pa.save
    puts("   Page '#{page}' created.")
  end
end

puts("Creating Taxonomies")
taxonomy = Taxonomy.find_or_create_by_name("categories")
first_taxon = taxonomy.taxons.first
['Kits', 'Accessories', 'Refills'].each do |taxon|
  tax = taxonomy.taxons.find_or_initialize_by_name(taxon)
  tax.parent_id = first_taxon.id
  tax.save
  puts("   Taxonomy '#{taxon}' created.")
end

puts("Creating the Facebook authentication provider")
if AuthenticationMethod.count == 0
  AuthenticationMethod.create({"preferred_provider"=>"facebook", "environment"=>"production", "preferred_api_key"=>"7ffd3759ec396657ccfed7d532163b05", "active"=>"1", "preferred_api_secret"=>"8310cbe81e4c3e7e2b54c770019fef2b"})
  puts("   Facebook authentication provider created.")
end

puts("Creating the american states")
country = Country.find_by_name('United States')
if country && country.states.size < 0
  american_states = [{"District of Columbia"=>"DC"}, {"Utah"=>"UT"}, {"Louisiana"=>"LA"}, {"Virginia"=>"VA"}, {"North Dakota"=>"ND"}, {"Wyoming"=>"WY"}, {"New Mexico"=>"NM"}, {"Connecticut"=>"CT"}, {"West Virginia"=>"WV"}, {"Wisconsin"=>"WI"}, {"North Carolina"=>"NC"}, {"Nevada"=>"NV"}, {"Hawaii"=>"HI"}, {"Oklahoma"=>"OK"}, {"Florida"=>"FL"}, {"California"=>"CA"}, {"Oregon"=>"OR"}, {"Kentucky"=>"KY"}, {"Massachusetts"=>"MA"}, {"Alaska"=>"AK"}, {"Washington"=>"WA"}, {"New Hampshire"=>"NH"}, {"Arkansas"=>"AR"}, {"Pennsylvania"=>"PA"}, {"Rhode Island"=>"RI"}, {"Maryland"=>"MD"}, {"Ohio"=>"OH"}, {"Texas"=>"TX"}, {"Mississippi"=>"MS"}, {"Colorado"=>"CO"}, {"South Carolina"=>"SC"}, {"South Dakota"=>"SD"}, {"Illinois"=>"IL"}, {"Missouri"=>"MO"}, {"Nebraska"=>"NE"}, {"Delaware"=>"DE"}, {"Tennessee"=>"TN"}, {"New Jersey"=>"NJ"}, {"Indiana"=>"IN"}, {"Iowa"=>"IA"}, {"Georgia"=>"GA"}, {"New York"=>"NY"}, {"Michigan"=>"MI"}, {"Arizona"=>"AZ"}, {"Kansas"=>"KS"}, {"Idaho"=>"ID"}, {"Vermont"=>"VT"}, {"Montana"=>"MT"}, {"Minnesota"=>"MN"}, {"Maine"=>"ME"}, {"Alabama"=>"AL"}]
  american_states.each do |state|
    state = state.first
    american_state = State.find_or_initialize_by_name_and_abbr(state.first, state.last)
    american_state.country_id = country.id
    if american_state.save
      puts("   American state #{american_state.name} created.")
    end
  end
end

puts("Creating the canadian states")
country = Country.find_by_name('Canada')
if country
  canadian_states = [{"Alberta" => "AB"}, {"British Columbia" => "BC"}, {"Manitoba" => "MB"}, {"New Brunswick" => "NB"}, {"Newfoundland and Labrador" => "NL"}, {"Northwest Territories" => "NT"}, {"Nova Scotia" => "NS"}, {"Nunavut" => "NU"}, {"Ontario" => "ON"}, {"Prince Edward Island" => "PE"}, {"Quebec" => "QC"}, {"Saskatchewan" => "SK"}, {"Yukon" => "YT"}]
  canadian_states.each do |state|
    state = state.first
    canadian_state = State.find_or_initialize_by_name_and_abbr(state.first, state.last)
    canadian_state.country_id = country.id
    if canadian_state.save
      puts("   Canadian state #{canadian_state.name} created.")
    end
  end
end

# Destroying unused countries
puts("Destroying unused countries")
Country.all.each do |country|
  unless country.name.eql?("Canada") || country.name.eql?('United States')
    country.destroy
  end
end

# Database manual inserts
# insert into countries(id,iso_name,iso,name,iso3,numcode) values(35,'CANADA','CA','Canada','CAN',124);
# insert into countries(id,iso_name,iso,name,iso3,numcode) values(214,'UNITED STATES','US','United States','USA',840);