class Task < ActiveRecord::Base
  include RankedModel
  ranks :row_order

  validates :name, presence:true
  default_scope {order('row_order ASC')}
  # RELATIONS
  ###########
  belongs_to :category
  belongs_to :parent, :class_name => 'Task', :foreign_key => :parent_id
  has_many :children, :class_name => 'Task'
  
  #SCOPE
  ######
  scope :finished, -> {where(complete: true)}
  scope :unfinished, -> {where(complete: false)}

  # CALLBACK
  ##########
  before_save :incrementation, :if => :new_record?

  private

  def incrementation
    self.row_order  = Task.minimum(:row_order).nil? ? 1 : Task.minimum(:row_order)  -1
  end
end
