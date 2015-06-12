class Group < ActiveRecord::Base
	self.table_name = "a03a3_group"
	def self.dataTourType
		query = <<-SQL
		select Count(Tour_Code) as total,Tour_Type from a03a3_group group by Tour_Type order by total limit 10
		SQL

		data = self.find_by_sql(query)
		data.map{ |d| [ d.Tour_Type, d.total ] }	
	end

	def self.dataTourDays
		query = <<-SQL
		select Tour_Days, Count(Tour_Code) as total from a03a3_group where Tour_Days<=12 and Tour_Days>1 or Tour_Days =15 group by Tour_Days order by Count(Tour_Code) desc
		SQL

		data = self.find_by_sql(query)
		data.map{ |d| [ d.Tour_Days.to_s, d.total ] }	
	end

	def self.dataSeason
		query = <<-SQL
		select '冬天'Tour_Type, count(Month(Tour_Date)) as total from a03a3_group where Month(Tour_Date) in (12,1,2)
		union 
		select '春天'Tour_Type, count(Month(Tour_Date)) as total from a03a3_group where Month(Tour_Date) in (3,4,5)
		union 
		select '夏天'Tour_Type, count(Month(Tour_Date)) as total from a03a3_group where Month(Tour_Date) in (6,7,8)
		union 
		select '秋天'Tour_Type, count(Month(Tour_Date)) as total from a03a3_group where Month(Tour_Date) in (9,10,11)

		SQL

		data = self.find_by_sql(query)
		data.map{ |d| [ d.Tour_Type.to_s, d.total ] }	
	end
end
