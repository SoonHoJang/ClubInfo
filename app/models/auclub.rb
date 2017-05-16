class Auclub < ActiveRecord::Base
    # attr_accessible :title, :content, :period, :yschedules_attributes
    has_many :yschedules
    has_many :applies
    has_many :users
    accepts_nested_attributes_for :yschedules
     def self.search(search)
        where("club LIKE ? OR activity LIKE ? OR hash_tag LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")  # like구문을 써서 동아리명, 활동, 해시태그로 검색을 할 수 있도록고 하였습니당.
     end

    mount_uploader :logo, LogoUploader
end
