class Stock < ActiveRecord::Base
  establish_connection "other_#{Rails.env}"
  
  set_table_name 'stock'
  
  def to_jit()
    {
      'label' => branch_id,
      'values' => [in_circulation, in_store, unavailable]
    }
  end
end
