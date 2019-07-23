class User < ApplicationRecord
    require 'rubygems'
    require 'smarter_csv'

    def self.import(file)
        data = SmarterCSV.process(file.path, { :quote_char => '"', :delimiter => ',',
        :force_quotes => true, :skip_lines => 1 } )
        key_map = { :patient_id => :patient_id,  
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
        :labstatus => :lab_status }
        newdata = []
        data.each do |h|
            newdata << h.map { |k, v| [key_map[k], v] }.to_h
        end
        # puts "#{newdata} ***********************************************************"
        User.create! newdata
    end
end
# patient_id,
# ordr_provdr,
# order_name,
# labdate,
# lab_ord_dtl,
# labanalyte,
# labordertype,
# labvalue,
# labinterpretation,
# order_id,
# order_src,
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








