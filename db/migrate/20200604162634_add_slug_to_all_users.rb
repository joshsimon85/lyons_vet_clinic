class AddSlugToAllUsers < ActiveRecord::Migration[6.0]
  def change
    User.all.each do |user|
      user.update(:updated_at => Time.now)
    end
  end
end
