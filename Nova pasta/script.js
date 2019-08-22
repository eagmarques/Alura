$(document).ready(function(){

var speed = 4000;
     
var item_width = $('.first').outerWidth();


console.log(item_width);


    $(".backCarousel").click(function(){

        var posicao = parseInt($('.vitrineProdutos').css('left'));
        var left_intend = parseInt($('.vitrineProdutos').css('left')) + item_width;
        
        console.log(posicao);
        $('.vitrineProdutos').animate({'left':left_intend}, 200);
       

        if (posicao == -17780){

            $(".backCarousel").attr("disabled",true);
        
        } else {
            $(".backCarousel").attr("disable",false);
            posicao += left_intend;
            }
        })
  

    $(".nextCarousel").click(function(){

        var rigth_intend = parseInt($('.vitrineProdutos').css('left')) - item_width;
        
        $('.vitrineProdutos').animate({'left':rigth_intend}, 150);
        })
})


