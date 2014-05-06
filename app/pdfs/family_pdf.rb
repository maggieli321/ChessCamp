class FamilyPDF < Prawn::Document

	def initialize(family, view)
		super()
		@family = family
		@view = view
		report_title
		family_table 
	end

	def report_title
		text @family.family_name << " Report", :size => 24
	end

	def family_table
		family_data = []
	 	@family.students.each do |student|
	 		family_data << [student.name]
	 	end
	 	table(family_data)
	end 
end