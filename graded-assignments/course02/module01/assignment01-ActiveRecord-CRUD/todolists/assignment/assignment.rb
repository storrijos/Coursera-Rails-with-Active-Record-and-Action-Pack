require_relative '../config/environment'

# Use Active Record Model methods to implement the following methods.
class Assignment

  #
  # Insert rows in DB
  #
  def create_user(params)
      # accept a hash of user properties (`:username` and `:password_digest`) as an input parameter. Note these are 100% same as model class.
      # use the User Model class to create a new user in the DB
      # return an instance of the class with primary key (`id`), and dates (`created_at` and `updated_at`) assigned

        @user = User.create(:username => params[:username], :password_digest => params[:password_digest])
        @user

  end

  def create_Todolist(params)
      # accept a hash of Todolist properties (`:name` and `:due_date`) as an input parameter. Note these are not 100% the same as Model class.
      # use the Todolist Model class to create a new user in the DB
      # return an instance of the class with primary key (`id`), and dates (`created_at` and `updated_at`) assigned
        @Todolist = Todolist.create(:list_name=> params[:name], :list_due_date=> params[:due_date])
        @Todolist

  end

  #
  # Retrieve paginated results from DB
  #
  def find_allusers(offset, limit)
      # accept offset and limit input parameters
      # use the User Model class to find all Users, ordered by `updated_at` ascending, with specified row offset and row limit
      # return a collection of User instances that represent the specified rows

        User.offset(offset).limit(limit).all.order(updated_at: :asc)

  end

  def find_alllists(offset, limit)
      # accept offset and limit input parameters
      # use the Todolist Model class to find all Todolists, ordered by `list_due_date` descending, with specified row offset and row limit
      # return a collection of Todolist instances that represent the specified rows

    Todolist.offset(offset).limit(limit).all.order(list_due_date: :desc)

  end

  #
  # Query DB with exact match
  #
  def find_user_byname(username)
      # accept a username input parameter
      # use the User Model class to find all Users with the supplied username. 
      # NOTE:  Username is not unique in the Users table, thus you can have many users with the same username.
      # return a collection of User instances that match the provided username  

      User.where(username: username)

  end 

  def find_Todolist_byname(name)
      # accept a name input parameter
      # use the Todolist Model class to find all Todolists with the supplied list_name. 
      # NOTE: List name is not required to be unique, thus you can have many lists with the same list name.
      # return a collection of Todolist instances that match the provided name
      
      Todolist.where(list_name:name)
  end     

  #
  # Get rows from DB by PK
  #
  def get_user_byid(id)
      # accept an id input parameter
      # use the User Model class to get the User associated with the `id` primary key
      # return the User instance that matches the provided id

    #Use find instead of where to search by PK
      User.find(id)
  end

  def get_Todolist_byid(id)
      # accept an id input parameter
      # use the Todolist Model class to get the Todolist associated with the `id` primary key
      # return the Todolist instance that matches the provided id

        Todolist.find(id)

  end

  #
  # Update rows in DB
  #
  def update_password(id, password_digest)
      # accept an id and password_digest input parameters
      # use the User Model class to update the `password_digest` for the User associated with the id primary key
      # (no return is required)
      User.find(id).update(password_digest:password_digest)
  end

  def update_listname(id, name)
      # accept an id and name input parameters
      # use the Todolist Model class to update the `list_name` for the Todolist associated with id primary key 
      # (no return is required)

        Todolist.find(id).update(list_name:name)

  end 

  #
  # Delete rows from DB
  #
  def delete_user(id)
      # accept an id input parameter
      # use the User Model class to remove the User associated with the `id` primary key from the database
      # (no return is required)
      User.find(id).delete
  end 

  def delete_Todolist(id)
      # accept an id input parameter
      # use the Todolist Model class to remove the Todolist associated with the `id` primary key.
      # (no return is required)
      Todolist.find(id).delete
  end
end
