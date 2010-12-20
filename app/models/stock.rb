class Stock < ActiveRecord::Base
  set_table_name 'stock'
  
  def to_jit()
    {
      'label' => branch_id,
      'values' => [in_circulation_cnt, in_store_cnt, unavailable_cnt]
    }
  end
end
