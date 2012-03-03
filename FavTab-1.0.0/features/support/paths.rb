module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the my account\s?page/
      "/users/profile/#{@user.id}"

    when /the all discussions\s?page/
      "/all_discussion"

    when /the home\s?page/
      "/"
      
    when /the message\s?page/
      "/messages"

    when /the discussions\s?page/
      "/discussions"
      
    when /the find people\s?page/
      "/users/find_people"

    when /the manage groups\s?page/
      "/users/manage_groups"
   
    when /the manage albums\s?page/
      "/albums?id=#{@user.id}"

    when /the album photos\s?page/
      "/albums/#{@album.id}"

        
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
