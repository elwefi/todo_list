class Category < ActiveRecord::Base
  validates :name, presence:true
  default_scope {order('position ASC')}

  # RELATIONS
  ###########
  has_many :tasks

  # CALLBACK
  ##########
  before_save :incrementation

  private

  def incrementation
  	if self.position.blank?
      self.position  = Task.maximum(:position).nil? ? 1 : Task.maximum(:position) + 1
    end
  end
end
