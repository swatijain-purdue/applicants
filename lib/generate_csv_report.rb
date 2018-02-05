require "csv"
module GenerateCsvReport
  def self.process(start_date, end_date)
  	start_datetime  = start_date.to_datetime 
  	end_datetime = end_date.to_datetime 
  	results = Applicant.where('created_at >= ? and created_at <= ?', start_datetime, end_datetime).group(:workflow_state, :created_at).count rescue []
  	
  	# Results will be in this format
  	# {["hired", Sun, 01 Jan 2017 01:42:00 UTC +00:00]=>1, 
  	# ["hired", Mon, 05 Feb 2018 02:17:24 UTC +00:00]=>1, 
  	# ["hired", Mon, 12 Feb 2018 02:17:46 UTC +00:00]=>1, 
  	# ["onboarding_completed", Mon, 05 Feb 2018 02:18:15 UTC +00:00]=>1} 

  	print "count,week,workflow_state \n"
  	CSV.open("results.csv", "wb") do |csv|
	  csv << ["count", "week", "workflow_state"]
	  results.each do |grouping_data, count|
	  	workflow_state = grouping_data[0]
	  	week = grouping_data[1].to_date
	  	csv << [count, week, workflow_state]
	  	print count, ",", week, ",", workflow_state, "\n"
      end
	end
  end
end
