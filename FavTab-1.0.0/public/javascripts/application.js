// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function printError(targetAreaId,errorMsg){
  document.getElementById(targetAreaId).innerHTML= "<span class='error'>"+errorMsg+"</span>" ;
}

  function set_effects()
  {

    jQuery('.comment_link,.response_link, .cancel_link,.toggle_comment,.cancel_edit_link').unbind('click');
    /* UI Functionality */
    jQuery(".comment_link").click(function(){
      var current_link = jQuery(this);
      jQuery("#comment_discussion_id").val(jQuery(this).attr("id"));
      if(current_link.html()=="Post Comment")
      {
        current_link.parent().parent().children(".comment_form_div").slideDown();
        current_link.parent().hide();
        //current_link.next().slideDown();
      }
      else
      {
        current_link.parent().parent().children(".comment_form_div").slideUp();
        current_link.show();
      }
      return false;
    });


     /* For  response comment*/
     jQuery(".response_link").click(function(){
      var current_link = jQuery(this);
      if(current_link.html()=="Post Comment")
      {
        current_link.parent().parent().children(".comment_form_div").slideDown();
        current_link.parent().hide();
        //current_link.next().slideDown();
      }
      else
      {
        current_link.parent().parent().children(".comment_form_div").slideUp();
        current_link.show();
      }
      return false;
    });
    jQuery(".cancel_link").click(function(){
      var current_link = jQuery(this);
      current_link.parent().slideUp(function(){
        current_link.parent().prev().show();
      });
      return false;
    });
    jQuery(".toggle_comment").click(function(){
      var current_ex_btn = jQuery(this);

      current_ex_btn.parent().parent().children(".comments_div").css('padding-left','10px').toggle();

      if(current_ex_btn.hasClass("expand_btn"))
      {
        current_ex_btn.removeClass("expand_btn").addClass("collapse_btn");
      }
      else if(current_ex_btn.hasClass("collapse_btn"))
      {
        current_ex_btn.removeClass("collapse_btn").addClass("expand_btn");
      }
      return false;
    });
    jQuery(".edit_comment_link").click(function(){
      var current_link = jQuery(this);
      var current_comment_text = current_link.parent().parent().parent().children(".comment_text");
      current_link.parent().parent().parent().children(".edit_comment_div").show();
      current_link.parent().parent().parent().children(".edit_comment_div").children("form").children(".post_comment_text_area").html(current_comment_text.html());
      current_comment_text.hide();
      current_link.parent().hide();
      return false;
    });

    jQuery(".cancel_edit_link").click(function(){
      var current_link = jQuery(this);
      current_link.parent().slideUp(function(){
        current_link.parent().prev(".comment_text").show();
        current_link.parent().parent().children(".post_comment_div").children("span").show();

      });
      return false;
    });

     
  }



  var curr_object = null;
  var is_sending = false;
  function post_comment(form_id,d_id,cur_obj)
  {
    curr_object = cur_obj;
    if(!is_sending)
    {
        is_sending = true;
        cur_obj.parent().parent().children("#"+form_id).submit();
    }
    //jQuery("#"+form_id).submit();
    /*jQuery.get('/load_comments/'+d_id, function(data) {
     jQuery("#"+form_id).parent().parent().parent().parent().children(".comments_div").html(data);
     jQuery("#"+form_id).parent().hide();
     jQuery("#"+form_id).parent().prev().children(".comment_link").show("");
    });*/
  }


  var curr_object = "";

  function update_comment_response(curr_obj)
  {
    curr_object = curr_obj;
    curr_obj.parent().parent().children("form").submit();

  }

  function delete_comment(curr_obj, cid)
  {
    var answer = confirm("Are you sure, you want to delete comment?")
    if(answer)
    {
        curr_object = curr_obj;
        jQuery.get('/delete_comment/'+cid, function(data){
          if(data=="Success")
          {
            var current = curr_object.parent().parent().parent().parent().parent().parent().parent();
            curr_object.parent().parent().parent().parent().parent().remove();
            if(current.children(".comments_div").children("div").length==0)
            {
                current.children("div:first-child").find(".toggle_comment").removeClass("collapse_btn").removeClass("expand_btn");
                current.children(".comments_div").hide();
            }
            display_flash_message("Comment deleted successfully.");
           }
           else
           {
            alert("Comment can't be deleted.")
           }
        });
    }
    return false;
  }

  function post_comment_response(curr_obj)
  {
    curr_object = curr_obj;
    if(!is_sending)
    {
        is_sending = true;
        curr_obj.parent().parent().children("form").submit();
    }

  }


//For deleting discussion
function delete_discussion(d_id,cur_obj)
  {
    var answer = confirm("Are you sure, you want to delete discussion?");
    if(answer)
    {
        jQuery.get('/delete_discussion/'+d_id,function(data){
          if(data=="Success")
          {
            cur_obj.parent().parent().parent().parent().parent().remove();
            display_flash_message("Discussion deleted successfully.");
          }
          else
          {
            alert("Discussion could not  deleted please try again.")
          }
        });
    }
    return false;
  }


function apply_scroll_effects()
  {
    jQuery(".url_block, .normal_url_block,.search_results_scrolled_div").hover(function(){
      jQuery(this).css("overflow","auto");
      jQuery(this).scrollTop(jQuery(this).data("top_pos"));

    },function(){
      jQuery(this).css("overflow","hidden");
      jQuery(this).data("top_pos",jQuery(this).scrollTop());
    });

  }

function apply_scroll_effect_to(div_class)
  {
    jQuery("."+div_class).hover(function(){
      jQuery(this).css("overflow","auto");
      jQuery(this).scrollTop(jQuery(this).data("top_pos"));

    },function(){
      jQuery(this).css("overflow","hidden");
      jQuery(this).data("top_pos",jQuery(this).scrollTop());
    });

  }




//Created by: Jalendra Bhanarkar
//For displaying flash message
function display_flash_message(msg)
{
	jQuery("#flash_message_popup").find(".pop_up_message").html(msg);
	jQuery("#flash_message_popup .pop_up").css({"position":"fixed","top":(jQuery(window).height()-jQuery("#flash_message_popup .pop_up").height())/2+"px"});   
    	jQuery("#flash_message_popup .pop_up").css({"position":"fixed","left":(jQuery(window).width()-jQuery("#flash_message_popup .pop_up").width())/2+"px"});
	jQuery("#flash_message_popup").fadeIn();
	var t=setTimeout("jQuery('#flash_message_popup').fadeOut();",3000)
}


 function expand_user_comment_tree(curr_obj)
  {
    if(curr_obj.hasClass("root_div"))
    {
      if(curr_obj.children(":first").children("a").hasClass("toggle_comment"))
      {
        curr_obj.children(":first").children("a.toggle_comment").removeClass("expand_btn").addClass("collapse_btn");
      }
      return;
    }
    else
    {
      if(!is_first_node)
      {
        curr_obj.show();
        if(curr_obj.hasClass("comments_div"))
        {
          curr_obj.css('padding-left','10px');
        }
        if(curr_obj.children(":first").children("a").hasClass("toggle_comment"))
        {
          curr_obj.children(":first").children("a").removeClass("expand_btn").addClass("collapse_btn");
        }
      }
      is_first_node= false;
      expand_user_comment_tree(curr_obj.parent());
    }

  }



function add_to_group(user_id)
   {
      jQuery.get("/add_to_group/"+user_id,function(data){
        //alert(data);
        jQuery("body").append(data);
        jQuery("#add_to_group_popup").fadeIn();
        jQuery("#add_to_group_popup #user_id").val(user_id);
      });
   }
function check_add_to_group_form()
    {
    if(jQuery("#add_to_group_rows").find("input[type='checkbox']:checked:not(:disabled)").length==0)
    {
      jQuery("#add_to_form_error").html("Please select at least one group.");
      return false;
    }
  }

function show_discussion(d_id)
{
    toggle_ajax_loader();
    jQuery.get("/show_discussion/"+d_id,function(data){
      toggle_ajax_loader();
      jQuery("body").append(data);
      
    });
}

function toggle_ajax_loader()
{
    if(!jQuery("#ajax_loader").is(":visible"))
    {
        jQuery("#ajax_loader").show();
        jQuery("#ajax_loader .pop_up").center();
     /*

     jQuery("#ajax_loader .pop_up").css({
        "position":"fixed",
        "top":(jQuery(window).height()-jQuery("#ajax_loader .pop_up").height())/2+"px"
        });
    jQuery("#ajax_loader .pop_up").css({
        "position":"fixed",
        "left":-(jQuery("#ajax_loader .pop_up").width())+"px"
        });
    jQuery("#ajax_loader").show();

    jQuery("#ajax_loader .pop_up").animate({
        "position":"fixed",
        "left":(jQuery(window).width()-jQuery("#ajax_loader .pop_up").width())/2+"px"
        },500);
        */
    }
    else
    {
        jQuery("#ajax_loader").hide();
        /*jQuery("#ajax_loader .pop_up").animate({
            "left":(jQuery(window).width()+jQuery("#ajax_loader .pop_up").width())+"px"
            },500,function(){
            jQuery("#ajax_loader").hide();
        });*/
    }
}