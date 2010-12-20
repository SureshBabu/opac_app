class Stock < ActiveRecord::Base
  set_table_name 'stock'
  
  def to_jit()
    {
      'label' => branch_id,
      'values' => [in_circulation, in_store, unavailable]
    }
  end
end
