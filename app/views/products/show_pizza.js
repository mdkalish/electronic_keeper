pizza_div = $("#orders");
pizza_div.html( "<%= j render( :partial => 'pizzas/pizza', :locals => { :pizza => @pizza } ) %>" );
