class Weather < ApplicationRecord
  serialize :temperatures

  def temperatures=(array)
    values = array.map(&:to_f)
    write_attribute(:temperatures, values)
  end

  def as_json(_options = {})
    super(except: %i[created_at updated_at])
  end
end
