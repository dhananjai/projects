module DiscussionsHelper

   def createCommentsTree(response) #Create Category Tree which is open in new window:
    erg=""
    i=0
    erg +="<div class='inner_comment_wrapper'>
      <div class='float_l'>
        <a class='toggle_comment expand_btn margin_top_five' href='#'>&nbsp;</a>
      </div>
      <div class='float_l'>
        <img alt='' src='images/profile_image.jpg' class='small_user_image' />
      </div>
      <div class='float_l'>
        <div class='comment_detail_div'>
          <a class='user_name' href='#'>#{get_username(response.user_id)}</a>
          <br/><span class='comment_text'>#{response.comment}</span>
          <div class='url_action_div no_left_padding'>
            <img alt='' src='images/rating_stars.jpg' class='ratings'/>
            <span class='comment_count'>[ 23 ] Votes</span>
            <span class='link_seperator float_l'>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span> <a class='discussion_action_link' href='#'>Rate It</a>
          </div>
          <div class='post_comment_div'>
            <span class='clear_both'><a class='discussion_action_link response_link' id='#{response.id}' href='#'>Post Comment</a></span>
            <div class='comment_form_div'>
            <form method='post' data-remote='true' action='discussions/post_comment_responses'>
              <textarea class='post_comment_text_area float_l clear_both' id='response_comment_comment'></textarea>
              <input type='hidden' value='#{response.id}' name='response_comment[parent_id]' id='response_comment_parent_id'>
              <input class='blue_btn clear_both float_l' type='submit' value='Post Comment'/>
              <a class='action_link no_text_deco float_l cancel_link' href='#'>Cancel</a>
            </form>
            </div>
          </div>
        </div>
      </div>
    </div>"
      if response.children.present?
        erg +="<div class='comments_div' style='display:block;'>"
        response.children.each{|child| erg +="#{createCommentsTree(child)}" }
        erg +="</div>"
      end
    return erg
  end

end
