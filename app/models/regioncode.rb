class Regioncode < ActiveRecord::Base
	self.table_name = "a03a3_regioncode"


	def self.dataTourName
		query = <<-SQL
		 select '港澳地區'Region_Name,Count(a03a3_group.Region_Code) as total from a03a3_regioncode,a03a3_group 
		 where a03a3_group.Region_Code in ('H','H-01','H-02','H-03') and a03a3_regioncode.Region_Code=a03a3_group.Region_Code
		 union
		 select '中國大陸'Region_Name,Count(a03a3_group.Region_Code) as total from a03a3_regioncode,a03a3_group 
		 where a03a3_group.Region_Code in ('G','G-01','G-02','G-03','G-04','G-05','G-06','G-07','G-08','G-09','G-10','G-11') and a03a3_regioncode.Region_Code=a03a3_group.Region_Code
		 union
		 select '馬來西亞&新加坡'Region_Name,Count(a03a3_group.Region_Code) as total from a03a3_regioncode,a03a3_group 
		 where a03a3_group.Region_Code in ('D','D-01','D-02','D-03','D-04','D-05','D-06') and a03a3_regioncode.Region_Code=a03a3_group.Region_Code
		 union
		 select '日本'Region_Name,Count(a03a3_group.Region_Code) as total from a03a3_regioncode,a03a3_group 
		 where a03a3_group.Region_Code in ('A','A-01','A-02','A-03','A-04','A-05','A-06','A-07','A-08') and a03a3_regioncode.Region_Code=a03a3_group.Region_Code
		 union
		 select '印尼'Region_Name,Count(a03a3_group.Region_Code) as total from a03a3_regioncode,a03a3_group 
		 where a03a3_group.Region_Code in ('E','E-01','E-02','E-03','E-04','E-05') and a03a3_regioncode.Region_Code=a03a3_group.Region_Code
		 union
		 select '韓國'Region_Name,Count(a03a3_group.Region_Code) as total from a03a3_regioncode,a03a3_group 
		 where a03a3_group.Region_Code in ('B','B-01','B-02','B-03','B-04') and a03a3_regioncode.Region_Code=a03a3_group.Region_Code
		 union
		 select '泰國'Region_Name,Count(a03a3_group.Region_Code) as total from a03a3_regioncode,a03a3_group 
		 where a03a3_group.Region_Code in ('C','C-01','C-02','C-03','C-04') and a03a3_regioncode.Region_Code=a03a3_group.Region_Code
		 union	
		 select '紐澳地區'Region_Name,Count(a03a3_group.Region_Code) as total from a03a3_regioncode,a03a3_group 
		 where a03a3_group.Region_Code in ('K','K-01','K-02','K-03') and a03a3_regioncode.Region_Code=a03a3_group.Region_Code
		 union
		 select '歐洲'Region_Name,Count(a03a3_group.Region_Code) as total from a03a3_regioncode,a03a3_group 
		 where a03a3_group.Region_Code in ('L','L-01','L-02','L-03','L-04','L-05') and a03a3_regioncode.Region_Code=a03a3_group.Region_Code
		 union	
		 select '中南半島'Region_Name,Count(a03a3_group.Region_Code) as total from a03a3_regioncode,a03a3_group 
		 where a03a3_group.Region_Code in ('F','F-01','F-02','F-03','F-04') and a03a3_regioncode.Region_Code=a03a3_group.Region_Code
		 union		 
		 select '美國&加拿大'Region_Name,Count(a03a3_group.Region_Code) as total from a03a3_regioncode,a03a3_group 
		 where a03a3_group.Region_Code in ('I','I-01','I-02','I-03') and a03a3_regioncode.Region_Code=a03a3_group.Region_Code
		 union
		 select '太平洋島嶼'Region_Name,Count(a03a3_group.Region_Code) as total from a03a3_regioncode,a03a3_group 
		 where a03a3_group.Region_Code in ('J','J-01','J-02','J-03') and a03a3_regioncode.Region_Code=a03a3_group.Region_Code
		 union	
		 select '菲律賓'Region_Name,Count(a03a3_group.Region_Code) as total from a03a3_regioncode,a03a3_group 
		 where a03a3_group.Region_Code in ('P','P-01','P-02') and a03a3_regioncode.Region_Code=a03a3_group.Region_Code
		 union	 
		 select '中東南亞&非洲'Region_Name,Count(a03a3_group.Region_Code) as total from a03a3_regioncode,a03a3_group 
		 where a03a3_group.Region_Code in ('M','M-01','M-02','M-03') and a03a3_regioncode.Region_Code=a03a3_group.Region_Code
		 union		 
		 select '全球郵輪'Region_Name,Count(a03a3_group.Region_Code) as total from a03a3_regioncode,a03a3_group 
		 where a03a3_group.Region_Code in ('N','N-01','N-02','N-03','N-04','N-05','N-06','N-07') and a03a3_regioncode.Region_Code=a03a3_group.Region_Code
		 union
		 select '台灣'Region_Name,Count(a03a3_group.Region_Code) as total from a03a3_regioncode,a03a3_group 
		 where a03a3_group.Region_Code in ('O','O-01') and a03a3_regioncode.Region_Code=a03a3_group.Region_Code
		 
		 
		SQL

		data = self.find_by_sql(query)
		data.map{ |d| [ d.Region_Name, d.total ] }
		
	end
end
