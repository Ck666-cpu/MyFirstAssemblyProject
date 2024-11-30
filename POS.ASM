.MODEL SMALL
.STACK
.DATA

;------------------------------------------------------------------------------------------ 
;------------------------------ Welcome & Login Variables ---------------------------------
;------------------------------------------------------------------------------------------ 

 wlmsg1 DB "==================================================================",0AH, 0Dh 
	DB " |                 _      __ __  __ __                           |",0AH, 0Dh                                  
	DB " |                | |    |  |  ||  |  |                          |",0AH, 0Dh                                
 	DB " |                | |___ |_   _||  ~  |                          |",0AH, 0Dh                               
	DB " |                |     ||     ||___, |                          |",0AH, 0Dh                                 
	DB " |                |     ||  |  ||     |                          |",0AH, 0Dh                                 
	DB " |                |_____||__|__||____/                           |",0AH, 0Dh                                 
	DB " |    __   ___   ___ ___  ____   __ __  ______    ___  ____      |",0AH, 0Dh                                
	DB " |   /  ] /   \ |   |   ||    \ |  |  ||      |  /  _]|    \     |",0AH, 0Dh                                
 	DB " |  /  / |     || _   _ ||  o  )|  |  ||      | /  [_ |  D  )    |",0AH, 0Dh                                
 	DB " | /  /  |  O  ||  \_/  ||   _/ |  |  ||_|  |_||    _]|    /     |",0AH, 0Dh                               
 	DB " |/   \_ |     ||   |   ||  |   |  :  |  |  |  |   [_ |    \     |",0AH, 0Dh                                
 	DB " |\     ||     ||   |   ||  |   |     |  |  |  |     ||  .  \    |",0AH, 0Dh                               
 	DB " | \____| \___/ |___|___||__|    \__,_|  |__|  |_____||__|\_|    |",0AH, 0Dh                                
 	DB " | __ __   ____  ____   ___    __    __   ____  ____     ___     |",0AH, 0Dh                                
 	DB " ||  |  | /    ||    \ |   \  |  |__|  | /    ||    \   /  _]    |",0AH, 0Dh                                
 	DB " ||  |  ||  o  ||  D  )|    \ |  |  |  ||  o  ||  D  ) /  [_     |",0AH, 0Dh                                
	DB " ||  _  ||     ||    / |  D  ||  |  |  ||     ||    / |    _]    |",0AH, 0Dh                                
	DB " ||  |  ||  _  ||    \ |     ||  `  '  ||  _  ||    \ |   [_     |",0AH, 0Dh                               
 	DB " ||  |  ||  |  ||  .  \|     | \      / |  |  ||  .  \|     |    |",0AH, 0Dh                                
 	DB " ||__|__||__|__||__|\_||_____|  \_/\_/  |__|__||__|\_||_____|    |",0AH, 0Dh                                                                                
 	DB "==================================================================  ",13,10	                                                                                                                       
   	DB "		           WELCOME !!!!		 ",0AH, 0Dh 
	DB "		<_LXY Computer Hardware POS system_>	",13,10 
 	DB "		Please Login first. Press any key.....	",13,10                                                                                                                     
 	DB "==================================================================  $"	                                                                                                                       

 Logmsg  DB 13,10,"   _      ____   _____ _____ _   _   "
	DB 13,10,"  | |    / __ \ / ____|_   _| \ | |  "
 	DB 13,10,"  | |   | |  | | |  __  | | |  \| |  "
 	DB 13,10,"  | |   | |  | | | |_ | | | | . ` |  "
  	DB 13,10,"  | |___| |__| | |__| |_| |_| |\  |  "
  	DB 13,10,"  |______\____/ \_____|_____|_| \_|  "
 	DB 13,10,"=====================================$"

                     
 LOG_ATTEMPT DB 0             
 uname db "KJ666"
 upsw db "1234"
 iname db 5 dup (0)
 ipass db 4 dup (0)
 Logmsg1 db 13,10,"Username: $"
 Logmsg2 db 13,10,"Password: $"
 Logmsg3 db 13,10,"Failed Login! Incorrect Username or password entered!$"
 Logmsg4 db 13,10,"Login successful!!!$"
 Logmsg5 db 13,10,"Press any key to continue...$"
 FailedLogin_msg db 13,10,"You have exceeded 3 times login!!! System will close now.$"
 number db 0,1,2,3
 NEWLINE db 13,10,'$' 

;----------------------------------------------------------------- MENU

 MENU db 13,10,"Please select a choice:",13,10
     db "1. Sales ",13,10
     db "2. Report ",13,10
     DB "3. Inventory",13,10
     db "4. Setting",13,10
     db "5. Exit",13,10,'$'

EXIT_MSG DB 13,10,"THANK YOU FOR USING LXY COMPUTER HARDWARE POS SYSTEM.$" 
INVALID_MENU DB 13,10,"INVALID INPUT!! ENTER AGAIN...$"


;------------------------------------------------------------------------------------------ 
;------------------------------ Sales & Summary Variables ---------------------------------
;------------------------------------------------------------------------------------------ 

SALE_MENU DB 13,10, "   _____       _            __  __  		 "               
          DB 13,10, "  / ____|     | |          |  \/  | 		 "               
          DB 13,10, " | (___   __ _| | ___ ___  |      | ___ _ __  _   _ "
          DB 13,10, "  \___ \ / _` | |/ _ / __| | |\/| |/ _ | '_ \| | | |"
          DB 13,10, "  ____) | (_| | |  __\__ \ | |  | |  __| | | | |_| |"
          DB 13,10, " |_____/ \__,_|_|\___|___/ |_|  |_|\___|_| |_|\__,_|"
          DB 13,10, "------------------------------------------------------"                                                    
          DB 13,10, " No.|     Products      |   Price   | "
          DB 13,10, "------------------------------------------------------"
          DB 13,10, " 1. |CPU	        |RM 199.40 |"
          DB 13,10, " 2. |GPU 	        |RM 299.40 |"
          DB 13,10, " 3. |MOUSE   	        |RM  30.00 |"
          DB 13,10, " 4. |KEYBOARD  	        |RM  40.00 |"
          DB 13,10, "======================================================" 
          DB 13,10, "Please select the product (Q to quit) : $"

INVALID_SALEMSG DB 13,10,"WRONG SELECTION INPUT. ENTER AGAIN.$"
QUANTITY_MSG DB 13,10,"ENTER NUMBER OF QUANTITY : $"

;----------------------------------------------- ANYMORE

MORE_ANSWER DB ?
MORE DB 13,10,"ANYMORE?(1/0) : $"  
INVALID_MORE DB 13,10,"WRONG SELECTION( 1 AND 0 ONLY )"

;----------------------------------------------- CALCULATION

MSG1 DB 13,10,"QUANTITY (UNIT):$"
MSG3 DB 0DH,0AH, "THE TOTAL PRICE IS RM$"
MSG5 DB ".$"
MSG_ZERO DB "00$"

TEN DW 10
ADJUST_PRICE DW 16

;----------------------------------------------- CPU

TTL1 DW 0 
TTL1_TOTAL DW 0

CPU_PRICE  DW 199

CPU_TOTAL_QUANTITY DW 0 

CPU_QUANTITY DW 0 
CPU_QUANTITY1 DB 0
CPU_QUANTITY2 DB 0

;----------------------------------------------- GPU

TTL2 DW 0 
TTL2_TOTAL DW 0

GPU_PRICE  DW 299

GPU_TOTAL_QUANTITY DW 0

GPU_QUANTITY DW 0 
GPU_QUANTITY1 DB 0
GPU_QUANTITY2 DB 0

;----------------------------------------------- MOUSE

TTL3 DW 0 
TTL3_TOTAL DW 0 

MOUSE_PRICE  DW 30

MOUSE_TOTAL_QUANTITY DW 0 

MOUSE_QUANTITY DW 0 
MOUSE_QUANTITY1 DB 0
MOUSE_QUANTITY2 DB 0

;----------------------------------------------- KEYBOARD

TTL4 DW 0 
TTL4_TOTAL DW 0

KEYBOARD_PRICE  DW 40

KEYBOARD_TOTAL_QUANTITY DW 0

KEYBOARD_QUANTITY DW 0 
KEYBOARD_QUANTITY1 DB 0
KEYBOARD_QUANTITY2 DB 0

;----------------------------------------------- CPU_SEN

TTL1_SEN DW 0 
TTL1_SEN_TOTAL DW 0 

CPU_SEN_PRICE DW 40 
CPU_SEN_SUBTOTAL DW 0 
CPU_SEN_TOTAL DW 0 

TEMP_CPU_SEN DW 0

;----------------------------------------------- GPU_SEN

TTL2_SEN DW 0 
TTL2_SEN_TOTAL DW 0 

GPU_SEN_PRICE DW 40 
GPU_SEN_SUBTOTAL DW 0 
GPU_SEN_TOTAL DW 0 

TEMP_GPU_SEN DW 0

;----------------------------------------------- SEN VARIABLES

SEN_STORE DW 0
RINGGIT_STORE DW 0
TOTAL_SEN_TTL DW 0 

P5_TOTAL_DISCOUNT DW 0 
P5_TOTAL_SEN_DISCOUNT DW 0
P5_TOTAL_SEN_STORE DW 0

P8_TOTAL_DISCOUNT DW 0
P8_TOTAL_SEN_DISCOUNT DW 0
P8_TOTAL_SEN_STORE DW 0

P10_TOTAL_DISCOUNT DW 0
P10_TOTAL_SEN_DISCOUNT DW 0
P10_TOTAL_SEN_STORE DW 0

;----------------------------------------------- FINAL VARIABLES 

CHECK_6K DW 6000

FINAL_TOTAL_5 DW 0 
FINAL_TOTAL_8 DW 0
FINAL_TOTAL_10 DW 0 

FINAL_SEN_TOTAL_5 DW 0
FINAL_SEN_TOTAL_8 DW 0
FINAL_SEN_TOTAL_10 DW 0

TOTAL_TTL DW 0 
TOTAL_CALC DW 0 
TOTAL_SEN_CALC DW 0 

FINAL_TOTAL DW 0
FINAL_SEN_TOTAL DW 0

;------------------------------------------------------------------------------------------ CART

SUMMARY_TOP DB 13,10, "      _________     _____ _____________________"
          DB 13,10, "      \_   ___ \   /  _  \\______   \__    ___/"
          DB 13,10, "      /    \  \/  /  /_\  \|       _/ |    |   "
          DB 13,10, "      \     \____/    |    \    |   \ |    |   "
          DB 13,10, "       \______  /\____|__  /____|_  / |____|   "
          DB 13,10, "              \/         \/       \/           "
	  DB 13,10,  "==================================================="            
          DB 13,10,  "|  COMPONENTS   |   PRICE   | x | QTY |   TOTAL   |"                      
 	  DB 13,10,  "---------------------------------------------------$"  
SUMMARY_1 DB 13,10,   "|      CPU      |  199.40  | x |  $"
A      DB " | RM $     "					   
SUMMARY_2 DB 13,10,  "|      GPU      |  299.40  | x |  $"
B      DB " | RM $     "   							   
SUMMARY_3 DB 13,10,  "|     MOUSE     |   30.00  | x |  $"
C         DB " | RM $     "  							   
SUMMARY_4 DB 13,10,  "|    KEYBOARD   |   40.00  | x |  $"
D         DB " | RM $     "  	
SUMMARY_TOTAL DB 13,10,"===================================================" 
              DB 13,10, "            TOTAL AMOUNT:               RM $       "           

SUMMARY_DISCOUNT_10 DB 13,10, "           10% SERVICE TAX:             RM $"      
SUMMARY_DISCOUNT_8 DB 13,10,"            8% SST:                     RM $       "		   
SUMMARY_DISCOUNT_5 DB "                             	              "           
                 DB 13,10,"==================================================="           
                 DB 13,10,"            5% DISCOUNT:                RM $       "  						   					   
SUMMARY_BOTTOM   DB 13,10, "===================================================" 
                 DB 13,10,"        TOTAL AMOUNT TO PAY:            RM $       " 


;------------------------------------------------------------------------------------------ 
;----------------------- Report & Inventory & Setting Variables ---------------------------
;------------------------------------------------------------------------------------------ 

;-------------------------------------------------------------------------------------------- REPORT
 REPORT_MSG  DB 13,10,"  _____  ______ _____   ____  _____ _______ "
 	     DB 13,10," |  __ \|  ____|  __ \ / __ \|  __ |__   __|"
  	     DB 13,10," | |__) | |__  | |__) | |  | | |__) | | |   "
  	     DB 13,10," |  _  /|  __| |  ___/| |  | |  _  /  | |   "
  	     DB 13,10," | | \ \| |____| |    | |__| | | \ \  | |   "
 	     DB 13,10," |_|  \_|______|_|     \____/|_|  \_\ |_|   "
	     DB 13,10, "==========================================="
	     DB 13,10, "TOTAL SALES                	 RM $"
 REPORT_MSG2 DB 13,10, "total cpu sold	 	      	         $"
 REPORT_MSG4 DB 13,10, "total gpu sold	 	      	         $"
 REPORT_MSG5 DB 13,10, "total mouse sold	 	         $"
 REPORT_MSG6 DB 13,10, "total keyboard sold	 	      	 $"
 REPORT_MSG3 DB 13,10, "==========================================="
	     DB 13,10, "PRESS LETTER 'Q' TO RETURN BACK: $"

INVALID_REPORT DB 13,10,"INVALID INPUT!! ENTER AGAIN...$"

 REPORT_SALES dw 0
 REPORT_SALES_SEN DW 0
 REPORT_CPU dw 0
 REPORT_GPU dw 0
 REPORT_MOUSE dw 0
 REPORT_KEYBOARD dw 0
 NUM1 DB 1
 NUM2 DB 2

;-------------------------------------------------------------------------------------------- INVENTORY 

INVENTORY_MSG  DB 13,10,"  _____ _   ___      ________ _   _ _______ ____  _______     __ "
 	       DB 13,10," |_   _| \ | \ \    / |  ____| \ | |__   __/ __ \|  __ \ \   / / "
 	       DB 13,10,"   | | |  \| |\ \  / /| |__  |  \| |  | | | |  | | |__) \ \_/ /  "
 	       DB 13,10,"   | | | . ` | \ \/ / |  __| | . ` |  | | | |  | |  _  / \   /   "
  	       DB 13,10,"  _| |_| |\  |  \  /  | |____| |\  |  | | | |__| | | \ \  | |    "
 	       DB 13,10," |_____|_| \_|   \/   |______|_| \_|  |_|  \____/|_|  \_\ |_|    "
	       DB 13,10,"================================================================="
	       DB 13,10,"1. CPU							-$"
INVENTORY_MSG2 DB 13,10,"2. GPU							-$"
INVENTORY_MSG3 DB 13,10,"2. MOUSE 						-$"
INVENTORY_MSG4 DB 13,10,"2. KEYBOARD 						-$"
INVENTORY_MSG5 DB 13,10,"================================================================="
	       DB 13,10,"PRESS LETTER 'Q' TO RETURN BACK: $"

CPU_STOCK DW 20 
GPU_STOCK DW 20
MOUSE_STOCK DW 50 
KEYBOARD_STOCK DW 50

;-------------------------------------------------------------------------------------------- SETTING

SETTING_MSG    DB 10, 13, "============================================================="
               DB 10,13,  " Choice:    | Text color     |"
               DB 10,13,  "=============================================================" 
               DB 10,13,  " 0.         | Default        |          "     
               DB 10,13,  " 1.         | Blue           |          " 
               DB 10,13,  " 2.         | Green          |          " 
               DB 10,13,  " 3.         | White          |          "
               DB 10,13,  " 4.         | Brown          |          " 
    	       DB 10,13,  " 5.         | Grey           |          " 
               DB 10,13,  "=============================================================" ,"$" 
SETTING_MSG2   DB 10,13,"  Enter the color you want to change (Q = exit): $"

SETTING_MSG3   DB 10,13,  "    _____ ______ _______ _______ _____ _   _  _____ "
	       DB 10,13,  "  / ____|  ____|__   __|__   __|_   _| \ | |/ ____| "
	       DB 10,13,  " | (___ | |__     | |     | |    | | |  \| | |  __  "
 	       DB 10,13,  "  \___ \|  __|    | |     | |    | | | . ` | | |_ | "
	       DB 10,13,  "  ____) | |____   | |     | |   _| |_| |\  | |__| | "
	       DB 10,13,  " |_____/|______|  |_|     |_|  |_____|_| \_|\_____| "
	       DB 10,13,  "=============================================================" 
               DB 10,13,  "	"
               DB 10,13,  " 1.Change text color only" 
               DB 10,13,  " 2.Change background-text color " 
               DB 10,13,  "	"
               DB 10,13,  "	" 
    	       DB 10,13,  "	" 
               DB 10,13,  "=============================================================" ,"$" 
SETTING_MSG4   DB 10,13,"  Enter the option you want to change setting (Q = exit): $"

SETTING_MSG5   DB 10, 13, "============================================================="
               DB 10,13,  " Choice:    | BACKGROUND-TEXT COLOR     |"
               DB 10,13,  "=============================================================" 
               DB 10,13,  " 0.         | Default                   |          "     
               DB 10,13,  " 1.         | Blue-White                |          " 
               DB 10,13,  " 2.         | Green-Yellow              |          " 
               DB 10,13,  " 3.         | Purple-White              |          "
               DB 10,13,  "=============================================================" ,"$" 


COLOR_NUMBER DB 7
INVALID_SETTINGMSG DB 13,10,"OPTION NOT AVAILABLE!! PLEASE SELECT AGAIN...(press any key)$"

;--------------------------------------------------------------------------------------------------------------------- 
 PAY_MSG DB 13,10,"	ENTER AMOUNT:			RM $"
 ARRAY LABEL BYTE
 MAX   DB    10
 ACT   DB    ?
 ARRAYDATA DB  10 DUP ('$')

 INVALID_STRING DB 13,10,"MUST ENTER VALUE IN FRONT (.) $"
 DOT_COUNT DB 0
 RM_COUNT DB 0
 MSGDOT DB 13,10,"DOTPLACE=$"
 RMMSG DB 13,10,"RINGGIT IS RM$"
 SENMSG DB 13,10,"SEN IS RM 0.$"
 RINGGIT_HOLD DW 0
 HOLD DW 0
 STORE_2ABOVE DW 0
 VALUE DW 129
 SEN_VALUE DW 40
 AFTER_MSG DB 13,10,"	THE CHANGE:			RM $"
 SEN_START DB 0
 HOLD_SEN DW 0

.CODE

;---------------------------------------------------- MAIN PROC

MAIN PROC
 MOV AX,@DATA
 MOV DS,AX

 CALL LOGIN
MAIN_MENU_CHOICE:
 CALL CLEARSCREEN_COLOR
;-DISPLAY MAIN MENU
 MOV AH,09H
 LEA DX,MENU
 INT 21H

;-GET USER INPUT
 MOV AH,01H
 INT 21H
 
;-COMPARE THE USER INPUT
 CMP AL,'1'
 JE CALL_SALE
 CMP AL,'2'
 JE CALL_REPORT
 CMP AL,'3'
 JE CALL_INVENTORY
 CMP AL,'4'
 JE CALL_SETTING
 CMP AL,'5'
 JE EXIT_PROGRAM
 JNE WRONG_MENU_INPUT

CALL_SALE:
 CALL SALE_FUNCTION
 JMP MAIN_MENU_CHOICE
CALL_REPORT:
 CALL REPORT_FUNCTION
 JMP MAIN_MENU_CHOICE
CALL_INVENTORY:
 CALL INVENTORY_MENU_FUNCTION
 JMP MAIN_MENU_CHOICE
CALL_SETTING:
 CALL SETTING_FUNCTION
 JMP MAIN_MENU_CHOICE

WRONG_MENU_INPUT:
 MOV AH,09H
 LEA DX,INVALID_MENU
 INT 21H
 
 MOV AH,08H
 INT 21H
 JMP MAIN_MENU_CHOICE

EXIT_PROGRAM:

 MOV AH,09H
 LEA DX,EXIT_MSG
 INT 21H
 MOV AH,02H
 MOV DL,03H
 INT 21H

 MOV AH,4CH
 INT 21H
MAIN ENDP

;---------------------------------------------------- LOGIN PROC 

LOGIN PROC
;-clear screen
 CALL CLEARSCREEN_COLOR

;-output string:09h(wlmsg1)
 MOV AH,09H
 LEA DX,wlmsg1
 INT 21H

;-press to continue
 MOV AH,08H
 INT 21H	;for press any key use

 
LoginStart:
CALL CLEARSCREEN_COLOR

;DISPLAY LOGINLOGO
 mov ah,09h
 lea dx,Logmsg
 int 21h
 
;-DISPLAY NAMEPROMPT
 mov ah,09h
 lea dx,Logmsg1
 int 21h

;-START GET USERNAME(01H)
 mov cx,5
 mov si,0
getname:
 mov ah,01h
 int 21h
 mov iname[si],al
 inc si
 loop getname

;-DISPLAY PASSWD PROMT
mov ah,09h
 lea dx,Logmsg2
 int 21h

;-START GET PASSWD
 mov cx,4
 mov si,0
getpass:
 mov ah,07h
 int 21h
 mov ipass[si],al
 inc si
 loop getpass

;-SECURITY CHECK USERNAME
 mov di,0
 mov si,0
valid1:
 cmp si,5
 je valid2
 mov al,uname[si]
 cmp iname[si],al
 JNE WRONG
 inc si
 jmp valid1

valid2:
 cmp di,4
 je correct
 mov al,upsw[di]
 cmp ipass[di],al
 jne wrong
 inc di
 jmp valid2

wrong:
 mov ah,09h
 lea dx,Logmsg3
 int 21h

 mov ah,09h
 lea dx,Logmsg5
 int 21h

 mov ah,01h
 int 21h
 MOV AX,0
 jmp LoginStart
 

correct:
 mov ah,09h
 lea dx,Logmsg4
 int 21h

 mov ah,09h
 lea dx,Logmsg5
 int 21h

 mov ah,01h
 int 21h
 MOV AX,0

Login_success:
ret
LOGIN ENDP

;---------------------------------------------------- SALE_FUNCTION PROC 

SALE_FUNCTION PROC
MOV CPU_TOTAL_QUANTITY ,0
MOV TTL1 ,0
MOV TTL1_TOTAL,0
MOV CPU_QUANTITY,0
MOV CPU_QUANTITY1,0
MOV CPU_QUANTITY2,0
MOV TTL2,0
MOV TTL2_TOTAL,0
MOV GPU_TOTAL_QUANTITY,0
MOV GPU_QUANTITY,0
MOV GPU_QUANTITY1,0
MOV GPU_QUANTITY2,0
MOV TTL3,0
MOV TTL3_TOTAL,0
MOV MOUSE_TOTAL_QUANTITY,0
MOV MOUSE_QUANTITY,0
MOV MOUSE_QUANTITY1,0
MOV MOUSE_QUANTITY2,0
MOV TTL4,0
MOV TTL4_TOTAL,0
MOV KEYBOARD_TOTAL_QUANTITY,0
MOV KEYBOARD_QUANTITY,0
MOV KEYBOARD_QUANTITY1,0
MOV KEYBOARD_QUANTITY2,0
MOV TTL1_SEN,0
MOV TTL1_SEN_TOTAL,0
MOV CPU_SEN_SUBTOTAL,0
MOV CPU_SEN_TOTAL,0
MOV TEMP_CPU_SEN,0
MOV TTL2_SEN ,0
MOV TTL2_SEN_TOTAL,0
MOV GPU_SEN_SUBTOTAL,0
MOV GPU_SEN_TOTAL,0
MOV TEMP_GPU_SEN,0
MOV SEN_STORE,0
MOV RINGGIT_STORE,0
MOV TOTAL_SEN_TTL,0
MOV P5_TOTAL_DISCOUNT,0
MOV P5_TOTAL_SEN_DISCOUNT,0
MOV P5_TOTAL_SEN_STORE,0
MOV P8_TOTAL_DISCOUNT,0
MOV P8_TOTAL_SEN_DISCOUNT,0
MOV P8_TOTAL_SEN_STORE,0
MOV P10_TOTAL_DISCOUNT,0
MOV P10_TOTAL_SEN_DISCOUNT,0
MOV P10_TOTAL_SEN_STORE,0
MOV FINAL_TOTAL_5,0
MOV FINAL_TOTAL_8,0
MOV FINAL_TOTAL_10,0
MOV FINAL_SEN_TOTAL_5,0
MOV FINAL_SEN_TOTAL_8,0
MOV FINAL_SEN_TOTAL_10,0
MOV TOTAL_TTL,0
MOV TOTAL_CALC,0
MOV TOTAL_SEN_CALC,0
MOV FINAL_TOTAL,0
MOV FINAL_SEN_TOTAL,0
MOV DOT_COUNT,0
MOV RM_COUNT,0
MOV RINGGIT_HOLD,0
MOV HOLD,0
MOV STORE_2ABOVE,0
MOV SEN_START,0
MOV HOLD_SEN,0

SALES_START:

 CALL CLEAR_VALUE 

 CALL CLEARSCREEN_COLOR

 MOV AH,09H
 LEA DX,SALE_MENU
 INT 21H

 MOV AH,01H
 INT 21H
 
 CMP AL,'1'
 JE SELL_CPU
 CMP AL,'2'
 JE SELL_GPU
 CMP AL, '3'
 JE SELL_MOUSE
 CMP AL,'4'
 JE SELL_KEYBOARD
 CMP AL,'Q'
 JE QUIT_SALE
 CMP AL,'q'
 JE QUIT_SALE
 JNE INVALID_SALE

CART:
 CALL CART_MENU 
 JMP QUIT_SALE

SELL_CPU:
 CALL CPU_SELL 
 CALL ANYMORE
 CMP MORE_ANSWER,'1'
 JE SALES_START
 CALL CLEARSCREEN_COLOR
 JNE CART
 JMP SALES_START

SELL_GPU:
 CALL GPU_SELL
 CALL ANYMORE
 CMP MORE_ANSWER,'1'
 JE SALES_START
 CALL CLEARSCREEN_COLOR
 JNE CART
 JMP SALES_START

SELL_MOUSE:
 CALL MOUSE_SELL
 CALL ANYMORE
 CMP MORE_ANSWER,'1'
 JE SALES_START
 CALL CLEARSCREEN_COLOR
 JNE CART
 JMP SALES_START

SELL_KEYBOARD:
 CALL KEYBOARD_SELL
 CALL ANYMORE
 CMP MORE_ANSWER,'1'
 JE SALES_START
 CALL CLEARSCREEN_COLOR
 JNE CART
 JMP SALES_START

INVALID_SALE:
 MOV AH,09H
 LEA DX,INVALID_SALEMSG
 INT 21H 
 
 MOV AH,08H
 INT 21H
 JMP SALES_START

QUIT_SALE:
 RET
SALE_FUNCTION ENDP

;---------------------------------------------------- CLEAR_VALUE PROC 

CLEAR_VALUE PROC 

 MOV TTL1, 0
 MOV TTL2, 0
 MOV TTL3, 0
 MOV TTL4, 0

 RET
CLEAR_VALUE ENDP 

;---------------------------------------------------- ANYMORE PROC

 ANYMORE PROC
 
 ANYMORE1:
 MOV AH,09H 
 LEA DX,MORE 
 INT 21H 

 MOV AH,01H 
 INT 21H 

 CMP AL,'0'
 JE END_ANYMORE

 CMP AL,'1'
 JE END_ANYMORE

 JNE INVALID

 INVALID:
 MOV AH,09H 
 LEA DX,INVALID_MORE
 INT 21H 
 JMP ANYMORE1
 
 END_ANYMORE:
 MOV MORE_ANSWER,AL

 RET 
ANYMORE ENDP   

;---------------------------------------------------- CPU_SELL PROC 

;---|
CPU_SELL PROC
	
; -OUTPUT STRING:09H(MSG1)   ; prompt user input quantity
 MOV AH,09H
 LEA DX,MSG1
 INT 21H                                                               

; -INPUT BYTE:01H    ; receive first digit
 MOV AH,01H
 INT 21H                                   
 	
; -MOVE USER INPUT (AL) TO QTY1
 MOV CPU_QUANTITY1,AL       ; 1                          

; -INPUT BYTE:01H    ; receive second digit 
 MOV AH,01H
 INT 21H                                     

; -MOVE USER INPUT (AL) TO QTY2
 MOV CPU_QUANTITY2,AL       ; 5

 MOV AL, CPU_QUANTITY1      ; 1

 MUL TEN                    ; 10

 ADD AL, CPU_QUANTITY2      ; 10 + 5 > 15 

 MOV CPU_QUANTITY1,AL     ; move 15 to CPU_QUANTITY1

 MOV AH,0 

 MOV AL,CPU_QUANTITY1

 MOV CPU_QUANTITY,AX  ; move 15 to quantity stored in AX

 SUB CPU_QUANTITY,16  ; sub 16 to get decimal value

 ADD CPU_TOTAL_QUANTITY,AX  ; store cpu quantity to cpu total quantity for display later

 MOV AX,0 
 MOV BX,0 

 MOV AX,CPU_QUANTITY
 
 MOV BX,CPU_PRICE 

 MUL BX   ; multiply quantity by ringgit price to get cpu subtotal ringgt amount 
 
 MOV TTL1,AX

 MOV AX,0
 MOV BX,0

 MOV AX,TTL1

 MOV BX,TTL1_TOTAL 

 ADD AX,BX   ; add cpu subtotal ringgit amount into cpu total ringgit amount 

 MOV TTL1_TOTAL,AX 

 MOV AX,0
 MOV BX,0

 MOV AX,CPU_TOTAL_QUANTITY

 MOV BX,16 

 SUB AX,BX   ; sub 16 to get decimal value 

 MOV CPU_TOTAL_QUANTITY,AX 

 MOV AX,CPU_STOCK 
 MOV BX,CPU_TOTAL_QUANTITY 
 SUB AX,BX 
 MOV CPU_STOCK,AX

 MOV AX,0
 MOV BX,0

 MOV AX,CPU_SEN_PRICE   

 MOV BX,CPU_QUANTITY

 MUL BX     ; multiply quantity by sen price to get cpu subtotal sen amount 

 MOV CPU_SEN_SUBTOTAL,AX 

 MOV AX,CPU_SEN_SUBTOTAL

 ADD CPU_SEN_TOTAL,AX   ; add cpu subtotal sen amount into cpu total sen amount 

 MOV AX,CPU_SEN_SUBTOTAL 

 CALL SEN_FILTER   ; filter the cpu sen subtotal amount into ringgit and sen 

 MOV AX,RINGGIT_STORE

 ADD TTL1,AX   ; add the ringgit amount into cpu subtotal ringgit amount 

 MOV AH,09H
 LEA DX,MSG3  ; display the total price is:
 INT 21H

 MOV AX,TTL1  ; cpu subtotal ringgit amount 

 CALL PRINT  ; print value

 MOV AH,09H
 LEA DX,MSG5  ; display '.'
 INT 21H 

 MOV AX,SEN_STORE 
 MOV TEMP_CPU_SEN,AX                     
                        
 MOV AX,TEMP_CPU_SEN
 CALL PRINT   ; print value

 RET
CPU_SELL ENDP
;---|

;---------------------------------------------------- GPU_SELL PROC 

;---|
GPU_SELL PROC
					;same concept as CPU_SELL PROC	
; -OUTPUT STRING:09H(MSG1)
 MOV AH,09H
 LEA DX,MSG1
 INT 21H

; -INPUT BYTE:01H
 MOV AH,01H
 INT 21H
 	
; -MOVE USER INPUT (AL) TO QTY1
 MOV GPU_QUANTITY1,AL

; -INPUT BYTE:01H
 MOV AH,01H
 INT 21H 

; -MOVE USER INPUT (AL) TO QTY2
 MOV GPU_QUANTITY2,AL

 MOV AL, GPU_QUANTITY1

 MUL TEN

 ADD AL, GPU_QUANTITY2

 MOV GPU_QUANTITY1,AL

 MOV AH,0 

 MOV AL,GPU_QUANTITY1

 MOV GPU_QUANTITY,AX

 SUB GPU_QUANTITY,16

 ADD GPU_TOTAL_QUANTITY,AX

 MOV AX,0 

 MOV BX,0 

 MOV AX,GPU_QUANTITY
 
 MOV BX,GPU_PRICE 

 MUL BX 
 
 MOV TTL2,AX

 MOV AX,0
 MOV BX,0

 MOV AX,TTL2

 MOV BX,TTL2_TOTAL 

 ADD AX,BX

 MOV TTL2_TOTAL,AX 

 MOV AX,0
 MOV BX,0

 MOV AX,GPU_TOTAL_QUANTITY

 MOV BX,16 

 SUB AX,BX 

 MOV GPU_TOTAL_QUANTITY,AX 

 MOV AX,GPU_STOCK 
 MOV BX,GPU_TOTAL_QUANTITY 
 SUB AX,BX 
 MOV GPU_STOCK,AX

 MOV AX,0
 MOV BX,0

 MOV AX,GPU_SEN_PRICE 

 MOV BX,GPU_QUANTITY

 MUL BX

 MOV GPU_SEN_SUBTOTAL,AX 

 MOV AX,GPU_SEN_SUBTOTAL

 ADD GPU_SEN_TOTAL,AX 

 MOV AX,GPU_SEN_SUBTOTAL 

 CALL SEN_FILTER

 MOV AX,RINGGIT_STORE

 ADD TTL2,AX 

 MOV AH,09H
 LEA DX,MSG3
 INT 21H

 MOV AX,TTL2

 CALL PRINT 

 MOV AH,09H
 LEA DX,MSG5
 INT 21H 

 MOV AX,SEN_STORE 
 MOV TEMP_GPU_SEN,AX

 MOV AX,TEMP_GPU_SEN
 CALL PRINT 

 RET
GPU_SELL ENDP
;---|

;---------------------------------------------------- MOUSE_SELL PROC 

;---|
MOUSE_SELL PROC

; -OUTPUT STRING:09H(MSG1)   ; prompt user input quantity
 MOV AH,09H
 LEA DX,MSG1
 INT 21H

; -INPUT BYTE:01H    ; receive first digit
 MOV AH,01H
 INT 21H
 	
; -MOVE USER INPUT (AL) TO QTY1
 MOV MOUSE_QUANTITY1,AL

; -INPUT BYTE:01H    ; receive second digit
 MOV AH,01H
 INT 21H 

; -MOVE USER INPUT (AL) TO QTY2
 MOV MOUSE_QUANTITY2,AL       ; 5

 MOV AL, MOUSE_QUANTITY1      ; 1

 MUL TEN                      ; 10

 ADD AL, MOUSE_QUANTITY2      ; 10 + 5 = 15 

 MOV MOUSE_QUANTITY1,AL     ; move 15 to MOUSE_QUANTITY1

 MOV AH,0 

 MOV AL,MOUSE_QUANTITY1

 MOV MOUSE_QUANTITY,AX  ; move 15 to quantity stored in AX

 SUB MOUSE_QUANTITY,16  ; sub 16 to get decimal value

 ADD MOUSE_TOTAL_QUANTITY,AX  ; store mouse quantity to mouse total quantity for display later

 MOV AX,0 

 MOV BX,0 

 MOV AX,MOUSE_QUANTITY
 
 MOV BX,MOUSE_PRICE 

 MUL BX   ; multiply quantity by ringgit price to get mouse subtotal ringgt amount 
 
 MOV TTL3,AX

 MOV AX,0
 MOV BX,0

 MOV AX,TTL3

 MOV BX,TTL3_TOTAL 

 ADD AX,BX   ; add mouse subtotal ringgit amount into mouse total ringgit amount

 MOV TTL3_TOTAL,AX 

 MOV AX,0

 MOV AX,MOUSE_QUANTITY 
 
 MOV BX,16

 SUB AX,BX   ; sub 16 to get decimal value

 MOV MOUSE_QUANTITY,AX 

 MOV AX,0
 MOV BX,0

 MOV AX,MOUSE_TOTAL_QUANTITY

 MOV BX,16 

 SUB AX,BX   ; sub 16 to get decimal value 

 MOV MOUSE_TOTAL_QUANTITY,AX 

 MOV AX,MOUSE_STOCK 
 MOV BX,MOUSE_TOTAL_QUANTITY 
 SUB AX,BX 
 MOV MOUSE_STOCK,AX

 MOV AH,09H
 LEA DX,MSG3  ; display the total price is:
 INT 21H

 MOV AX,0
 
 MOV AX,TTL3  ; mouse subtotal ringgit amount
 
 CALL PRINT   ; print value 

 RET
MOUSE_SELL ENDP
;---|

;---------------------------------------------------- KEYBOARD_SELL PROC 

;---|
KEYBOARD_SELL PROC
					;same concept as MOUSE_SELL PROC
; -OUTPUT STRING:09H(MSG1)
 MOV AH,09H
 LEA DX,MSG1
 INT 21H

; -INPUT BYTE:01H
 MOV AH,01H
 INT 21H
 	
; -MOVE USER INPUT (AL) TO QTY1
 MOV KEYBOARD_QUANTITY1,AL

; -INPUT BYTE:01H
 MOV AH,01H
 INT 21H 

; -MOVE USER INPUT (AL) TO QTY2
 MOV KEYBOARD_QUANTITY2,AL

 MOV AL, KEYBOARD_QUANTITY1

 MUL TEN

 ADD AL, KEYBOARD_QUANTITY2

 MOV KEYBOARD_QUANTITY1,AL

 MOV AH,0 

 MOV AL,KEYBOARD_QUANTITY1

 MOV KEYBOARD_QUANTITY,AX

 SUB KEYBOARD_QUANTITY,16

 ADD KEYBOARD_TOTAL_QUANTITY,AX

 MOV AX,0 

 MOV BX,0 

 MOV AX,KEYBOARD_QUANTITY
 
 MOV BX,KEYBOARD_PRICE 

 MUL BX 
 
 MOV TTL4,AX

 MOV AX,0
 MOV BX,0

 MOV AX,TTL4

 MOV BX,TTL4_TOTAL 

 ADD AX,BX

 MOV TTL4_TOTAL,AX 

 MOV AX,0

 MOV AX,KEYBOARD_QUANTITY 
 
 MOV BX,16

 SUB AX,BX

 MOV KEYBOARD_QUANTITY,AX 

 MOV AX,0
 MOV BX,0

 MOV AX,KEYBOARD_TOTAL_QUANTITY

 MOV BX,16 

 SUB AX,BX 

 MOV KEYBOARD_TOTAL_QUANTITY,AX 

 MOV AX,KEYBOARD_STOCK 
 MOV BX,KEYBOARD_TOTAL_QUANTITY 
 SUB AX,BX 
 MOV KEYBOARD_STOCK,AX

 MOV AH,09H
 LEA DX,MSG3
 INT 21H

 MOV AX,0
 
 MOV AX,TTL4
 
 CALL PRINT

 RET
KEYBOARD_SELL ENDP
;---|

;---------------------------------------------------- CART_MENU PROC 
								
CART_MENU PROC

CART_START: 
 MOV AH,09H
 LEA DX,SUMMARY_TOP    ; display the top part of the cart  
 INT 21H 

PRINT_CPU_CART:
 CMP CPU_TOTAL_QUANTITY,0   ; compare if it is 0 
 JE PRINT_GPU_CART      ; jump to next if equal to 0
 CALL CPU_CART      ; call CPU_CART PROC 

PRINT_GPU_CART:
 CMP GPU_TOTAL_QUANTITY,0 
 JE PRINT_MOUSE_CART
 CALL GPU_CART	

PRINT_MOUSE_CART:
 CMP MOUSE_TOTAL_QUANTITY,0 
 JE PRINT_KEYBOARD_CART	
 CALL MOUSE_CART

PRINT_KEYBOARD_CART:
 CMP KEYBOARD_TOTAL_QUANTITY,0 
 JE PRINT_TOTAL
 CALL KEYBOARD_CART 

PRINT_TOTAL: 
 CALL CALC_TOTAL 
 
 ;after display final_total &final_sen_total
;prompt user to enter customer pay value
 GET_INPUT:
;OUTPUT STRING:09H
 MOV AH,09H
 LEA DX,PAY_MSG
 INT 21H

;INPUT STRING:0AH
 MOV AH,0AH
 LEA DX,ARRAY
 INT 21H

CALL CHECK_DOT

VALIDSTRING:
 
 
 ADD DOT_COUNT,30H

 CALL GET_RM_PAY
 
;-RM STORE IN RINGGIT_HOLD
STOP_GET:
 MOV AX,0



;-START EXTRACT SEN FROM STRING
 CALL GET_SEN
;-SEN STORE IN HOLD_SEN

;-START CALC THE CHANGE BACK TO CUSTOMER
 CALL AMOUNT_BACK
;-THE RINGGIT PART AFTER SUB STORE BACK TO RINGGIT_HOLD

;-START CALC THE SEN CHANGE BACK TO CUSTOMER
 CALL SEN_BACK_CALC

;-NOW DISPLAY THE CHANGE(RM & SEN)
 MOV AX,0
 MOV AH,09H
 LEA DX,AFTER_MSG
 INT 21H

 MOV AX,0
 MOV AX,RINGGIT_HOLD
 CALL PRINT

 MOV AX,0
 MOV AH,02H
 MOV DL,'.'
 INT 21H 

 MOV AX,0
 MOV AX,HOLD_SEN
 CALL PRINT

 MOV AH,08H
 INT 21H
 MOV AX,0
 MOV BX,REPORT_SALES
 MOV AX,FINAL_TOTAL
 ADD AX,BX
 MOV REPORT_SALES, AX

 MOV AX,0
 MOV BX,0
 MOV AX,REPORT_SALES_SEN
 MOV BX,FINAL_SEN_TOTAL
 ADD AX,BX
 MOV REPORT_SALES_SEN,AX

 MOV AX,0
 MOV BX,0
 MOV AX,REPORT_CPU
 MOV BX,CPU_TOTAL_QUANTITY
 ADD AX,BX
 MOV REPORT_CPU, AX

MOV AX,0
 MOV BX,0
 MOV AX,REPORT_GPU
 MOV BX,GPU_TOTAL_QUANTITY
 ADD AX,BX
 MOV REPORT_GPU, AX

MOV AX,0
 MOV BX,0
 MOV AX,REPORT_MOUSE
 MOV BX,MOUSE_TOTAL_QUANTITY
 ADD AX,BX
 MOV REPORT_MOUSE, AX


MOV AX,0
 MOV BX,0
 MOV AX,REPORT_KEYBOARD
 MOV BX,KEYBOARD_TOTAL_QUANTITY
 ADD AX,BX
 MOV REPORT_KEYBOARD, AX
END_CART_TOTAL:

 RET
CART_MENU ENDP 

;---------------------------------------------------- CPU_CART PROC 

CPU_CART PROC 
	
 MOV AH,09H
 LEA DX,SUMMARY_1      ; display the cpu part line message 
 INT 21H 

 MOV AX,0 

 MOV AX,CPU_TOTAL_QUANTITY

 CALL PRINT 

 MOV AH,09H
 LEA DX,A       ; display the cpu total line
 INT 21H

 MOV AX,0 

 MOV AX,CPU_SEN_TOTAL  ;80 

 CALL SEN_FILTER    ; filter the cpu sen total amount into ringgit and sen

 MOV AX,RINGGIT_STORE  

 ADD TTL1_TOTAL,AX   ; add the ringgit part into cpu ringgit total amount  

 MOV AX,TTL1_TOTAL

 CALL PRINT 

 MOV AH,09H
 LEA DX,MSG5    ; display '.' 
 INT 21H 

DISPLAY_SEN_CPU:
 CMP SEN_STORE,0    ; compare if it is 0  
 JE DISPLAY_ZERO_SEN_CPU    ; jump if equal to 0

 MOV AX,SEN_STORE

 ADD TTL1_SEN_TOTAL,AX   ; add the sen part into cpu sen total amount 

 MOV AX,SEN_STORE

 CALL PRINT
 JMP EXIT_CPU_CART


DISPLAY_ZERO_SEN_CPU:
 MOV AH,09H 
 LEA DX,MSG_ZERO   ; display '00' 
 INT 21H 

 JMP EXIT_CPU_CART

EXIT_CPU_CART:
 RET 
CPU_CART ENDP 

;---------------------------------------------------- GPU_CART PROC 

GPU_CART PROC 
					;same concept as CPU_CART PROC
 MOV AH,09H
 LEA DX,SUMMARY_2
 INT 21H 

 MOV AX,0 

 MOV AX,GPU_TOTAL_QUANTITY

 CALL PRINT 

 MOV AH,09H
 LEA DX,B 
 INT 21H 

 MOV AX,0 

 MOV AX,GPU_SEN_TOTAL

 CALL SEN_FILTER

 MOV AX,RINGGIT_STORE

 ADD TTL2_TOTAL,AX 

 MOV AX,TTL2_TOTAL

 CALL PRINT 

 MOV AH,09H
 LEA DX,MSG5
 INT 21H 


DISPLAY_SEN_GPU:
 CMP SEN_STORE,0 
 JE DISPLAY_ZERO_SEN_GPU

 MOV AX,SEN_STORE

 ADD TTL2_SEN_TOTAL,AX

 MOV AX,SEN_STORE

 CALL PRINT
 JMP EXIT_GPU_CART


DISPLAY_ZERO_SEN_GPU:
 MOV AH,09H 
 LEA DX,MSG_ZERO 
 INT 21H 

 JMP EXIT_GPU_CART

EXIT_GPU_CART:
 RET 
GPU_CART ENDP 

;---------------------------------------------------- MOUSE_CART PROC 

MOUSE_CART PROC 

 MOV AH,09H
 LEA DX,SUMMARY_3      ; display the mouse part line message 
 INT 21H 

 MOV AX,0 

 MOV AX,MOUSE_TOTAL_QUANTITY

 CALL PRINT 

 MOV AH,09H
 LEA DX,C       ; display the mouse total line
 INT 21H

 MOV AX,0 

 MOV AX,TTL3_TOTAL

 CALL PRINT  

 MOV AH,09H
 LEA DX,MSG5    ; display '.'
 INT 21H 

 MOV AH,09H 
 LEA DX,MSG_ZERO   ; display '00' 
 INT 21H 

 RET 
MOUSE_CART ENDP 

;---------------------------------------------------- KEYBOARD_CART PROC 

KEYBOARD_CART PROC 
	
 MOV AH,09H
 LEA DX,SUMMARY_4
 INT 21H 

 MOV AX,0 

 MOV AX,KEYBOARD_TOTAL_QUANTITY

 CALL PRINT 

 MOV AH,09H
 LEA DX,D
 INT 21H  

 MOV AX,0 

 MOV AX,TTL4_TOTAL

 CALL PRINT 

 MOV AH,09H
 LEA DX,MSG5
 INT 21H 

 MOV AH,09H 
 LEA DX,MSG_ZERO 
 INT 21H 

 RET 
KEYBOARD_CART ENDP 

;---------------------------------------------------- CALC_TOTAL PROC 

CALC_TOTAL PROC 

;--CALC TOTAL 

 MOV AX,0 
 MOV AX,TTL1_TOTAL 
 ADD AX,TTL2_TOTAL
 ADD AX,TTL3_TOTAL 
 ADD AX,TTL4_TOTAL     ; add up all the total ringgit amount of the products 

 MOV TOTAL_TTL,AX


;--DISPLAY TOTAL 

 MOV AH,09H
 LEA DX,SUMMARY_TOTAL     ; display the total line message 
 INT 21H 

 MOV AX,0 
 MOV AX,TTL1_SEN_TOTAL  ;80
 ADD AX,TTL2_SEN_TOTAL  ;80 

 MOV TOTAL_SEN_TTL,AX 

 MOV AX,TOTAL_SEN_TTL   ;160 

 CALL SEN_FILTER      ; filter the total sen amount into ringgit and sen 

 MOV AX,RINGGIT_STORE  ;1

 ADD TOTAL_TTL,AX    ; add the ringgit amount into final total ringgit amount  

 MOV AX,TOTAL_TTL

 CALL PRINT    ; print the total ringgit amount  

 MOV AH,09H
 LEA DX,MSG5     ; display '.' 
 INT 21H  

 MOV AX,SEN_STORE     ;60  
 MOV TOTAL_SEN_TTL,AX    ;60 
 MOV AX,TOTAL_SEN_TTL 
 CALL PRINT   ; print the total sen amount

;---------------------------- CHECK_6000
 
;--CHECK AMOUNT EXCEED RM6000 GET 5%DISCOUNT
 MOV AX,0
 MOV AX,CHECK_6K
 CMP TOTAL_TTL,AX     ; compare if is it 6000
 JL FINAL_COUNT_TWO    ; jump if less than 6000
 CALL FINAL_PAY_CALC    ; call if more than 6000 
 JMP END_CALC_TOTAL

FINAL_COUNT_TWO:
 CALL FINAL_PAY_CALC_2

END_CALC_TOTAL: 
 RET 
CALC_TOTAL ENDP 

;---------------------------------------------------- FINAL_PAY_CALC_2 PROC

 FINAL_PAY_CALC_2 PROC 

;---------------------------- 10% CALC_2

;--CALC 10% DISCOUNT

PRINT_10P_LINE_2:                                        
 MOV AX,TOTAL_TTL	     ;997
 MOV BX,10			
 MUL BX 
 MOV P10_TOTAL_DISCOUNT,AX   ;9970
 MOV AX,P10_TOTAL_DISCOUNT
 CALL SEN_FILTER 
 MOV AX,RINGGIT_STORE 
 MOV P10_TOTAL_DISCOUNT,AX   ;99

 MOV AX,SEN_STORE  
 MOV P10_TOTAL_SEN_STORE,AX  ;70    
 
;--DISPLAY 10% DISCOUNT

 MOV AH,09H 
 LEA DX,SUMMARY_DISCOUNT_10 
 INT 21H 

 MOV AX,P10_TOTAL_DISCOUNT

 CALL PRINT    ; print the 10% total ringgit discount amount 

;--CALC 10% DISCOUNT_SEN 

 MOV AX,TOTAL_SEN_TTL	         ;60
 MOV BX,10		     	
 MUL BX
 MOV P10_TOTAL_SEN_DISCOUNT,AX   ;600
 MOV AX,P10_TOTAL_SEN_DISCOUNT
 MOV BX,100	             
 DIV BX 
 MOV P10_TOTAL_SEN_DISCOUNT,AX   ;6
 MOV AX,P10_TOTAL_SEN_DISCOUNT 

;--DISPLAY 10% DISCOUNT SEN

COMPARE_P10_SEN_2:
 CMP P10_TOTAL_SEN_STORE,10     ; compare if it is 10 
 JL P10_ONE_DIGIT_2               ; jump if lower than 10  
 MOV AH,09H
 LEA DX,MSG5
 INT 21H 

 MOV AX,P10_TOTAL_SEN_STORE
 ADD P10_TOTAL_SEN_DISCOUNT,AX 
 MOV AX,P10_TOTAL_SEN_DISCOUNT
 CALL PRINT    ; print the 10% total sen discount amount
 JMP PRINT_8P_LINE_2


P10_ONE_DIGIT_2: 
 MOV AH,09H
 LEA DX,MSG5
 INT 21H 

 MOV AH,02H 
 MOV DL,'0' 
 INT 21H 

 MOV AX,P10_TOTAL_SEN_STORE
 ADD P10_TOTAL_SEN_DISCOUNT,AX 
 MOV AX,P10_TOTAL_SEN_DISCOUNT
 CALL PRINT    ; print the 10% total sen discount amount
 JMP PRINT_8P_LINE_2

;---------------------------- 8% CALC_2

;--CALC 8% DISCOUNT 
 
PRINT_8P_LINE_2:
 MOV AX,TOTAL_TTL	     ;997 		
 MOV BX,8 			 
 MUL BX 
 MOV P8_TOTAL_DISCOUNT,AX    ;9970
 MOV AX,P8_TOTAL_DISCOUNT
 CALL SEN_FILTER 
 MOV AX,RINGGIT_STORE 
 MOV P8_TOTAL_DISCOUNT,AX    ;99 

 MOV AX,SEN_STORE  
 MOV P8_TOTAL_SEN_STORE,AX   ;70          

 
;--DISPLAY 8% DISCOUNT

 MOV AH,09H 
 LEA DX,SUMMARY_DISCOUNT_8
 INT 21H 

 MOV AX,P8_TOTAL_DISCOUNT

 CALL PRINT    ; print the 8% total ringgit discount amount 

;--CALC 8% DISCOUNT_SEN 

 MOV AX,TOTAL_SEN_TTL	         ;60	     
 MOV BX,8		     
 MUL BX
 MOV P8_TOTAL_SEN_DISCOUNT,AX    ;480
 MOV AX,P8_TOTAL_SEN_DISCOUNT
 MOV BX,100	             
 DIV BX 
 MOV P8_TOTAL_SEN_DISCOUNT,AX 
 MOV AX,P8_TOTAL_SEN_DISCOUNT    ;80

;--DISPLAY 8% DISCOUNT SEN

COMPARE_P8_SEN_2:
 CMP P8_TOTAL_SEN_STORE,10     ; compare if it is 10 
 JL P8_ONE_DIGIT_2             ; jump if lower than 10
 MOV AH,09H
 LEA DX,MSG5
 INT 21H 

 MOV AX,P8_TOTAL_SEN_STORE
 ADD P8_TOTAL_SEN_DISCOUNT,AX 
 MOV AX,P8_TOTAL_SEN_DISCOUNT
 CALL PRINT    ; print the 8% total sen discount amount
 JMP PRINT_5P_LINE


P8_ONE_DIGIT_2: 
 MOV AH,09H
 LEA DX,MSG5
 INT 21H 

 MOV AH,02H 
 MOV DL,'0' 
 INT 21H 

 MOV AX,P8_TOTAL_SEN_STORE
 ADD P8_TOTAL_SEN_DISCOUNT,AX 
 MOV AX,P8_TOTAL_SEN_DISCOUNT
 CALL PRINT    ; print the 8% total sen discount amount
 JMP PRINT_5P_LINE 

;---------------------------- DISPLAY FINAL
 
PRINT_FINAL_2:
;--CALC TOTAL_CALC 
 MOV AX,P10_TOTAL_DISCOUNT 
 ADD AX,P8_TOTAL_DISCOUNT    ; add 10% ringgit amount with 8% ringgit amount
 MOV TOTAL_CALC,AX 

 
;--CALC FINAL_TOTAL
 MOV AX,TOTAL_TTL
 MOV BX,TOTAL_CALC
 ADD AX,BX		; add summary total ringgit amount with discount/tax total ringgit amount 
 MOV FINAL_TOTAL,AX


;--CALC TOTAL_SEN_CALC
 MOV AX,P10_TOTAL_SEN_DISCOUNT 
 ADD AX,P8_TOTAL_SEN_DISCOUNT   ; add 10% sen amount with 8% sen amount
 MOV TOTAL_SEN_CALC,AX 
 

;--CALC FINAL_SEN_TOTAL
 MOV AX,TOTAL_SEN_TTL 
 MOV BX,TOTAL_SEN_CALC 
 ADD AX,BX 		; add summary total sen amount with discount/tax total sen amount 
 MOV FINAL_SEN_TOTAL,AX 
 MOV AX,FINAL_SEN_TOTAL
 CALL SEN_FILTER    ; filter final total sen amount into ringgit and sen 
 
 MOV AX,RINGGIT_STORE 
 ADD FINAL_TOTAL,AX   ; add the ringgit amount into final total ringgit amount

 MOV AX,SEN_STORE 
 MOV FINAL_SEN_TOTAL,AX

;--DISPLAY FINAL_TOTAL

 MOV AH,09H 
 LEA DX,SUMMARY_BOTTOM  ; display the bottom cart line message 
 INT 21H 

 MOV AX,FINAL_TOTAL 
 CALL PRINT    ; print the final total ringgit amount 

 MOV AH,09H
 LEA DX,MSG5 
 INT 21H 

 MOV AX,FINAL_SEN_TOTAL
 CALL PRINT    ; print the final total sen amount 

 RET
FINAL_PAY_CALC_2 ENDP

;---------------------------------------------------- FINAL_PAY_CALC PROC 

 FINAL_PAY_CALC PROC 
	
;---------------------------- 10% CALC
                                              ;let's say I use 2, 2 as cpu, gpu quantity (ans = 997.60)
;--CALC 10% DISCOUNT
  
PRINT_10P_LINE:
 MOV AX,TOTAL_TTL	     ;997
 MOV BX,10			
 MUL BX 
 MOV P10_TOTAL_DISCOUNT,AX   ;9970
 MOV AX,P10_TOTAL_DISCOUNT
 CALL SEN_FILTER 
 MOV AX,RINGGIT_STORE 
 MOV P10_TOTAL_DISCOUNT,AX   ;99

 MOV AX,SEN_STORE  
 MOV P10_TOTAL_SEN_STORE,AX  ;70    
 
;--DISPLAY 10% DISCOUNT

 MOV AH,09H 
 LEA DX,SUMMARY_DISCOUNT_10 
 INT 21H 

 MOV AX,P10_TOTAL_DISCOUNT

 CALL PRINT    ; print the 10% total ringgit discount amount 

;--CALC 10% DISCOUNT_SEN 

 MOV AX,TOTAL_SEN_TTL	         ;60
 MOV BX,10		     	
 MUL BX
 MOV P10_TOTAL_SEN_DISCOUNT,AX   ;600
 MOV AX,P10_TOTAL_SEN_DISCOUNT
 MOV BX,100	             
 DIV BX 
 MOV P10_TOTAL_SEN_DISCOUNT,AX   ;6
 MOV AX,P10_TOTAL_SEN_DISCOUNT 

;--DISPLAY 10% DISCOUNT SEN

COMPARE_P10_SEN:
 CMP P10_TOTAL_SEN_STORE,10     ; compare if it is 10 
 JL P10_ONE_DIGIT               ; jump if lower than 10  
 MOV AH,09H
 LEA DX,MSG5
 INT 21H 

 MOV AX,P10_TOTAL_SEN_STORE
 ADD P10_TOTAL_SEN_DISCOUNT,AX 
 MOV AX,P10_TOTAL_SEN_DISCOUNT
 CALL PRINT    ; print the 10% total sen discount amount 
 JMP PRINT_8P_LINE


P10_ONE_DIGIT: 
 MOV AH,09H
 LEA DX,MSG5
 INT 21H 

 MOV AH,02H 
 MOV DL,'0' 
 INT 21H 

 MOV AX,P10_TOTAL_SEN_STORE
 ADD P10_TOTAL_SEN_DISCOUNT,AX 
 MOV AX,P10_TOTAL_SEN_DISCOUNT
 CALL PRINT    ; print the 10% total sen discount amount
 JMP PRINT_8P_LINE 

;---------------------------- 8% CALC
                                              ;let's say I use 2, 2 as cpu, gpu quantity (ans = 997.60)
;--CALC 8% DISCOUNT 
 
PRINT_8P_LINE:
 MOV AX,TOTAL_TTL	     ;997 		
 MOV BX,8 			 
 MUL BX 
 MOV P8_TOTAL_DISCOUNT,AX    ;9970
 MOV AX,P8_TOTAL_DISCOUNT
 CALL SEN_FILTER 
 MOV AX,RINGGIT_STORE 
 MOV P8_TOTAL_DISCOUNT,AX    ;99 

 MOV AX,SEN_STORE  
 MOV P8_TOTAL_SEN_STORE,AX   ;70          

 
;--DISPLAY 8% DISCOUNT

 MOV AH,09H 
 LEA DX,SUMMARY_DISCOUNT_8
 INT 21H 

 MOV AX,P8_TOTAL_DISCOUNT

 CALL PRINT    ; print the 8% total ringgit discount amount 

;--CALC 8% DISCOUNT_SEN 

 MOV AX,TOTAL_SEN_TTL	         ;60	     
 MOV BX,8		     
 MUL BX
 MOV P8_TOTAL_SEN_DISCOUNT,AX    ;480
 MOV AX,P8_TOTAL_SEN_DISCOUNT
 MOV BX,100	             
 DIV BX 
 MOV P8_TOTAL_SEN_DISCOUNT,AX 
 MOV AX,P8_TOTAL_SEN_DISCOUNT    ;80

;--DISPLAY 8% DISCOUNT SEN

COMPARE_P8_SEN:
 CMP P8_TOTAL_SEN_STORE,10     ; compare if it is 10 
 JL P8_ONE_DIGIT               ; jump if lower than 10
 MOV AH,09H
 LEA DX,MSG5
 INT 21H 

 MOV AX,P8_TOTAL_SEN_STORE
 ADD P8_TOTAL_SEN_DISCOUNT,AX 
 MOV AX,P8_TOTAL_SEN_DISCOUNT
 CALL PRINT    ; print the 8% total sen discount amount 
 JMP PRINT_5P_LINE


P8_ONE_DIGIT: 
 MOV AH,09H
 LEA DX,MSG5
 INT 21H 

 MOV AH,02H 
 MOV DL,'0' 
 INT 21H 

 MOV AX,P8_TOTAL_SEN_STORE
 ADD P8_TOTAL_SEN_DISCOUNT,AX 
 MOV AX,P8_TOTAL_SEN_DISCOUNT
 CALL PRINT    ; print the 8% total sen discount amount 
 JMP PRINT_5P_LINE 

;---------------------------- 5% CALC
                                              ;let's say I use 2, 2 as cpu, gpu quantity (ans = 997.60)
;--CALC 5% DISCOUNT 
 
PRINT_5P_LINE:
 MOV AX,TOTAL_TTL	     ;997  		
 MOV BX,5 			
 MUL BX 
 MOV P5_TOTAL_DISCOUNT,AX    ;9970 
 MOV AX,P5_TOTAL_DISCOUNT
 CALL SEN_FILTER 
 MOV AX,RINGGIT_STORE 
 MOV P5_TOTAL_DISCOUNT,AX    ;99

 MOV AX,SEN_STORE  
 MOV P5_TOTAL_SEN_STORE,AX   ;70        

 
;--DISPLAY 5% DISCOUNT

 MOV AH,09H 
 LEA DX,SUMMARY_DISCOUNT_5 
 INT 21H 

 MOV AX,P5_TOTAL_DISCOUNT

 CALL PRINT    ; print the final total ringgit discount amount  

;--CALC 5% DISCOUNT_SEN 

 MOV AX,TOTAL_SEN_TTL	         ;60	     
 MOV BX,5		    
 MUL BX
 MOV P5_TOTAL_SEN_DISCOUNT,AX    ;300
 MOV AX,P5_TOTAL_SEN_DISCOUNT
 MOV BX,100	            
 DIV BX 
 MOV P5_TOTAL_SEN_DISCOUNT,AX 
 MOV AX,P5_TOTAL_SEN_DISCOUNT    ;3  

;--DISPLAY 5% DISCOUNT SEN

COMPARE_P5_SEN:
 CMP P5_TOTAL_SEN_STORE,10     ; compare if it is 10
 JL P5_ONE_DIGIT               ; jump if lower than 10
 MOV AH,09H
 LEA DX,MSG5
 INT 21H 

 MOV AX,P5_TOTAL_SEN_STORE
 ADD P5_TOTAL_SEN_DISCOUNT,AX 
 MOV AX,P5_TOTAL_SEN_DISCOUNT
 CALL PRINT    ; print the 5% total sen discount amount 
 JMP PRINT_FINAL


P5_ONE_DIGIT: 
 MOV AH,09H
 LEA DX,MSG5
 INT 21H 

 MOV AH,02H 
 MOV DL,'0' 
 INT 21H 

 MOV AX,P5_TOTAL_SEN_STORE
 ADD P5_TOTAL_SEN_DISCOUNT,AX 
 MOV AX,P5_TOTAL_SEN_DISCOUNT
 CALL PRINT    ; print the 5% total sen discount amount 
 JMP PRINT_FINAL

;---------------------------- DISPLAY FINAL
 
PRINT_FINAL:
;--CALC TOTAL_CALC 
 MOV AX,P10_TOTAL_DISCOUNT 
 ADD AX,P8_TOTAL_DISCOUNT     ; add 10% ringgit amount with 8% ringgit amount 
 SUB AX,P5_TOTAL_DISCOUNT     ; sub amount by 5% ringgit amount 
 MOV TOTAL_CALC,AX 

 
;--CALC FINAL_TOTAL
 MOV AX,TOTAL_TTL
 MOV BX,TOTAL_CALC
 ADD AX,BX              ; add summary total ringgit amount with discount/tax total ringgit amount 
 MOV FINAL_TOTAL,AX


;--CALC TOTAL_SEN_CALC
 MOV AX,P10_TOTAL_SEN_DISCOUNT    
 ADD AX,P8_TOTAL_SEN_DISCOUNT     ; add 10% sen amount with 8% sen amount    
 SUB AX,P5_TOTAL_SEN_DISCOUNT     ; sub amount by 5% sen amount
 MOV TOTAL_SEN_CALC,AX 
 

;--CALC FINAL_SEN_TOTAL
 MOV AX,TOTAL_SEN_TTL 
 MOV BX,TOTAL_SEN_CALC 
 ADD AX,BX              ; add summary total sen amount with discount/tax total ringgit amount 
 MOV FINAL_SEN_TOTAL,AX 
 MOV AX,FINAL_SEN_TOTAL
 CALL SEN_FILTER   ; filter final total sen amount into ringgit and sen 
 
 MOV AX,RINGGIT_STORE 
 ADD FINAL_TOTAL,AX    ; add the ringgit amount into final total ringgit amount 

 MOV AX,SEN_STORE 
 MOV FINAL_SEN_TOTAL,AX

;--DISPLAY FINAL_TOTAL

 MOV AH,09H 
 LEA DX,SUMMARY_BOTTOM  ; display the bottom cart line message 
 INT 21H 

 MOV AX,FINAL_TOTAL 
 CALL PRINT    ; print the final total ringgit amount 

 MOV AH,09H
 LEA DX,MSG5 
 INT 21H 

 MOV AX,FINAL_SEN_TOTAL
 CALL PRINT    ; print the final total sen amount 


END_PRINT_FINAL:
 RET

FINAL_PAY_CALC ENDP 

;---------------------------- SEN_FILTER

SEN_FILTER PROC	;(eg. value=12345 aka RM123.45)
 MOV CX,0	; cx use to count the time run & value store
 MOV DX,0	;dx for get remainder
FILTER1:
 CMP CX,2	;cmp already get 2 digit
 JE ADJUST_SEN	; if yes, stop get and go adjust

 MOV BX,10	;bx use to divide complete value and get 1digit remainder
 DIV BX		;a(12345/10 > ax=1234 dx=5), b(1234/10 > ax=123 dx=4)
 PUSH DX	;push dx remainder to temporary hold in stack segmt for later use
 INC CX		;increment cx to get next digit (in stack,cx=0 store5 > cx=1 store4)
 
 MOV DX,0	;clear dx
 JMP FILTER1	;back to get next digit 

ADJUST_SEN:
 MOV RINGGIT_STORE,AX	;the quotient value will be store in ringgit_store 
			;(ax=123, store in ringgit_store)
 POP DX			;retrieve value from stack segmt(cx=1, retrive '4' to dx)
 MOV SEN_STORE,DX	;move the value in sen_store	(dx=4 > sen_store=4)
 MOV BX,0		
 MOV AX,0		;clear ax & bx
 MOV BX,10		;(sen_store=4 to ax then mul bx=10)
 MOV AX,SEN_STORE	;(sen_store=40)
 MUL BX			;multiply the first floating point by 10
 MOV SEN_STORE,AX	;mov back to sen_store
 
 MOV AX,0
 MOV BX,0		;clear ax & bx

 DEC CX			;decrement cx for the the digit	(cx=0, retrieve '5')
 POP DX			;pop to retrieve value
 MOV AX,SEN_STORE	
 ADD AX,DX		;add the value with the previous store value(sen_store=40+5=45)
 MOV SEN_STORE,AX	;mov back to sen_store and it is done (sen_store=45)
 
 RET
SEN_FILTER ENDP

;---------------------------- PRINT

PRINT PROC	;(12345)
 MOV CX,0	;clear cx&dx for count and get remainder use
 MOV DX,0
LABEL1:
 CMP AX,0	;check no more value
 JE PRINT1	;if no more then go to print

 MOV BX,10D	;bx=10 to divide value and get remainder
 
 DIV BX
 
 PUSH DX	;remainder in dx, push and store in stack
		;(cx=0 dx=5 stack=5 >c=1 d=4 s=54 >c=2 d=3 s=543 >)
 INC CX		;(>c=3 d=2 s=5432 > c=4 d=1 s=54321)
 		;increment cx to count next value
 MOV DX,0
 JMP LABEL1	;back to get next value
PRINT1:
 CMP CX,0	;check already print all value
 JE EXIT1	;if print all, stop print

 POP DX		;retrieve value from stack start (cx=4 dx=1 s=5432 > c=3 d=2 s=543>)
		;(>cx=2 dx=3 stack=54 > c=1 d=4 s=5 > c=0 d=5 s=none)
 ADD DX,30H	;ad 30 to get respective decimal value represent in ascii table

 MOV AH,02H
 INT 21H	;output the value in ax one byte by one byte (1 > 2 > 3 > 4 > 5)

 DEC CX		;decrement to get next value
 JMP PRINT1	;jmp to print again

EXIT1:		;the value finish output one byte by one byte and end print
 RET		;(output= 12345) same as value mention on top
PRINT ENDP

;----------------------------------------------------

REPORT_FUNCTION PROC
START_REPORT:
 CALL CLEARSCREEN_COLOR
 MOV AH,09H
 LEA DX,REPORT_MSG
 INT 21H

 MOV AX,0
 MOV AX,REPORT_SALES
 CALL PRINT

 MOV AH,02H
 MOV DL,'.'
 INT 21H

 MOV AX,0 
 MOV AX,REPORT_SALES_SEN
 CALL PRINT

 MOV AH,09H
 LEA DX,REPORT_MSG2
 INT 21H
 
 MOV AX,0
 MOV AX,REPORT_CPU
 CALL PRINT

 MOV AH,09H
 LEA DX,REPORT_MSG4
 INT 21H

 MOV AX,0
 MOV AX,REPORT_GPU
 CALL PRINT

 MOV AH,09H
 LEA DX,REPORT_MSG5
 INT 21H

 MOV AX,0
 MOV AX,REPORT_MOUSE
 CALL PRINT

 MOV AH,09H
 LEA DX,REPORT_MSG6
 INT 21H

 MOV AX,0
 MOV AX,REPORT_KEYBOARD
 CALL PRINT

 MOV AH,09H
 LEA DX,REPORT_MSG3
 INT 21H

 MOV AH,01H
 INT 21H
 CMP AL,'Q'
 JE END_REPORT_DISPLAY
 CMP AL,'q'
 JE END_REPORT_DISPLAY

;-OUTPUT INVALID AND ENTER AGAIN
 MOV AH,09H
 LEA DX,INVALID_SETTINGMSG
 INT 21H
 
 MOV AH,08H
 INT 21H
 JMP START_REPORT

END_REPORT_DISPLAY:
 RET
REPORT_FUNCTION ENDP

;----------------------------------------------------

INVENTORY_MENU_FUNCTION PROC
 START_INVENTORY:
 CALL CLEARSCREEN_COLOR
 MOV AH,09H
 LEA DX,INVENTORY_MSG
 INT 21H
 
 MOV AX,CPU_STOCK 
 CALL PRINT 

 MOV AH,09H
 LEA DX,INVENTORY_MSG2
 INT 21H
 
 MOV AX,GPU_STOCK 
 CALL PRINT 

 MOV AH,09H
 LEA DX,INVENTORY_MSG3
 INT 21H
 
 MOV AX,MOUSE_STOCK
 CALL PRINT 

 MOV AH,09H
 LEA DX,INVENTORY_MSG4
 INT 21H
 
 MOV AX,KEYBOARD_STOCK 
 CALL PRINT 

 MOV AH,09H
 LEA DX,INVENTORY_MSG5
 INT 21H
 
;-ASK USER TO QUIT
 MOV AH,01H
 INT 21H
 CMP AL,'Q'
 JE END_INVENTORY_MENU
 CMP AL,'q'
 JE END_INVENTORY_MENU

;-OUTPUT INVALID AND ENTER AGAIN
 MOV AH,09H
 LEA DX,INVALID_SETTINGMSG
 INT 21H
 
 MOV AH,08H
 INT 21H
 JMP START_INVENTORY

END_INVENTORY_MENU:
 RET
INVENTORY_MENU_FUNCTION ENDP
;----------------------------------------------------

SETTING_FUNCTION PROC
 MAIN_SETTING_MENU:
CALL CLEARSCREEN_COLOR
 MOV AH,09H
 LEA DX,SETTING_MSG3
 INT 21H

 MOV AH,09H
 LEA DX,SETTING_MSG4
 INT 21H

 MOV AH,01H
 INT 21H
 CMP AL,'1'
 JE TEXT_COLOR
 CMP AL,'2'
 JE BACKGROUND_COLOR
 CMP AL,'Q'
 JE END_MAIN_SETTING
 CMP AL,'q'
 JE END_MAIN_SETTING

;-OUTPUT INVALID AND ENTER AGAIN
 MOV AH,09H
 LEA DX,INVALID_SETTINGMSG
 INT 21H
 
 MOV AH,08H
 INT 21H
 JMP MAIN_SETTING_MENU

TEXT_COLOR:
 CALL SET_TEXT
 JMP MAIN_SETTING_MENU

BACKGROUND_COLOR:
 CALL SET_BACKGROUND
 JMP MAIN_SETTING_MENU

END_MAIN_SETTING:
 RET
SETTING_FUNCTION ENDP

;----------------------------------------------------

SET_TEXT PROC
SETTING_START:
 CALL CLEARSCREEN_COLOR
 MOV AH,09H
 LEA DX,SETTING_MSG
 INT 21H

 MOV AH,09H
 LEA DX,SETTING_MSG2
 INT 21H
 
 MOV AH,01H
 INT 21H
 CMP AL,'0'
 JE DEFAULT
 CMP AL,'1'
 JE BLUE
 CMP AL,'2'
 JE GREEN
 CMP AL,'3'
 JE WHITE
 CMP AL,'4'
 JE BROWN
 CMP AL,'5'
 JE LIGHT_GREY
 CMP AL,'Q'
 JE END_SETTING
 CMP AL,'q'
 JE END_SETTING

;-OUTPUT INVALID AND ENTER AGAIN
 MOV AH,09H
 LEA DX,INVALID_SETTINGMSG
 INT 21H
 
 MOV AH,08H
 INT 21H
 JMP SETTING_START

 DEFAULT:
 MOV BH,07H
 MOV COLOR_NUMBER,BH
 JMP SETTING_START

 BLUE:
 MOV BH,01H
 MOV COLOR_NUMBER,BH
 JMP SETTING_START

 GREEN:
 MOV BH,02H
 MOV COLOR_NUMBER,BH
 JMP SETTING_START

 WHITE:
 MOV BH,0FH
 MOV COLOR_NUMBER,BH
 JMP SETTING_START

 BROWN:
 MOV BH,06H
 MOV COLOR_NUMBER,BH
 JMP SETTING_START

 LIGHT_GREY:
 MOV BH,08H
 MOV COLOR_NUMBER,BH
 JMP SETTING_START

END_SETTING:
 RET
SET_TEXT ENDP

;----------------------------------------------------

SET_BACKGROUND PROC
SET_BACK_START:
CALL CLEARSCREEN_COLOR
 MOV AH,09H
 LEA DX,SETTING_MSG5
 INT 21H

 MOV AH,09H
 LEA DX,SETTING_MSG2
 INT 21H
 
 MOV AH,01H
 INT 21H
 CMP AL,'0'
 JE DEFAULT1
 CMP AL,'1'
 JE BLUE_WHITE
 CMP AL,'2'
 JE GREEN_YELLOW
 CMP AL,'3'
 JE PURPLE_WHITE
 CMP AL,'Q'
 JE END_SET_BACK
 CMP AL,'q'
 JE END_SET_BACK

;-OUTPUT INVALID AND ENTER AGAIN
 MOV AH,09H
 LEA DX,INVALID_SETTINGMSG
 INT 21H
 
 MOV AH,08H
 INT 21H
 JMP SET_BACK_START

DEFAULT1:
 MOV BH,07H
 MOV COLOR_NUMBER,BH
 JMP SET_BACK_START

 BLUE_WHITE:
 MOV BH,3FH
 MOV COLOR_NUMBER,BH
 JMP SET_BACK_START

 GREEN_YELLOW:
 MOV BH,2EH
 MOV COLOR_NUMBER,BH
 JMP SET_BACK_START

 PURPLE_WHITE:
 MOV BH,5FH
 MOV COLOR_NUMBER,BH
 JMP SET_BACK_START

END_SET_BACK:
 RET
SET_BACKGROUND ENDP

;----------------------------------------------------

CLEARSCREEN_COLOR PROC
 MOV AX,0003H	;CLEAR SCREEN
 INT 10H
 
 MOV AX,0600H		 ;SET FUNCTION ACT AS CLEARSCREEN(AH=06),SET FULLSCREEN(AL=00)
 MOV BH,COLOR_NUMBER	 ;CHANGE TEXT COLOR FROM THE USER SELECTED VALUE/DEFAULT
 MOV CX,0		 ;SET START ROW:COLUMN
 MOV DX,184FH		 ;SET END ROW:COLUMN
 INT 10H

 RET
CLEARSCREEN_COLOR ENDP

;----------------------------------------------------

NEWLINE1 PROC

 MOV AH,09H
 LEA DX,NEWLINE
 INT 21H

 RET
NEWLINE1 ENDP

;----------------------------------------------------
 CHECK_DOT PROC
;-CHECK WHRE IS THE DOT PLACE AT
CHECK_DOTPLACE:
 MOV AX,0
 MOV BX,0
 MOV SI,0
 MOV DX,0
 MOV CX,0

 MOV AH,0
 MOV AL,ACT
 MOV CX,AX
CHECK_DOT_AGAIN:
 MOV AL,ARRAYDATA[SI]
 CMP AL,'.'
 JE DOT_FOUND
 INC SI
 INC DOT_COUNT
 LOOP CHECK_DOT_AGAIN

DOT_FOUND:
 CMP SI,1
 JGE END_CHECK_DOT
 MOV AH,09H
 LEA DX,INVALID_STRING
 INT 21H
 JMP GET_INPUT

END_CHECK_DOT:
 RET
 CHECK_DOT ENDP
;---------------------------
 AMOUNT_BACK PROC
 MOV AX,0
 MOV BX,0
 MOV AX,RINGGIT_HOLD
 MOV BX,FINAL_TOTAL
 SUB AX,BX
 MOV RINGGIT_HOLD,AX

END_AMOUNT_BACK:
 RET
 AMOUNT_BACK ENDP
;--------------------------
 GET_RM_PAY PROC
 MOV AX,0
 MOV AL,DOT_COUNT
 CMP AL,'1'
 JE ONLY_1
 CMP AL,'2'
 JE ONLY_2
 CMP AL,'3'
 JE ONLY_3
 CMP AL,'4'
 JE ONLY_4
 CMP AL,'5'
 JE ONLY_5

ONLY_1:
 CALL GET_1RM
 JMP SUMMARISE_DIGIT
ONLY_2:
 CALL GET_2RM
 JMP SUMMARISE_DIGIT
ONLY_3:
 CALL GET_3RM
 JMP SUMMARISE_DIGIT
ONLY_4:
 CALL GET_4RM
 JMP SUMMARISE_DIGIT
ONLY_5:
 CALL GET_5RM

SUMMARISE_DIGIT:
 MOV AX,0
 MOV AX,HOLD
 MOV RINGGIT_HOLD,AX
 MOV AX,0


 RET
 GET_RM_PAY ENDP

;---------------------------
 GET_SEN PROC
 MOV SI,0
 MOV AX,0
 MOV AL,DOT_COUNT
 CMP AL,'1'
 JE SEN_PLACE2
 CMP AL,'2'
 JE SEN_PLACE3
 CMP AL,'3'
 JE SEN_PLACE4
 CMP AL,'4'
 JE SEN_PLACE5
 CMP AL,'5'
 JE SEN_PLACE6

SEN_PLACE2:
 MOV SI,2
 JMP NEXT
SEN_PLACE3:
 MOV SI,3
 JMP NEXT
SEN_PLACE4:
 MOV SI,4
 JMP NEXT
SEN_PLACE5:
 MOV SI,5
 JMP NEXT
SEN_PLACE6:
 MOV SI,6

NEXT:
 MOV AX,0
 MOV BX,0
 MOV CX,10
 MOV AH,0
 MOV AL,ARRAYDATA[SI]
 SUB AX,30H
 MUL CX
 MOV HOLD_SEN,AX  
 INC SI
 
;CONTINUE_GET2:			;DIGIT2
 MOV AX,0
 MOV AH,0
 MOV AL,ARRAYDATA[SI]
 SUB AX,30H
 ADD HOLD_SEN,AX
 
 RET 
 GET_SEN ENDP
;----------------------
 SEN_BACK_CALC PROC

 MOV AX,0
 MOV BX,0
 MOV AX,HOLD_SEN
 MOV BX,FINAL_SEN_TOTAL
 CMP AX,BX
 JGE NORMAL_CALC

;-IF HOLD_SEN IS NOT ENOUGHT TO SUB THE FINAL_SEN_TOTAL
 MOV AX,0
 MOV BX,0
 MOV AX,RINGGIT_HOLD
 MOV BX,1
 SUB AX,BX
 MOV RINGGIT_HOLD,AX	;RINGGIT_HOLD SUB1 TO BORROW 1 TO SEN
 MOV AX,0
 MOV DX,0
 MOV AX,HOLD_SEN
 MOV DX,100		;ADD SEN WITH 100 TO SUB THE FINAL TOTAL
 ADD AX,DX
 MOV HOLD_SEN,AX
NORMAL_CALC:		;IF HOLD_SEN IS GREATER DIRECT CALC
 MOV AX,0
 MOV AX,HOLD_SEN
 MOV BX,0
 MOV BX,FINAL_SEN_TOTAL
 SUB AX,BX
 MOV HOLD_SEN,AX
 
END_SEN_CALC:
 RET
 SEN_BACK_CALC ENDP
;--------------------------
GET_1RM PROC

GET_RINGGIT1:
 MOV AX,0
 MOV BX,0
 MOV CX,0
 MOV DX,0
 MOV SI,0

 MOV CX,10
 MOV AH,0
 MOV AL,ARRAYDATA[SI]
 SUB AL,30H
 MOV HOLD,AX  
 
 RET
GET_1RM ENDP
;-------------------------------
GET_2RM PROC
GET_RINGGIT2:
 MOV AX,0
 MOV BX,0
 MOV CX,0
 MOV DX,0
 MOV SI,0

 MOV CX,10
 MOV AH,0
 MOV AL,ARRAYDATA[SI]
 SUB AX,30H
 MUL CX
 MOV HOLD,AX  
 INC SI
 
;CONTINUE_GET2:			;DIGIT2
 MOV AX,0
 MOV AH,0
 MOV AL,ARRAYDATA[SI]
 SUB AX,30H
 ADD HOLD,AX
 
 RET 
GET_2RM ENDP

;----------------------------
GET_3RM PROC
GET_RINGGIT3:
 MOV AX,0
 MOV BX,0
 MOV CX,0
 MOV DX,0
 MOV SI,0

 MOV CX,10
 MOV AH,0
 MOV AL,ARRAYDATA[SI]
 SUB AX,30H
 MUL CX
 MOV HOLD,AX  
 INC SI
 
;CONTINUE_GET2:			DIGIT2
 MOV AX,0
 MOV AH,0
 MOV AL,ARRAYDATA[SI]
 SUB AX,30H
 ADD HOLD,AX
 MOV CX,0
 MOV CX,10
 MOV AX,HOLD
 MUL CX
 MOV HOLD,AX
 INC SI

;CONTINUE_GET3:			DIGIT3
 MOV AX,0
 MOV AH,0
 MOV AL,ARRAYDATA[SI]
 SUB AX,30H
 ADD HOLD,AX

 RET 
GET_3RM ENDP
;--------------------------------
GET_4RM PROC
GET_RINGGIT4:
 MOV AX,0
 MOV BX,0
 MOV CX,0
 MOV DX,0
 MOV SI,0

 MOV CX,10
 MOV AH,0
 MOV AL,ARRAYDATA[SI]
 SUB AX,30H
 MUL CX
 MOV HOLD,AX  
 INC SI
 
;CONTINUE_GET2:			DIGIT2
 MOV AX,0
 MOV AH,0
 MOV AL,ARRAYDATA[SI]
 SUB AX,30H
 ADD HOLD,AX
 MOV CX,0
 MOV CX,10
 MOV AX,HOLD
 MUL CX
 MOV HOLD,AX
 INC SI

;CONTINUE_GET3:			DIGIT3
 MOV AX,0
 MOV AH,0
 MOV AL,ARRAYDATA[SI]
 SUB AX,30H
 ADD HOLD,AX
 MOV CX,0
 MOV CX,10
 MOV AX,HOLD
 MUL CX
 MOV HOLD,AX
 INC SI

;CONTINUE_GET4:			DIGIT4
 MOV AX,0
 MOV AH,0
 MOV AL,ARRAYDATA[SI]
 SUB AX,30H
 ADD HOLD,AX

 RET 
GET_4RM ENDP

GET_5RM PROC
GET_RINGGIT5:
 MOV AX,0
 MOV BX,0
 MOV CX,0
 MOV DX,0
 MOV SI,0

 MOV CX,10
 MOV AH,0
 MOV AL,ARRAYDATA[SI]
 SUB AX,30H
 MUL CX
 MOV HOLD,AX  
 INC SI
 
;CONTINUE_GET2:			DIGIT2
 MOV AX,0
 MOV AH,0
 MOV AL,ARRAYDATA[SI]
 SUB AX,30H
 ADD HOLD,AX
 MOV CX,0
 MOV CX,10
 MOV AX,HOLD
 MUL CX
 MOV HOLD,AX
 INC SI

;CONTINUE_GET3:			DIGIT3
 MOV AX,0
 MOV AH,0
 MOV AL,ARRAYDATA[SI]
 SUB AX,30H
 ADD HOLD,AX
 MOV CX,0
 MOV CX,10
 MOV AX,HOLD
 MUL CX
 MOV HOLD,AX
 INC SI

;CONTINUE_GET4:			DIGIT4
 MOV AX,0
 MOV AH,0
 MOV AL,ARRAYDATA[SI]
 SUB AX,30H
 ADD HOLD,AX
 MOV CX,0
 MOV CX,10
 MOV AX,HOLD
 MUL CX
 MOV HOLD,AX
 INC SI

;CONTINUE_GET5:			DIGIT5
 MOV AX,0
 MOV AH,0
 MOV AL,ARRAYDATA[SI]
 SUB AX,30H
 ADD HOLD,AX

 RET 
GET_5RM ENDP

;--------------------------------------

END MAIN