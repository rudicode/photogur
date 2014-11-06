module ApplicationHelper

  def paginate(things)
    # content_tag(:ul) do
    page = link_to("Previous Page", pictures_path({:page => (@page-1) }))
    page += " | "
    page += link_to("Next Page", pictures_path({:page => (@page+1) }))
  end
end
