class User < ApplicationRecord
    require 'rubygems'
    require 'smarter_csv'

    def self.import(file)
        data = SmarterCSV.process(file.path, { :quote_char => '"', :delimiter => ',',
        :force_quotes => true, :skip_lines => 1 } )
        puts "#{data} + ***************************************"
        # CSV.foreach(file.path, headers: true) do |row|
        #     data = row.to_hash
        #     # newdata = data.slice("Duder", "Steps", "Distance", "Exercise", "Sleep", "Calories")
        #     key_map = { "Patient ID" => "patient_id",  
        #     "ordr provdr" => "order_provider", 
        #     "order name" => "order_name", 
        #     "labdate" => "lab_date", 
        #     "lab ord dtl" => "lab_ord_dtl", 
        #     "labanalyte" => "lab_analyte", 
        #     "labordertype" => "lab_order_type", 
        #     "labvalue" => "lab_value",
        #     "labinterpretation" => "lab_interpretation",
        #     "order id" => "order_id",
        #     "order src" => "order_src",
        #     "lablocaltemplist" => "lab_local_temp_list",
        #     "labordergenus" => "lab_order_genus",
        #     "labstatus" => "lab_status" }
        #     User.create! data.transform_keys! { |k| key_map[k]}     
        # end
    end
end
# Patient ID,
# ordr provdr,
# order name,
# labdate,
# lab ord dtl,
# labanalyte,
# labordertype,
# labvalue,
# labinterpretation,
# order id,
# order src,
# lablocaltemplist,
# labordergenus,
# labstatus



# patient_id
# order_provider
# order_name 
# lab_date
# lab_ord_dtl
# lab_analyte 
# lab_order_type 
# lab_value
# lab_interpretation 
# order_id
# order_src 
# lab_local_temp_list
# lab_order_genus 
# lab_status 








