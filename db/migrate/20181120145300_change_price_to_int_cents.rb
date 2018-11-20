class ChangePriceToIntCents < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :price, :int
  end
end
