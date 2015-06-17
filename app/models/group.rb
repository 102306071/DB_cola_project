class Group < ActiveRecord::Base
	self.table_name = "a03a3_group"
	def self.dataTourType
		query = <<-SQL
		select Count(a05b01_paxdata.Tour_Code) as total,a03a3_group.Tour_Type from a05b01_paxdata, a03a3_group where a03a3_group.Tour_Code = a05b01_paxdata.Tour_Code  group by Tour_Type order by total limit 10
		SQL

		data = self.find_by_sql(query)
		data.map{ |d| [ d.Tour_Type, d.total ] }	
	end

	def self.dataTourDays
		query = <<-SQL
		select '5' Order_No , Count(Tour_Code) as total from a05b01_paxdata where substr(Tour_Code, 8 ,2 ) = '05'
		union
		select '6' Order_No , Count(Tour_Code) as total from a05b01_paxdata where substr(Tour_Code, 8 ,2 ) = '06'
		union 
		select '4' Order_No , Count(Tour_Code) as total from a05b01_paxdata where substr(Tour_Code, 8 ,2 ) = '04'
		union
		select '3' Order_No , Count(Tour_Code) as total from a05b01_paxdata where substr(Tour_Code, 8 ,2 ) = '03'
		union
		select '10' Order_No , Count(Tour_Code) as total from a05b01_paxdata where substr(Tour_Code, 8 ,2 ) = '10'
		union		
		select '8' Order_No , Count(Tour_Code) as total from a05b01_paxdata where substr(Tour_Code, 8 ,2 ) = '08'
		union		
		select '7' Order_No , Count(Tour_Code) as total from a05b01_paxdata where substr(Tour_Code, 8 ,2 ) = '07'
		union
		select '9' Order_No , Count(Tour_Code) as total from a05b01_paxdata where substr(Tour_Code, 8 ,2 ) = '09'
		union
		select '12' Order_No , Count(Tour_Code) as total from a05b01_paxdata where substr(Tour_Code, 8 ,2 ) = '12'
		union
		select '11' Order_No , Count(Tour_Code) as total from a05b01_paxdata where substr(Tour_Code, 8 ,2 ) = '11'
		union
		select '15' Order_No , Count(Tour_Code) as total from a05b01_paxdata where substr(Tour_Code, 8 ,2 ) = '15'
		union		
		select '2' Order_No , Count(Tour_Code) as total from a05b01_paxdata where substr(Tour_Code, 8 ,2 ) = '02'
		SQL

		data = self.find_by_sql(query)
		data.map{ |d| [ d.Order_No.to_s, d.total ] }	
	end

	def self.dataSeason
		query = <<-SQL
		select '冬天'Tour_Type, count(Month(Tour_Date)) as total from  a05b01_paxdata where Month(Tour_Date) in (12,1,2)
		union 
		select '春天'Tour_Type, count(Month(Tour_Date)) as total from  a05b01_paxdata where Month(Tour_Date) in (3,4,5)
		union 
		select '夏天'Tour_Type, count(Month(Tour_Date)) as total from  a05b01_paxdata where Month(Tour_Date) in (6,7,8)
		union 
		select '秋天'Tour_Type, count(Month(Tour_Date)) as total from  a05b01_paxdata where Month(Tour_Date) in (9,10,11)

		SQL

		data = self.find_by_sql(query)
		data.map{ |d| [ d.Tour_Type.to_s, d.total ] }	
	end

	def self.dataSeasonInc
		query = <<-SQL
		select '冬天'Tour_Type, count(Month(Tour_Date)) as total from a03a3_group where Month(Tour_Date) in (12,1,2)
		union 
		select '春天'Tour_Type, count(Month(Tour_Date)) as total from a03a3_group where Month(Tour_Date) in (3,4,5)
		union 
		select '夏天'Tour_Type, count(Month(Tour_Date)) as total from a03a3_group where Month(Tour_Date) in (6,7,8)
		union 
		select '秋天'Tour_Type, count(Month(Tour_Date)) as total from a03a3_group where Month(Tour_Date) in (9,10,11)
		SQL
	end


end
