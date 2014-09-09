# Electronic Keeper 

**Electronic Keeper** (EK) is a tool targeted at small-to-medium enterprises, designed for use of the lowest-rank workers, largely computer-illiterate, therefore intuitive GUI is king.

___

##CONTENTS:

###1.		"Electronic Keeper" specifications :
  -		Synopsis  
  -		Description  
  -		Modules:
     - Production module:
     - – Create new ticket screen
     - – Tickets in production screen

###2.		Collaborators:  
 -		Contributors  
 -		Roles in the project  
 -		Relevant skills by contributor  
 -		Benefits to contributors  
 -		Testing and implementation subjects  

###3. Why Bluefish text editor (.bf)?  
 - Main reasons
 - Other features  
  
___
  

  
    
#1. "Electronic Keeper" specifications.
Software built solely with freeware tools.
Used tools:  
 - gliffy.com  
  
  
##Synopsis:  

"Electronic Keeper" (EK) is a modular tool that helps medium-to-small enterprises run their daily tasks in a transparent and orderly manner. 


##Description:

EK is targeted at small-to-medium enterprises, designed for use by the lowest-rank workers, largely computer-illiterate, therefore intuitive GUI prepared for touchscreens is king.
EK is built in modules:
- production
- online sales
- stock
- sales history


##Modules:

Modules can operate independently from one another.


###Production module:

Production module is designed for taking orders for goods and services to render, i.e. kitchen in a restaurant,  counter at mechanics or barbershop, cashier at a store, etc. 


####Create new ticket screen:

Review with /interface_schemas/production_module/create_new_ticket.png.  
Screen for creating new tickets by picking products from menu.  
  
| Object							| Type		| Description |  
|:-------------------------|:---------	|:--------- |  
| **NAVBAR\_1**				|	DIV		| Constant element, present on all screens |  
| Work\_online\_CHECKBOX	|	CHECKBOX	| Unchecked by default; when checked, program syncs in real-time with the server; when unchecked, program operates on local db |    
| SYNCHRONIZE					|	BUTTON	| Active when Work\_online\_CHECKBOX is unchecked; sync manually with the server |  
| CLOCK							|	DISPLAY	| Show date/time |    
| HISTORY						|	BUTTON 	| Go to History screen to see closed tickets |  
| TICKETS\_IN\_PRODUCTION	|	BUTTON	| Go to Tickets in production screen to see created opened tickets |  
| CREATE\_NEW\_TICKET:		|	BUTTON	| Go to Create new ticket screen (current location so inactive) |  
| Object							| Type		| Description |  
|:-------------------------|:---------	|:--------- |  
| **MENU\_DIV\_1**			|	DIV		| Element specific to Create new ticket screen |  
| product_category:			|	BUTTON	| Button with a category name, e.g. 'pizzas', 'overnight services', etc. Picking a category calls requested products to product\_name buttons |  
| product_name:				|	BUTTON	| Button with a product/service name, e.g. 'pizza margherita', 'replace Macpherson strut', etc. |  
| Object							| Type		| Description |  
|:-------------------------|:---------	|:--------- |
| **MENU\_DIV\_2**			|	DIV		| Element specific to Create new ticket screen. Same as MENU_DIV_1. Added here for user's convenience, e.g. when some products are requested frequently, but belong to different categories, e.g. 'pizza margherita' and 'coca-cola', or 'replace Macpherson strut' and 'general tune up' |  
| Object							| Type		| Description |  
|:-------------------------|:---------	|:--------- |  
| **CURRENT\_TICKET\_DIV**	|	DIV		| Element specific to Create new ticket screen |  
| X								|	BUTTON	| Button for removing adjacent record |  
| no. product_name			|	DISPLAY	| Shows product_name; appears here when product\_name button in MENU\_DIV\_1 is clicked |  
| quantity						|	DISPLAY	| Shows ordered quantity, works as follows: n clics on product_name button adds n quantity, m clicks on X button substracts m quantity |  
| unit\_price:					|	DISPLAY	| Shows product's unit price |  
| qty\_x\_up:					|	DISPLAY	| Shows value: quantity times unit price |  
| DATE\_TIME:					|	DISPLAY	| Shows current date/time |  
| CREATE\_BUTTON:				|	BUTTON	| Button for creating the ticket; on clicking, the ticked with current date/time goes to Tickets in production screen and from there to CURRENT\_TICKETS\_SUMMARY\_DIV, while CURRENT\_TICKET\_DIV gets cleared |  
| $TOTAL:						|	DISPLAY	| Field with summed up qty_x_up values |  
| DELIVERY\_ADDRESS\_FIELD	|	INPUT		| Input field with the delivery address (as everything else loaded from a DB without clients' name - re GIODO) |  
| HOME_CHECKBOX:				|	CHECKBOX	| Checkbox marked by default, means that no delivery is requested - client is collecting in person |  
| TICKET\_NUMBER\_FIELD		|	DISPLAY	| Field with non-unique ticket number, reset daily |  
___  
- CURRENT_TICKETS_SUMMARY_DIV: 	Element specific to Create new ticket screen
--	ticket_no:						Button link to the ticket in Tickets in production screen  
-- $TOTAL, TAKE TIME, ...		Field with the ticket summary: $ TOTAL, TAKE TIME (time created), HOME/DELIV (whether colletion is here or with delivery)  

- BOTTOM\_BAR:	Constant element, present on all screens  
--	LOGGED\_IN\_AS:					Field showing who is taking orders  
--	TOTAL\_TICKETS\_IN\_PROD...:	Field with a number of opened tickets available for review in Tickets in production screen  
-- TICKETS\_CREATED/CLOSED:		Field showing number of created(with opened)/closed tickets  
--	DAILY\_TURNOVER:				Field showing the daily $TOTAL  

___
  
####Tickets in production screen

Review with /interface_schemas/production_module/tickets_in_production.png.  
Screen for viewing opened orders.  
Tickets seen here are editable only after double check.  

-	NAVBAR\_1:	Constant element, present on all screens  
--		Work\_online\_CHECKBOX:	Unchecked by default; when checked, program syncs in real-time with the server; when unchecked, program operates on local db  
--		SYNCHRONIZE button:		Active when Work\_online\_CHECKBOX is unchecked; sync manually with the server  
--		CLOCK:						Date and time  
--		HISTORY:						Go to History screen to see closed tickets  
--		TICKETS\_IN\_PRODUCTION:	Go to Tickets in production screen to see created opened tickets  
--		CREATE\_NEW\_TICKET:		Go to Create new ticket screen (current location so inactive)  
  
- TICKET\_NO\_DIV:	Element specific to Tickets in production screen  
--	no. product_name:				Field with product_name  
-- quantity:						Field with ordered quantity  
--	unit_price:						Field with product's unit price  
--	qty_x_up:						Field with the value: quantity times unit price  
--	EDIT\_TICKET:					Button for editing the ticket, activated by checking EDIT? checkbox  
--	TAKE\_TIME:						Field with the ticket creation date/time  
--	$TOTAL:							Field with summed up qty_x_up values  
-- EDIT?:							Checbox that needs to be checked prior to clicking EDIT\_TICKET button for editing the ticket  
--	DELIVERY\_ADDRESS\_FIELD:		Field with the delivery address  
--	TICKET\_NUMBER\_FIELD			Field with non-unique ticket number, reset daily  
  
- UP/DOWN arrows:					Buttons for scrolling the screen (placed on the left and right of the BOTTOM\_BAR)  
  
- BOTTOM\_BAR:	Constant element, present on all screens  
--	LOGGED\_IN\_AS:					Field showing who is taking orders  
--	TOTAL\_TICKETS\_IN\_PROD...:	Field with a number of opened tickets available for review in Tickets in production screen  
-- TICKETS\_CREATED/CLOSED:		Field showing number of created(with opened)/closed tickets  
--	DAILY\_TURNOVER:				Field showing the daily $TOTAL  
  
___  
  
#2. Collaborators:


##Contributors:

 - jeltz  
 - mateo  
 - wafcio  
 - wunderbart  


##Roles in the project (please propose your engagement yourself):

 - jeltz:			tba  
 - mateo:			project owner, implementator, manager, programmist, learner  
 - wafcio:			tba  
 - wunderbart:		professional advisor (RoR, JavaScript, CoffeeScript, CSS, SQL, HTML)  


##Relevant skills by contributor (please self-assess):  

 - jeltz:  
 - mateo:			RoR beginner; git beginner; Python, SQL, CSS, HTML, JavaScript  - intermediate  
 - wafcio:  
 - wunderbart:		RoR, JavaScript, CoffeeScript, CSS, SQL, HTML professional  
  

##Benefits to contributors (please propose yourself):

 - jeltz:			tba (share of potential revenue?)  
 - mateo:			mainly what I learn; maybe c 20% of potential revenue (tba); printscreens and results from implementation may be used in my Master's thesis (without any code!)  
 - wafcio:			tba (share of potential revenue?)  
 - wunderbart:		tba (share of potential revenue?)  

##Testing and implementation subjects:
  
Befriended subject(s) for testing and implementation:  
Kuznia cafe & pizza, ul. Orzeska 78, Ornontowice, pizzeriakuznia.pl

___
  
#3. Why Bluefish text editor (.bf):

##Meain reasons:  
 - free, GPL, Open source  
 - Cross-platform: Windows, OS X, Linux, BSD, Unix, OpenVMS  
 - Text editor support for newline character sequence support: Windows (CR/LF), Unix (including OS X) (LF), Mac OS (CR)  

###Other features:  
 - docs interface support: Multiple instances, Single document window splitting, MDI: overlappable windows, MDI: tabbed document interface  
 - Text editor support for basic editing features: Spell checking, Regex-based find & replace, Encoding conversion, Newline conversion, Multiple undo/redo, NO: Rectangular block selection  
 - Text editor support for programming features (see source code editor): Syntax highlighting, NO: Function list, Symbol database (ctags or equiv.), Brace matching, Auto indentation, Auto completion, Code folding, NO: Text folding, Compiler integration  
 - Text editor support for other programming features: NO: Text shell integration, Graphical shell integration, ?: Macro language, Collaborative editing, ?: Large file support, ?: Long line support, Multi-line regex support, ?: Search in files  
 - Text editor support for remote file editing over Internet Protocols: FTP, HTTP, SSH, WebDAV  
 - Text editor support for some of the most common character encodings: ASCII, ISO-8859, DOS (OEM), EBCDIC, UTF-8, UTF-16  
 - Right to left (RTL) & bidirectional (bidi) support: Right-to-left (RTL), Bi-directional (Bidi)  
  
Source: [Wikipedia](http://en.wikipedia.org/wiki/Comparison_of_text_editors)  