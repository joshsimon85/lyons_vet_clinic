class AddSlugToAllUsers < ActiveRecord::Migration[6.0]
  def change
    User.all.each do |user|
      user.update_attribute(:slug, user.full_name.downcase.parameterize)
    end 
  end
end
