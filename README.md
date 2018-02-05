# README

This is a sample instacart applicants app where 
1. usera are allowed to apply for instacart 
2. an analysis report is generated to get the number of applications based on workflow state and the time when they were created

* Ruby version  - 2.2.2p95
* Rails version -  5.1.4

Steps to run the script to generate the sqlite results: (main code in lib/generate_csv_report.rb file)

C02SX0TJG8WL:applicants sjain$ rails console

Loading development environment (Rails 5.1.4)

2.2.2 :001 > require 'generate_csv_report'

2.2.2 :003 >  GenerateCsvReport.process "2016-01-01","2018-12-12"
   (0.2ms)  SELECT COUNT(*) AS count_all, "applicants"."workflow_state" AS applicants_workflow_state, "applicants"."created_at" AS applicants_created_at FROM "applicants" WHERE (created_at >= '2016-01-01 00:00:00' and created_at <= '2018-12-12 00:00:00') GROUP BY "applicants"."workflow_state", "applicants"."created_at"

Script will print the following:  (these are saved in the results.csv file as well)

count,week,workflow_state

1,2017-01-01,hired

1,2018-02-05,hired

1,2018-02-12,hired

1,2018-02-05,onboarding_completed


Script will generate the the following results: 

=> {["hired", Sun, 01 Jan 2017 01:42:00 UTC +00:00]=>1, ["hired", Mon, 05 Feb 2018 02:17:24 UTC +00:00]=>1, ["hired", Mon, 12 Feb 2018 02:17:46 UTC +00:00]=>1, ["onboarding_completed", Mon, 05 Feb 2018 02:18:15 UTC +00:00]=>1} 


