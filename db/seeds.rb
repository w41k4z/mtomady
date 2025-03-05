puts "Seeding supported languages..."

# Use find_or_create_by to avoid duplicates
SupportedLanguage.find_or_create_by!(code: 'fr') do |language|
  language.name = 'French'
  language.created_at = Time.current
  language.updated_at = Time.current
end

SupportedLanguage.find_or_create_by!(code: 'mg') do |language|
  language.name = 'Malagasy'
  language.created_at = Time.current
  language.updated_at = Time.current
end

puts "Created #{SupportedLanguage.count} supported languages"

puts "Creating categories..."
diagnostics_category = Category.find_or_create_by!(name: 'Diagnostics') do |category|
  category.state = 0
end

examinations_category = Category.find_or_create_by!(name: 'Examinations') do |category|
  category.state = 0
end

puts "Created #{Category.count} categories"

puts "Creating treatments under Diagnostics category..."
diagnostic_treatments = [
  'angiocardiography', 'angiography', 'brain scanning',
  'cholecystography', 'echocardiography', 'mammography',
  'myelography', 'prenatal testing', 'ultrasound', 'urography'
]
diagnostic_treatments.each do |treatment_name|
  Treatment.find_or_create_by!(name: treatment_name, category_id: diagnostics_category.id) do |treatment|
    treatment.state = 0
  end
end

puts "Creating treatments under Examinations category..."
examination_treatments = [
  'auscultation', 'autopsy', 'biopsy', 'bronchoscopy',
  'cardiac catheterization', 'colposcopy', 'endoscopy',
  'esophagogastroduodenoscopy', 'gynecological examination',
  'laparoscopy', 'mediastinoscopy', 'nasopharyngolaryngoscopy',
  'palpation', 'percussion', "Rubin's test"
]

examination_treatments.each do |treatment_name|
  Treatment.find_or_create_by!(name: treatment_name, category_id: examinations_category.id) do |treatment|
    treatment.state = 1
  end
end

puts "Created #{Treatment.count} treatments"

# Create admin user
admin_email = 'admin@example.com'
admin_password = 'admin123!'

admin = Admin.find_or_create_by(email: admin_email) do |admin|
  admin.password = admin_password
  admin.password_confirmation = admin_password
end

puts "Admin user seeded with email: #{admin_email} and password: #{admin_password}"
