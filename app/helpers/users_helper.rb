module UsersHelper
  # include ActionView::Helpers::NumberHelper

  def self.format_pitpoints pitpoints
    ActionController::Base.helpers.number_to_currency (pitpoints / 100.0)
  end

end
