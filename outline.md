class User
    has_secure_password
    validates_presence_of :name
    validates_uniqueness_of :name


end

User migration
    t.string :name
    t.string :password_digest