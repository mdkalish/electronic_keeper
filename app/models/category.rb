class Category < ActiveRecord::Base

  def load_icons
    Dir['../assets/images/left_sidebar/64/*']
  end

end
