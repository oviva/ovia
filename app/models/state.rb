class State < ActiveRecord::Base
  belongs_to :state
  
  def to_s
    name
  end
end
