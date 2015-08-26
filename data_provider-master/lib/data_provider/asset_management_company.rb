class DataProvider::AssetManagementCompany
  include Mongoid::Document

  field :company_code
  field :company_name
  field :sponser_name
  field :trustee_company_name
  field :mf_set_up_date, :type => Date
  field :code
  field :name
  field :incorporation_date, :type => Date
  field :ceo_name
  field :cio_name
  field :fund_manager_name
  field :compliance_officer_name
  field :inv_service_officer_name
  field :auditors_name
  field :custodian_name
  field :registrar_name
  field :type_of_mutual_fund
  field :modified_date, :type => DateTime
  field :delete_flag

  index :company_code, :background => true
end
