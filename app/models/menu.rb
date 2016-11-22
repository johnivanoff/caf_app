class Menu < ActiveRecord::Base
  attr_accessible :display, :parent_id, :position, :url

  scope :root, where('parent_id IS NULL')

  scope :sub, lambda {
    where ('parent_id > ?'), (0)
    }


  def self.search(search)
    if search
      find(:all, :conditions => ['parent_id = ?', "%#{search}%"], :order => "position")
    else
      find(:all, :conditions => ['parent_id IS NULL'], :order => "position")
    end
  end


end
