# Electronic Keeper 

**Electronic Keeper** (EK) is a tool targeted at small-to-medium enterprises, designed for use by the lowest-rank workers, largely computer-illiterate, therefore intuitive GUI is king.


## Contents

* [**Modules Description & Mockup**](#modules-description--mockup)  
  - [Production Module](#production-module)  
    - [Create New Ticket Screen](#create-new-ticket-screen)  
    - [Tickets in Production Screen](#tickets-in-production-screen)  
  - [Online Sales](#more-modules)
  - [Stock](#more-modules)
  - [Sales History](#more-modules)
* [**Requirements**](#requirements)  
  

## Modules Description & Mockup

This section describes application functionality.


### Production Module

Production module is designed for taking orders for goods and services to render, i.e. kitchen in a restaurant,  counter at mechanics or barbershop, cashier at a store, etc. 


####Create new ticket screen

![create_new_ticket.png](https://github.com/mdkalish/electronic_keeper/blob/master/interface_schemas/production_module/create_new_ticket.png "Create new ticket screen")
  
| OBJECT							| TYPE		| DESCRIPTION |  
|:-------------------------|:---------	|:--------- |  
| **NAVBAR\_1**				|	**DIV**	| **Constant element, present on all screens** |  
| Work\_online\_CHECKBOX	|	CHECKBOX	| Unchecked by default; when checked, program syncs in real-time with the server; when unchecked, program operates on local db |    
| SYNCHRONIZE					|	BUTTON	| Active when Work\_online\_CHECKBOX is unchecked; sync manually with the server |  
| CLOCK							|	DISPLAY	| Show date/time |    
| HISTORY						|	BUTTON 	| Go to History screen to see closed tickets |  
| TICKETS\_IN\_PRODUCTION	|	BUTTON	| Go to Tickets in production screen to see created opened tickets |  
| CREATE\_NEW\_TICKET:		|	BUTTON	| Go to Create new ticket screen (current location so inactive) |  
|									|				| |  
| **MENU\_DIV\_1**			|	**DIV**	| **Element specific to Create new ticket screen** |  
| product\_category:			|	BUTTON	| Button with a category name, e.g. 'pizzas', 'overnight services', etc. Picking a category calls requested products to product\_name buttons |  
| product_name:				|	BUTTON	| Button with a product/service name, e.g. 'pizza margherita', 'replace Macpherson strut', etc. |
|									|				| |  
| **MENU\_DIV\_2**			|	**DIV**	| **Element specific to Create new ticket screen. Same as MENU_DIV_1. Added here for user's convenience, e.g. when some products are requested frequently, but belong to different categories, e.g. 'pizza margherita' and 'coca-cola', or 'replace Macpherson strut' and 'general tune up'** |  
|									|				| |  
| **CURRENT\_TICKET\_DIV**	|	**DIV**	| **Element specific to Create new ticket screen** |  
| X								|	BUTTON	| Button for removing adjacent record |  
| no. product\_name			|	DISPLAY	| Shows product\_name; appears here when product\_name button in MENU\_DIV\_1 is clicked |  
| quantity						|	DISPLAY	| Shows ordered quantity, works as follows: n clics on product_name button adds n quantity, m clicks on X button substracts m quantity |  
| unit\_price					|	DISPLAY	| Shows product's unit price |  
| qty\_x\_up					|	DISPLAY	| Shows value: quantity times unit price |  
| DATE\_TIME					|	DISPLAY	| Shows current date/time |  
| CREATE\_BUTTON				|	BUTTON	| Button for creating the ticket; on clicking, the ticked with current date/time goes to Tickets in production screen and from there to CURRENT\_TICKETS\_SUMMARY\_DIV, while CURRENT\_TICKET\_DIV gets cleared |  
| $TOTAL							|	DISPLAY	| Field with summed up qty_x_up values |  
| DELIVERY\_ADDRESS\_FIELD	|	INPUT		| Input field with the delivery address (as everything else loaded from a DB without clients' name - re GIODO) |  
| HOME\_CHECKBOX				|	CHECKBOX	| Checkbox marked by default, means that no delivery is requested - client is collecting in person |  
| TICKET\_NUMBER\_FIELD		|	DISPLAY	| Field with non-unique ticket number, reset daily |  
|									|				| |  
| **CURRENT\_TICKETS\_SUMMARY\_DIV**	|	**DIV**	| **Element specific to Create new ticket screen** |  
| ticket\_no					|	BUTTON	| Button link to the ticket in Tickets in production screen |  
| $TOTAL, TAKE TIME, ...	|	DISPLAY	| Field with the ticket summary: $ TOTAL, TAKE TIME (time created), HOME/DELIV (whether colletion is here or with delivery) |  
|									|				| |  
| **BOTTOM\_BAR**				|	**DIV**	| **Constant element, present on all screens** |  
| LOGGED\_IN\_AS				|	DISPLAY	| Field showing who is taking orders |  
| TOTAL\_TICKETS\_IN\_PRODUCTION	|	DISPLAY	| Field with a number of opened tickets available for review in Tickets in production screen |  
| TICKETS\_CREATED/CLOSED	|	DISPLAY	| Field showing number of created(with opened)/closed tickets |  
| DAILY\_TURNOVER				|	DISPLAY	| Field showing the daily $TOTAL |  
  
  
#### Tickets in production screen

Screen for viewing opened orders.  
Tickets seen here are editable only after double confirmation.  

![tickets_in_production.png](https://github.com/mdkalish/electronic_keeper/blob/master/interface_schemas/production_module/tickets_in_production.png "Tickets in production screen")

| OBJECT							| TYPE		| DESCRIPTION |  
|:-------------------------|:---------	|:--------- |  
| **NAVBAR\_1**				|	**DIV**	| **Constant element, present on all screens** |  
| Work\_online\_CHECKBOX	|	CHECKBOX	| Unchecked by default; when checked, program syncs in real-time with the server; when unchecked, program operates on local db |    
| SYNCHRONIZE					|	BUTTON	| Active when Work\_online\_CHECKBOX is unchecked; sync manually with the server |  
| CLOCK							|	DISPLAY	| Show date/time |    
| HISTORY						|	BUTTON 	| Go to History screen to see closed tickets |  
| TICKETS\_IN\_PRODUCTION	|	BUTTON	| Go to Tickets in production screen to see created opened tickets |  
| CREATE\_NEW\_TICKET		|	BUTTON	| Go to Create new ticket screen (current location so inactive) |  
|									|				| |  
| **TICKET\_NO\_DIV**		|	**DIV**	| **Element specific to Tickets in production screen** |  
| no. product\_name			|	DISPLAY	| Shows product_name |  
| quantity						|	DISPLAY	| Shows ordered quantity |  
| unit\_price					|	DISPLAY	| Shows product's unit price |  
| qty\_x\_up					|	DISPLAY	| Shows value: quantity times unit price |  
| EDIT\_TICKET					|	BUTTON	| Button for editing the ticket, activated by checking EDIT? checkbox |  
| TAKE\_TIME					|	DISPLAY	| Shows how long the ticket is open |  
| $TOTAL							|	DISPLAY	| Shows summed up qty_x_up values |  
| EDIT?							|	CHECKBOX | Needs to be checked prior to clicking EDIT\_TICKET button for editing the ticket |  
| DELIVERY\_ADDRESS\_FIELD	|	DISPLAY	| Shows delivery address |  
| TICKET\_NUMBER\_FIELD		|	DISPLAY	| Shows non-unique ticket number, reset daily |  
|									|				| |  
| **UP/DOWN arrows**			|**BUTTON**	|	Buttons for scrolling the screen (placed on the left and right of the BOTTOM\_BAR) |  
|									|				| |  
| BOTTOM\_BAR					|	**DIV**	| Constant element, present on all screens |  
| LOGGED\_IN\_AS				|	DISPLAY	| Shows who is taking orders |  
| TOTAL\_TICKETS\_IN\_PRODUCDION	| DISPLAY | Field with a number of opened tickets available for review in Tickets in production screen |  
| TICKETS\_CREATED/CLOSED	|	DISPLAY	| Shows number of created(with opened)/closed tickets |  
| DAILY\_TURNOVER				|	DISPLAY	| Shows the daily $TOTAL |  
  

### More modules  
Information on modules Online sales, Stock, Sales history, and more will be added later in development stage.  


## Requirements

 - While writing in Ruby, please follow the [Community-driven ruby coding style guide](https://github.com/bbatsov/ruby-style-guide)  
 - [Workflow requirements](https://www.atlassian.com/git/workflows#!workflow-feature-branch)
  
