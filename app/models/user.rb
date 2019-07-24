class User < ApplicationRecord
    require 'rubygems'
    require 'smarter_csv'
    
    def self.import(file)
        data = SmarterCSV.process(
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
        
        User.create! data
    end
end









# changes key/header names after import on each hash i.e. less efficient

# KEY_MAP = {
    #     :patient_id => :patient_id,  
    #     :ordr_provdr => :order_provider, 
    #     :order_name => :order_name, 
    #     :labdate => :lab_date, 
    #     :lab_ord_dtl => :lab_ord_dtl, 
    #     :labanalyte => :lab_analyte, 
    #     :labordertype => :lab_order_type, 
    #     :labvalue => :lab_value,
    #     :labinterpretation => :lab_interpretation,
    #     :order_id => :order_id,
    #     :order_src => :order_src,
    #     :lablocaltemplist => :lab_local_temp_list,
    #     :labordergenus => :lab_order_genus,
    #     :labstatus => :lab_status 
    # }

#     def self.import(file)
#         data = SmarterCSV.process(
#             file.path, { 
#                 :quote_char => '"', :delimiter => ',',
#                 :force_quotes => true, :skip_lines => 1 
#             } 
#         )

#         new_data = data.map { |row| self.reformat_row(row)}
#             User.create! new_data
#         end

#     def self.reformat_row(row)
#         row.map { |k, v| [KEY_MAP[k], v] }.to_h
#     end
# end