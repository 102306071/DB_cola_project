class HomeController < ApplicationController
	def index
		@data = Customer.dataAge

	end

	def dataTourType
	   	@data = Group.dataTourType
	end

	def dataAge
	   	@data = Customer.dataAge
	end

	def dataGender
	   	@data = Customer.dataGender
	end

	def dataPaxType
	   	@data = Customer.dataPaxType
	end

	def dataSeason
	   	@data = Group.dataSeason
	end

	def dataTourDays
	   	@data = Group.dataTourDays
	end

	def dataTourName
	   	@data = Regioncode.dataTourName
	end
end
