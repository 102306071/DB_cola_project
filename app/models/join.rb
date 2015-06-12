class Join < ActiveRecord::Base
	self.table_name = "a05b00_order"
	def self.dataTourType
		query = <<-SQL
		select Count(Tour_Code) as total,Tour_Type from a05b00_order group by Tour_Type  order by total limit 10
		SQL

		data = self.find_by_sql(query)
		data.map{ |d| [ d.Tour_Type, d.total ] }
		
	end
	
end
