# Electronic Keeper 

**Electronic Keeper** (EK) is a tool targeted at small-to-medium enterprises, designed for use of the lowest-rank workers, largely computer-illiterate, therefore intuitive GUI is king.

#################################################

CONTENTS:

1.		"Electronic Keeper" specifications
1.1.		Synopsis
1.2.		Description
1.3.		Modules
1.3.1.		Production module
1.3.1.1.			Create new ticket screen
1.3.1.2.			Tickets in production screen

2.		Collaborators:
2.1.		Contributors
2.2.		Roles in the project
2.3.		Relevant skills by contributor
2.4.		Benefits to contributors
2.5.		Testing and implementation subjects

3. Why Bluefish text editor (.bf)?

#################################################

1. "Electronic Keeper" specifications.
Software built solely with freeware tools.
Used tools:
- gliffy.com


1.1. Synopsis:

"Electronic Keeper" (EK) is a modular tool that helps medium-to-small enterprises run their daily tasks in a transparent and orderly manner. 


1.2. Description:

EK is targeted at small-to-medium enterprises, designed for use by the lowest-rank workers, largely computer-illiterate, therefore intuitive GUI prepared for touchscreens is king.
EK is built in modules:
- production
- online sales
- stock
- sales history


1.3. Modules:

Modules can operate independently from one another.


1.3.1. Production module:

Production module is designed for taking orders for goods and services to render, i.e. kitchen in a restaurant,  counter at mechanics or barbershop, cashier at a store, etc. 


1.3.1.1.			Create new ticket screen:

Review with /interface_schemas/production_module/create_new_ticket.png
Screen for creating new tickets by picking products from menu.

-	NAVBAR_1:	Constant element, present on all screens
--		Work_online_CHECKBOX:	Unchecked by default; when checked, program syncs in real-time with the server; when unchecked, program operates on local db
--		SYNCHRONIZE button:		Active when Work_online_CHECKBOX is unchecked; sync manually with the server
--		CLOCK:						Date and time
--		HISTORY:						Go to History screen to see closed tickets
--		TICKETS_IN_PRODUCTION:	Go to Tickets in production screen to see created opened tickets
--		CREATE_NEW_TICKET:		Go to Create new ticket screen (current location so inactive)

- MENU_DIV_1:	Element specific to Create new ticket screen
--		product_category:			Button with a category name, e.g. 'pizzas', 'overnight services', etc. Picking a category calls requested products to product_name buttons
--		product_name:				Button with a product/service name, e.g. 'pizza margherita', 'replace Macpherson strut', etc.

- MENU_DIV_2:	Element specific to Create new ticket screen
The same as MENU_DIV_1, added here for user's convenience, e.g. when some products are requested frequently, but belong to different categories, e.g. 'pizza margherita' and 'coca-cola', or 'replace Macpherson strut' and 'general tune up'

- CURRENT_TICKET_DIV:	Element specific to Create new ticket screen
--	X:									Button for removing adjacent record
--	no. product_name:				Field with product_name; appears here when product_name button in MENU_DIV_1 is clicked
-- quantity:						Field with ordered quantity, works as follows: n clics on product_name button adds n quantity, m clicks on X button substracts m quantity
--	unit_price:						Field with product's unit price
--	qty_x_up:						Field with the value: quantity times unit price
--	DATE_TIME:						Field with current date/time
--	CREATE_BUTTON:					Button for creating the ticket; on clicking, the ticked with current date/time goes to Tickets in production screen and from there to CURRENT_TICKETS_SUMMARY_DIV, while CURRENT_TICKET_DIV gets cleared
--	$TOTAL:							Field with summed up qty_x_up values
--	DELIVERY_ADDRESS_FIELD:		Field with the delivery address (as everything else loaded from a DB without clients' name - re GIODO)
---	HOME_CHECKBOX:				Checkbox marked by default, means that no delivery is requested - client is collecting in person
--	TICKET_NUMBER_FIELD			Field with non-unique ticket number, reset daily

- CURRENT_TICKETS_SUMMARY_DIV: 	Element specific to Create new ticket screen
--	ticket_no:						Button link to the ticket in Tickets in production screen
-- $TOTAL, TAKE TIME, ...		Field with the ticket summary: $ TOTAL, TAKE TIME (time created), HOME/DELIV (whether colletion is here or with delivery)

- BOTTOM_BAR:	Constant element, present on all screens
--	LOGGED_IN_AS:					Field showing who is taking orders
--	TOTAL_TICKETS_IN_PROD...:	Field with a number of opened tickets available for review in Tickets in production screen
-- TICKETS_CREATED/CLOSED:		Field showing number of created(with opened)/closed tickets
--	DAILY_TURNOVER:				Field showing the daily $TOTAL


1.3.1.2.			Tickets in production screen

Review with /interface_schemas/production_module/tickets_in_production.png
Screen for viewing opened orders.
Tickets seen here are editable only after double ckeck.

-	NAVBAR_1:	Constant element, present on all screens
--		Work_online_CHECKBOX:	Unchecked by default; when checked, program syncs in real-time with the server; when unchecked, program operates on local db
--		SYNCHRONIZE button:		Active when Work_online_CHECKBOX is unchecked; sync manually with the server
--		CLOCK:						Date and time
--		HISTORY:						Go to History screen to see closed tickets
--		TICKETS_IN_PRODUCTION:	Go to Tickets in production screen to see created opened tickets
--		CREATE_NEW_TICKET:		Go to Create new ticket screen (current location so inactive)

- TICKET_NO_DIV:	Element specific to Tickets in production screen
--	no. product_name:				Field with product_name;
-- quantity:						Field with ordered quantity
--	unit_price:						Field with product's unit price
--	qty_x_up:						Field with the value: quantity times unit price
--	EDIT_TICKET:					Button for editing the ticket, activated by checking EDIT? checkbox
--	TAKE_TIME:						Field with the ticket creation date/time
--	$TOTAL:							Field with summed up qty_x_up values
-- EDIT?:							Checbox that needs to be checked prior to clicking EDIT_TICKET button for editing the ticket
--	DELIVERY_ADDRESS_FIELD:		Field with the delivery address
--	TICKET_NUMBER_FIELD			Field with non-unique ticket number, reset daily

- UP/DOWN arrows:					Buttons for scrolling the screen (placed on the left and right of the BOTTOM_BAR)

- BOTTOM_BAR:	Constant element, present on all screens
--	LOGGED_IN_AS:					Field showing who is taking orders
--	TOTAL_TICKETS_IN_PROD...:	Field with a number of opened tickets available for review in Tickets in production screen
-- TICKETS_CREATED/CLOSED:		Field showing number of created(with opened)/closed tickets
--	DAILY_TURNOVER:				Field showing the daily $TOTAL

#########################
2. Collaborators:


2.1. Contributors:

jeltz
mateo
wafcio
wunderbart


2.2. Roles in the project (please propose your engagement yourself):

jeltz:			tba
mateo:			project owner, implementator, manager, programmist, learner 
wafcio:			tba
wunderbart:		professional advisor (RoR, JavaScript, CoffeeScript, CSS, SQL, HTML)


2.3. Relevant skills by contributor (please self-assess):

jeltz:
mateo:			RoR beginner; git beginner; Python, SQL, CSS, HTML, JavaScript intermediate 
wafcio:
wunderbart:		RoR, JavaScript, CoffeeScript, CSS, SQL, HTML professional


2.4. Benefits to contributors (please propose yourself):

jeltz:			tba (share of potential revenue?)
mateo:			mainly what I learn; maybe c 20% of potential revenue (tba); printscreens and results from implementation may be used in my Master's thesis (without any code!)
wafcio:			tba (share of potential revenue?)
wunderbart:		tba (share of potential revenue?)

2.5. Testing and implementation subjects

Befriended subject(s) for testing and implementation:
Kuznia cafe & pizza, ul. Orzeska 78, Ornontowice, pizzeriakuznia.pl


3. Why Bluefish text editor (.bf):

I choose Bluefish mainly for the following reasons:
- free, GPL, Open source
- Cross-platform: Windows, OS X, Linux, BSD, Unix, OpenVMS
- Text editor support for newline character sequence support: Windows (CR/LF), Unix (including OS X) (LF), Mac OS (CR)

Other features of Bluefish:
- docs interface support: Multiple instances, Single document window splitting, MDI: overlappable windows, MDI: tabbed document interface
- Text editor support for basic editing features: Spell checking, Regex-based find & replace, Encoding conversion, Newline conversion, Multiple undo/redo, NO: Rectangular block selection
- Text editor support for programming features (see source code editor): Syntax highlighting, NO: Function list, Symbol database (ctags or equiv.), Brace matching, Auto indentation, Auto completion, Code folding, NO: Text folding, Compiler integration
- Text editor support for other programming features: NO: Text shell integration, Graphical shell integration, ?: Macro language, Collaborative editing, ?: Large file support, ?: Long line support, Multi-line regex support, ?: Search in files
- Text editor support for remote file editing over Internet Protocols: FTP, HTTP, SSH, WebDAV
- Text editor support for some of the most common character encodings: ASCII, ISO-8859, DOS (OEM), EBCDIC, UTF-8, UTF-16
- Right to left (RTL) & bidirectional (bidi) support: Right-to-left (RTL), Bi-directional (Bidi)

[source: http://en.wikipedia.org/wiki/Comparison_of_text_editors]




