module ApplicationHelper

  #Created by: Salil Gaikwad
  #Created on: 07/01/2012
  #Purpose:
  #++ generate two meta tags containing values necessary for the cross-site request forgery protection built into Rails
  #Ref:- https://github.com/rails/jquery-ujs
  def csrf_meta_tag
    if protect_against_forgery?
      out = %(<meta name="csrf-param" content="%s"/>\n)
      out << %(<meta name="csrf-token" content="%s"/>)
      out % [ Rack::Utils.escape_html(request_forgery_protection_token),
              Rack::Utils.escape_html(form_authenticity_token) ]
    end
  end

  #Created by: Salil Gaikwad
  #Created on: 09/01/2012
  #Purpose:
  #++ This method is used to show the time infront of Received/Sent at in message section
  def message_time(message, if_nil="-")
    ret= message.created_at.blank? ? if_nil : message.created_at.to_datetime.strftime("%m/%d/%Y | %H:%M %p")
  end

  #Created by: Salil Gaikwad
  #Created on: 14/01/2012
  #Purpose:
  #++ This method is used to show the selection of an top menu
  def top_menu(par, tab)
    controller, action = par[:controller], par[:action]
    current_tab = top_menu_selector(controller, action)
    current_tab == tab ? "current_page_tab" : ""
  end

  #Created by: Salil Gaikwad
  #Created on: 14/01/2012
  #Purpose:
  #++ This method is used to show the selection of an top menu
  def top_menu_selector(controller, action)
    if controller =='users' && action == "find_people"
      "find_people"
    elsif controller =='messages'
      "messages"
    elsif controller =='discussions'
      "discussions"
    elsif controller =='albums'
      "photo_discussions"
    else
      "tabs"
    end   
  end

end
