(function(jQuery){
  var $ = jQuery;

  list_columns = function(list, col_size){
    var proxy_list  = [];
    var col_count   = Math.ceil(proxy_list.length / col_size);
    var columns     = $('<div class="proxy_list" />');

    var shift_li    = function(){
                        if (proxy_list.length > 0){
                          var lc = $('<ul class="list_col" />');
                          for (var i = 0 ; i < col_size ; i++){
                            lc.append(proxy_list.shift());
                          }
                          $(columns).append(lc);
                          shift_li();
                        }else{
                          return false;
                        }
                      };

    $(list).find('li').each(function(){
      proxy_list.push(this);
    });
    shift_li();
    $(columns).insertAfter($(list));
    $(list).hide();

  };

})(jQuery);
