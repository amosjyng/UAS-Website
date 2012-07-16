module ApplicationHelper
  def can_edit?(officer = nil)
    return signed_in? && (officer.nil? || current_user.name == officer.name)
  end
end
