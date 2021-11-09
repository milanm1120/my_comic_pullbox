class Comicbook < ActiveRecord::Base
    belongs_to :user #needs foreign key, #also a class method with addtional macros built in
    validates :title, :issue_number, presence: true
end