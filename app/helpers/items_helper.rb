module ItemsHelper

  def self.image item
    helpers.image_tag item.item_type.image_url
  end

  def self.helpers
    ActionController::Base.helpers
  end

end
