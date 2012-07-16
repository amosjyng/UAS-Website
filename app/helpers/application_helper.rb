module ApplicationHelper
  def can_edit?(officer = nil)
    return signed_in? && (officer.nil? || \
            (current_user.name == officer.name || current_user.is_president))
  end
end
