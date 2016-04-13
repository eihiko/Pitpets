module ItemsHelper

  def self.display item
    helpers.image_tag item.item_type.image_url, class: "battle-item", id: item.id, draggable: false
  end

  def self.helpers
    ActionController::Base.helpers
  end

end
