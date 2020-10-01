class Blog < ApplicationRecord
    belongs_to :user 

    validates :title, presence: true
    validates :body, presence: true
    validates :date, presence: true


    def please_display_a_name_and_not_a_number(id_in)
        @user.find(params[id_in])
    end

end
