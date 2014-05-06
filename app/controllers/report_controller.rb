class ReportController < ApplicationController

	def show_camp
		@camp = Camp.find(params[:id])
		respond_to do |format|
			format.html
			format.pdf do	
				pdf = PaymentPDF.new(@camp, view_context)
				send_data pdf.render, filename: "paymentreport_#{Time.now}.pdf",
				type: "application/pdf",
				disposition: "inline"
			end
		end
	end


	def show_family
		@family = Family.find(params[:id])
		respond_to do |format|
			format.html
			format.pdf do	
				pdf = FamilyPDF.new(@family, view_context)
				send_data pdf.render, filename: "familyreport_#{Time.now}.pdf",
				type: "application/pdf",
				disposition: "inline"
			end
		end
	end
end
