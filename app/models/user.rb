class User < ApplicationRecord
    require 'rubygems'
    require 'smarter_csv'
    
    
    def self.import(file)
        @odata = SmarterCSV.process(
            file.path, { 
                :quote_char => '"', :delimiter => ',',
                :force_quotes => true, 
                :skip_lines => 1, 
                :key_mapping => {   :patient_id => :patient_id,  
                                    :ordr_provdr => :order_provider, 
                                    :order_name => :order_name, 
                                    :labdate => :lab_date, 
                                    :lab_ord_dtl => :lab_ord_dtl, 
                                    :labanalyte => :lab_analyte, 
                                    :labordertype => :lab_order_type, 
                                    :labvalue => :lab_value,
                                    :labinterpretation => :lab_interpretation,
                                    :order_id => :order_id,
                                    :order_src => :order_src,
                                    :lablocaltemplist => :lab_local_temp_list,
                                    :labordergenus => :lab_order_genus,
                                    :labstatus => :lab_status
        }})
        return @odata
    end      
    
    
    def datamap(patients)
        data = patients.flatten
        byebug
        final_array = []
        loop do 
            array1 = []
            array2 = []
            array1 << data.shift
            
            if 
              data.empty? == true 
              array2 << array1
              break
            else     
              #puts like hashes into array1
              data.each do |h|
                if "#{array1.last["patient_id"]}#{array1.last["lab_date"]}" == "#{h["patient_id"]}#{h["lab_date"]}"
                  array1 << h
                end
              end
        
              #removes hashes from data that are now in array1
              data.reject! { |h| "#{array1.last["patient_id"]}#{array1.last["lab_date"]}" == "#{h["patient_id"]}#{h["lab_date"]}"}
        
        
        
              number_a = 0
              number_b = 0
        
              # changes values and keys
              array1.each do |h|
                h["lab_ord_dtl"] = "#{h["order_name"]}, #{h["lab_ord_dtl"]}, #{h["lab_order_type"]}"
                h.transform_keys! do |k|
                  if 
                    k == "lab_ord_dtl"
                    k = "lab_#{number_a += 1}"
                  elsif 
                    k == "lab_value"
                    k = "lab_result_#{number_b += 1}"
                  else
                    k = k 
                  end
                end
              end
        
              array1.each do |h|
                h.delete("order_provider")
                h.delete("order_name")
                h.delete("lab_analyte")
                h.delete("lab_order_type")
                h.delete("order_id")
                h.delete("order_src")
                h.delete("lab_order_genus")
                h.delete("lab_status")
                h.delete("lab_interpretation")
              end
        
              array2 << array1.shift 
        
              array1.each do |h|
                array2[0].merge!(h)
              end
          end
            final_array << array2
        end 
    end
    datamap(@odata)
end