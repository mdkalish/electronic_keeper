module ApplicationHelper

  def icons
    @icons = []
    Dir.glob('app/assets/images/left_sidebar/64/*.png').each do |icon|
      @icons.push(icon.slice(/(?<=images\/)(.*)/))
    end
    @icons
  end

end
