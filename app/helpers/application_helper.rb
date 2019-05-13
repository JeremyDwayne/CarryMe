module ApplicationHelper
  def active_class(search, link_path) 
    path = request.fullpath
    if path.include? link_path
      if search.present?
        if path.include?(search)
          "active"
        end
      elsif current_page? link_path
        "active"
      end
    end
  end

  def wowGoldConverter(price)
    number_to_human(price, units: {unit: "g", thousand: "k", million: "m"})
  end
end
