class User < ApplicationRecord
    require 'csv'

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            data = row.to_hash
            # newdata = data.slice("Duder", "Steps", "Distance", "Exercise", "Sleep", "Calories")
            key_map = { "Patient ID" => "patient_id",  
            "ordr provdr" => "order_provider", 
            "order name" => "order_name", 
            "labdate" => "lab_date", 
            "lab order dal" => "lab_ord_dtl", 
            "labanalyte" => "lab_analyte", 
            "labordertype" => "lab_order_type", 
            "labvalue" => "lab_value",
            "labinterpretation" => "lab_interpretation",
            "order id" => "order_id",
            "order src" => "order_src",
            "lablocaltemplist" => "lab_local_temp_list",
            "labordergenus" => "lab_order_genus",
            "labstatus" => "lab_status" }
            User.create! data.transform_keys! { |k| key_map[k]}     
        end
    end
end

