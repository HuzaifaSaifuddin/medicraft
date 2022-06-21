module PatientsHelper
  def search_types
    [['Mobile Number', 'mobile_number'], ['Patient ID', 'display_id'],
     ['Medical Record Number', 'medical_record_number']]
  end
end
