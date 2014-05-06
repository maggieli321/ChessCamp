class PaymentPDF < Prawn::Document

	def initialize(camp, view)
		super()
		@camp = camp
		@view = view
		report_title
		payment_table 
	end

	def report_title
		text @camp.name << " Report", :size => 24
	end

	def payment_table
		payment_data = []
	 	@camp.registrations.each do |registration|
	 		payment_data << [registration.student.name, registration.payment_status]
	 	end
	 	table(payment_data)
	end 
end