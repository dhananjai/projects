function close_all()
{
    jQuery("#everything_conatiner").remove();
    jQuery("#tabitt_images_container").remove();
}
var site_url = "http://ec2-50-17-236-75.compute-1.amazonaws.com/"
//var site_url = "http://192.168.1.72:4000"

function add_image_to_tabitt(x)
{
    img_url = encodeURIComponent(x.parent().find("img").attr("src"));
    var url = site_url+"/add_photos_from_site?photo_url="+img_url+"&site_url="+window.location.href;
    newwindow = window.open(url,'name','height=400,width=380,status=no,resizable=no,scrollbars=yes,personalbar=no,directories=no,location=no,toolbar=no,menubar=no');
	if (window.focus) {newwindow.focus()}
	return false;
    
}
var $outer_div = jQuery("<div style='margin-top:50px;z-index:9999;width:100%;height:100%;position:absolute;top:0;left:0;padding-left: 55px;' id='tabitt_images_container'></div>");
var $overlay= jQuery("<div id='everything_conatiner'><div id='tabitt_overlay' align='center' style='width:100%;height:100%;background:#292727;position:fixed;z-index:9999;top:0;left:0'></div><div style='position:fixed;top:5px;display:block;z-index:99999;width:100%;height:50px;background:#ACCBDE;margin: -5px 0 0 -7px;' align='center'><a href='javascript:void(0);' onclick='close_all();' style='font-size:14px;color:white;top:0;font-weight:bold;text-decoration:none;background:red;border-radius:5px;width:150px;height:20px;padding:10px;display:block;border-radius:5px;'>Close</a></div></div>")
jQuery("body").append($overlay);
jQuery("body").append($outer_div);
var is_img_found = false;
jQuery("img").each(function(v,i){
       jQuery(this).removeAttr("width");
       jQuery(this).removeAttr("height");
       if((jQuery(this).width()>150 || jQuery(this).height>150) && (jQuery(this).attr("src") || jQuery(this).attr("data-src")))
       {
        $img_c =jQuery("<div style='position:relative;display:block;margin:5px;padding:10px;background:#AFC9D5;float:left;width:200px;height:200px;border:1px solid #D4E5EE'></div>");
        $add_to_tabitt = "<a class='add_to_tabitt_link' href='javascript:void(0);' style='position:absolute;top:90px;display:block;width:198px;height:20px;color:white;text-decoration:none;text-align:center;background-color:#3D8DB6;-moz-border-radius:5px;padding-top:5px;z-index:99999;' onclick='add_image_to_tabitt(jQuery(this));' >Grab</a>";
        $img = jQuery(this).clone();
        $img.css({'margin':'0px','padding':'0px'});
        $img.width("198px");
        $img.height("198px");
        if((!$img.attr("src") || $img.attr("src")=="") && ($img.attr("data-src") || $img.attr("data-src")!=""))
        {
            $img.attr("src",jQuery(this).attr("data-src"));
        }
        if((!$img.attr("src").match("http://")) && !$img.attr("src").match("data:image"))
        {
            var l= location.href
            l = l.substr(0,l.indexOf("/",10));
            $img.attr("src",l+"/"+$img.attr("src"));
        }
        $form = jQuery("<div style='display:none'><form action='"+site_url+"add_photo' method='POST'><input type='text' name='photo_url' value='"+$img.attr('src')+"' /></form></div>");
        if($img.attr("src").length<1000)
        {
            $img_c.append($img);
            $img_c.append($form);
            $img_c.append($add_to_tabitt);
            jQuery("#tabitt_images_container").append($img_c);
            /*$img_c.hover(function(){
                jQuery(this).find(".add_to_tabitt_link").show();
                },function(){
                jQuery(this).find(".add_to_tabitt_link").hide();
            });*/
            is_img_found = true;
        }
        }
});

if(!is_img_found)
{
    alert("Sorry no large image found.");
}
