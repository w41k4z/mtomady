puts "Database cleaning..."

TreatmentTranslation.destroy_all
Treatment.destroy_all
CategoryTranslation.destroy_all
Category.destroy_all
SupportedLanguage.destroy_all

puts "Seeding supported languages..."
SupportedLanguage.create!(
  code: 'fr',
  name: 'French',
  created_at: Time.current,
  updated_at: Time.current
)

SupportedLanguage.create!(
  code: 'mg',
  name: 'Malagasy',
  created_at: Time.current,
  updated_at: Time.current
)
puts "Created #{SupportedLanguage.count} supported languages"

puts "Creating categories..."
diagnostics_category = Category.create!(name: 'Diagnostics', state: 0)
examinations_category = Category.create!(name: 'Examinations', state: 0)
puts "Created #{Category.count} categories"

puts "Creating treatments under Diagnostics category..."
diagnostic_treatments = [
  'angiocardiography', 'angiography', 'brain scanning',
  'cholecystography', 'echocardiography', 'mammography',
  'myelography', 'prenatal testing', 'ultrasound', 'urography'
]
diagnostic_treatments.each do |treatment_name|
  Treatment.create!(
    name: treatment_name,
    category_id: diagnostics_category.id,
    state: 0
  )
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
  Treatment.create!(
    name: treatment_name,
    category_id: examinations_category.id,
    state: 1
  )
end
puts "Created #{Treatment.count} treatments"