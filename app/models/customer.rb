class Customer < ActiveRecord::Base
	self.table_name = "a05b01_paxdata"
	def self.dataAge
		query = <<-SQL
		select '1-15歲' Pax_Data ,Count(Tour_Code) as total from a05b01_paxdata where Pax_Age>=1 and Pax_Age<=15 
		union 
		select '16-25歲' Pax_Data,Count(Tour_Code) as total from a05b01_paxdata where Pax_Age>=16 and Pax_Age<=25
		union 
		select  '26-40歲' Pax_Data ,Count(Tour_Code) as total from a05b01_paxdata where Pax_Age>=26 and Pax_Age<=40
		union 
		select '41~60歲' Pax_Data,Count(Tour_Code) as total from a05b01_paxdata where Pax_Age>=41 and Pax_Age<=60
		union  
		select '61~100歲' Pax_Data,Count(Tour_Code) as total from a05b01_paxdata where Pax_Age>=61
		SQL

		data = self.find_by_sql(query)
		data.map{ |d| [ d.Pax_Data.to_s ,d.total] }
		
	end
	
	def self.dataGender
		query = <<-SQL
		select Pax_Gender, Count(*) as total from a05b01_paxdata where Pax_Gender ='男' or Pax_Gender='女' group by Pax_Gender
		SQL

		data = self.find_by_sql(query)
		data.map{ |d| [ d.Pax_Gender, d.total] }
		
	end

	def self.dataPaxType
		query = <<-SQL
		select Pax_Type, Count(*) as total from a05b01_paxdata where Pax_Type is not null group by Pax_Type
		SQL

		data = self.find_by_sql(query)
		data.map{ |d| [ d.Pax_Type, d.total] }
		
	end
end
