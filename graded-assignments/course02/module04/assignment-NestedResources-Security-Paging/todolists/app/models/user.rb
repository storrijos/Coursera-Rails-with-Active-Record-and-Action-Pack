class User < ApplicationRecord
    has_secure_password
    has_one :profile, dependent: :destroy
    has_many :todo_lists, dependent: :destroy
    #Implement a 1:many :through relationship from User to TodoItem by using the 1:many 
    #relationship from User to TodoLists as a source.
    has_many :todo_items, through: :todo_lists, source: :todo_items, dependent: :destroy

    validates :username, presence: true


    def get_completed_count
        #We choose our id and then search for the items with the condition of completed:true
		User.find(self.id).todo_items.where(completed:true).count
    end

end
