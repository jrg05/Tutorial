class Post < ActiveRecord::Base
	attr_accessible :coment ,:name ,:title
	validates :name,  :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
  has_many :comments dependent: :destroy
  has_many :tag
  acceps_nested_attributes_for :tag , :allow_detroy: :true, :reject_if: proc{ |attrs| attrs.all?{|k,v| v.blank?}}
end
