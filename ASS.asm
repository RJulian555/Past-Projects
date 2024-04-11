
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.MODEL SMALL
.STACK 100
.DATA

MSG1 DB "Welcome to FitApp,Where your health is our top priority.$"
MSG_USERNAME DB 10,13,'Enter your username: $'
MSG_PASSWORD DB 10,13,'Enter your 6-digit password: $'
MSG_NEWLINE DB 13, 10, '$'

USERNAME DB 20 DUP('$') ; Reserve space for username (maximum 20 characters)
PASSWORD DB 7 DUP('$')  ; Reserve space for password (6 digits + null terminator)
CREDIT_CARD DB 16 DUP('$')  ; Reserve space for credit card number (maximum 20 characters)
MSG2 DB 10,13,"Welcome to FitApp, ", '$'
MSG_SERVICES DB "Here are the services that we offer", '$'

INPUT14 DB 13, 10, "Which would you like =", '$'
OPTION1 DB 13, 10, "1. Workout Suggestions", '$'
OPTION2 DB 13, 10, "2. FitApp Products", '$'
OPTION3 DB 13, 10, "3. Water Intake Calculator", '$'
OPTION4 DB 13, 10, "4. View Past Purchases", '$'
OPTION5 DB 13, 10, "5. EXIT the program", '$'
INVALID DB 13, 10, "please choose a option from 1 to 5", '$'
INVALID12 DB 13, 10, "please choose a optionY or N", '$'
INVALID22 DB 13, 10, "please choose a option 1,2 or 3", '$'
L DB 13,10,"Do you want to go back to the home screen? (Y/N): $"

A1 DB 13, 10, " 1 Strength Building (Beginner):$"
A2 DB 13, 10, " - Focus: Build foundational strength.$"
A3 DB 13, 10, " - Workout: Squats, deadlifts, bench presses, rows.  $"
A4 DB 13, 10, "   3 sets of 8-12 reps with moderate weight. $"

B1 DB 13, 10, " 2 Endurance Training (Intermediate):$"
B2 DB 13, 10, " - Focus: Improve cardiovascular fitness.$"
B3 DB 13, 10, " - Workout: Running, cycling, swimming.  $"
B4 DB 13, 10, "   Start with 5-10 min warm-up, then 30-60 min steady pace. $"

C1 DB 13, 10, " 3 Power Training (Advanced):$"
C2 DB 13, 10, " - Focus: Enhance speed and agility.$"
C3 DB 13, 10, " - Workout: Plyometrics like box jumps, medicine ball $"
C4 DB 13, 10, "   throws,sprints.3-4 sets of 6-8 reps with maximal effort. $"

D1 DB 13, 10, " 4 Flexibility and Mobility (All Levels):$"
D2 DB 13, 10, " - Focus: Improve range of motion and reduce injury risk.$"
D3 DB 13, 10, " - Workout: Dynamic stretches, yoga poses.   $"
D4 DB 13, 10, "   Hold each for 20-30 sec, repeat 2-3 sets. $"

PRODUCT1 DB 13, 10, "1. Protein Powder   RM150", '$'
PRODUCT2 DB 13, 10, "2. Yoga Mat         RM30", '$'
PRODUCT3 DB 13, 10, "3. Resistance Bands RM20", '$'
MSG_CARD DB 10,13,'Enter your credit card number (16-digits): $'
MSG_RECEIPT DB 10,13,'Receipt:',13,10,'Product Purchased: $'
RECEIPT_LINE DB 10,13,'Credit Card Number: $' 

PP DB 13,10,"You have purchased Protein Powder.$"
YM DB 13,10,"You have purchased Yoga Mat.$"
RB DB 13,10, "You have purchased Resistance Bands.$"


FITAPP_HEADER DB 13,10,'FITAPP', 13, 10, '$'
SEPARATOR DB '-------------------------------------------------------', 13, 10, '$'
ITEM_NAME DB 'Item: Protein powder', 13, 10, '$' 
ITEM_NAME2 DB 'Item: Yoga Mat', 13, 10, '$'
ITEM_NAME3 DB 'Item: Resistance Bands.', 13, 10, '$'
TOTAL DB 'Total: RM150.00', 13, 10, '$'   
TOTAL2 DB 'Total: RM30.00', 13, 10, '$'
TOTAL3 DB 'Total: RM20.00', 13, 10, '$'
TAX DB 'Total with tax(5%): RM157.50', 13, 10, '$'   
TAX2 DB 'Total with tax(5%): RM31.50', 13, 10, '$'
TAX3 DB 'Totalwith tax(5%): RM21.00', 13, 10, '$'
THANK_YOU DB 'Thank you!', 13, 10, '$'

INTRO DB   13,10,'Last purchased item:$'

ONE DB '2$'
TWO DB '1$'
ZERO DB '3$'

MSG_INPUT DB 10,13,'Enter the ammount in litre you drank today: $'
    INPUT_NUM DB ?
NICER DB 10,13,'Ammount left to drink: $'
    MSG_CONGRATS DB 13, 10, 'Congratulations! YOU DRANK ENOUGH FOR TODAY.$' 
    
    message1 db "You bought a Protein powder.", 0Dh, 0Ah, '$'
    message2 db "You bought a Yoga Mat.", 0Dh, 0Ah, '$'
    message3 db "You bought a Resistance Band", 0Dh, 0Ah, '$'
       
    
    

.CODE 

MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1     ;to print MSG1
    MOV AH,09H
    INT 21H
             
    ;SIGN IN ---------------------------------------------------------
    
    LEA DX, MSG_USERNAME   ; Prompt for username
    MOV AH, 09H
    INT 21H

    
    MOV AH, 0AH          ; Read username
    LEA DX, USERNAME
    INT 21H

   
    LEA DX, MSG_PASSWORD     ; ask for password
    MOV AH, 09H
    INT 21H

    
    MOV AH, 0AH
    LEA DX, PASSWORD        ; Read password
    INT 21H
    ;WELCOME USER  ------------------------------------------------------
    
   
    MOV AH, 00      ; Clear screen just to make it look wayyy better
    INT 10H
    
    LEA DX,MSG2     ;to print MSG2
    MOV AH,09H
    INT 21H
    
    LEA DX, USERNAME+2    ; Display username
    MOV AH, 09H
    INT 21H

    
    LEA DX, MSG_NEWLINE      ; make a newline
    MOV AH, 09H
    INT 21H

    ;display services  --------------------------------------------------
    
SELECTION:  

    
    LEA DX, MSG_NEWLINE      ; Newline (Skip a line)  just to make it look nicer
    MOV AH, 09H
    INT 21H 
    
    
    LEA DX, MSG_SERVICES     ; Print services message
    MOV AH,09H
    INT 21H

    
    LEA DX, MSG_NEWLINE      ; Newline
    MOV AH, 09H
    INT 21H    

   ; Print each option -----------------------------------------------------------
    
    LEA DX, OPTION1
    MOV AH, 09H
    INT 21H

    LEA DX, OPTION2
    MOV AH, 09H
    INT 21H

    LEA DX, OPTION3
    MOV AH, 09H
    INT 21H

    LEA DX, OPTION4
    MOV AH, 09H
    INT 21H
    
     LEA DX, OPTION5
    MOV AH, 09H
    INT 21H
    
   ; Ask user what they want ---------------------------------------------------
   
    LEA DX, MSG_NEWLINE   
    MOV AH, 09H
    INT 21H
    
    LEA DX, INPUT14   
    MOV AH, 09H
    INT 21H
    
    MOV AH, 01H     ; Read user input (option 1-5)
    INT 21H

    
    SUB AL, '0'      ; Convert ASCII character to integer

   ; Check the selected optiongiven by the user ----------------------------
    CMP AL, 1           
    JE OPTION1_SELECTED

    CMP AL, 2
    JE OPTION2_SELECTED

    CMP AL, 3
    JE OPTION3_SELECTED

    CMP AL, 4
    JE OPTION4_SELECTED
    
    CMP AL, 5
    JE OPTION5_SELECTED
    
    
    JMP INVALID1    ; Invalid option

     ;LABELS FOR ALL NUMBER IF CHOSEN ---------------------------
OPTION1_SELECTED:  ;to display workouts
    
    LEA DX, A1     ;A
    MOV AH, 09H
    INT 21H
     
    
    LEA DX, A2     ;A
    MOV AH, 09H
    INT 21H
     
    LEA DX, A3     ;A
    MOV AH, 09H
    INT 21H
      
    LEA DX, A4     ;A
    MOV AH, 09H
    INT 21H
    
    
    LEA DX, MSG_NEWLINE      ; Newline (Skip a line)  just to make it look nicer
    MOV AH, 09H
    INT 21H 
    
    LEA DX, B1     ;B
    MOV AH, 09H
    INT 21H
     
    
    
    LEA DX, B2     ;B
    MOV AH, 09H
    INT 21H
     
    LEA DX, B3     ;B
    MOV AH, 09H
    INT 21H
      
    LEA DX, B4     ;B
    MOV AH, 09H
    INT 21H
   
    
    LEA DX, MSG_NEWLINE      ; Newline (Skip a line)  just to make it look nicer
    MOV AH, 09H
    INT 21H 
    
     LEA DX, C1     ;C
    MOV AH, 09H
    INT 21H
    
    
    LEA DX, C2     ;C
    MOV AH, 09H
    INT 21H
     
    LEA DX, C3     ;C
    MOV AH, 09H
    INT 21H
      
    LEA DX, C4     ;C
    MOV AH, 09H
    INT 21H
    
  
    
    LEA DX, MSG_NEWLINE      ; Newline (Skip a line)  just to make it look nicer
    MOV AH, 09H
    INT 21H 
    
    LEA DX, D1     ;D
    MOV AH, 09H
    INT 21H
    
    LEA DX, D2     ;D
    MOV AH, 09H
    INT 21H
     
    LEA DX, D3     ;D
    MOV AH, 09H
    INT 21H
      
    LEA DX, D4     ;D
    MOV AH, 09H
    INT 21H
    
  
    LEA DX, MSG_NEWLINE      ; Newline (Skip a line)  just to make it look nicer
    MOV AH, 09H
    INT 21H 
    JMP LEAVE

OPTION2_SELECTED:   ;buy products -------------------------------------------------------------------------------
    ; Print each product
    LEA DX, PRODUCT1
    MOV AH, 09H
    INT 21H

    LEA DX, PRODUCT2
    MOV AH, 09H
    INT 21H

    LEA DX, PRODUCT3
    MOV AH, 09H
    INT 21H 
    
    ; Ask for user input
    LEA DX, MSG_NEWLINE   
    MOV AH, 09H
    INT 21H

    ; Read user input (product selection)
    MOV AH, 01H
    INT 21H

    ; Convert ASCII character to integer
    SUB AL, '0'

    ; Check the selected product
    CMP AL, 1
    JE BUY_PRODUCT1

    CMP AL, 2
    JE BUY_PRODUCT2

    CMP AL, 3
    JE BUY_PRODUCT3

    ; Invalid product
    JMP INVALID3

BUY_PRODUCT1:
    ; Print the name of Product 1
    LEA DX, PP
    MOV AH, 09H
    INT 21H
      
    
    ; Ask for credit card number
    LEA DX, MSG_CARD
    MOV AH, 09H
    INT 21H

    ; Read credit card number
    MOV AH, 0AH
    LEA DX, CREDIT_CARD
    INT 21H
;PRINT RECEIPT---------------------------------------------------------
    
    MOV AH, 00      ; Clear screen just to make it look wayyy better
    INT 10H
   
    ; Print FITAPP header
    LEA DX, FITAPP_HEADER
    MOV AH, 09H
    INT 21H

    ; Print separator
    LEA DX, SEPARATOR
    MOV AH, 09H
    INT 21H

    ; Print item name
    LEA DX, ITEM_NAME
    MOV AH, 09H
    INT 21H

    ; Print total
    LEA DX, TOTAL
    MOV AH, 09H
    INT 21H
    
    ; Print total with tax
    LEA DX, TAX
    MOV AH, 09H
    INT 21H
    
    ; Print separator
    LEA DX, SEPARATOR
    MOV AH, 09H
    INT 21H

    ; Print thank you message
    LEA DX, THANK_YOU
    MOV AH, 09H
    INT 21H  
    
    mov bl, 1         ; Set the value to 1 (can be 1, 2, or 3)
    
    JMP LEAVE

BUY_PRODUCT2:
    ; Print the name of Product 2
    LEA DX, YM
    MOV AH, 09H
    INT 21H
    
    
    ; Ask for credit card number
    LEA DX, MSG_CARD
    MOV AH, 09H
    INT 21H

    ; Read credit card number
    MOV AH, 0AH
    LEA DX, CREDIT_CARD
    INT 21H
;PRINT RECEIPT---------------------------------------------------------
    
    MOV AH, 00      ; Clear screen just to make it look wayyy better
    INT 10H
    
     ; Print FITAPP header
    LEA DX, FITAPP_HEADER
    MOV AH, 09H
    INT 21H

    ; Print separator
    LEA DX, SEPARATOR
    MOV AH, 09H
    INT 21H

    ; Print item name
    LEA DX, ITEM_NAME2
    MOV AH, 09H
    INT 21H

    ; Print total
    LEA DX, TOTAL2
    MOV AH, 09H
    INT 21H
    
     
    ; Print total with tax
    LEA DX, TAX2
    MOV AH, 09H
    INT 21H
    
    
    ; Print separator
    LEA DX, SEPARATOR
    MOV AH, 09H
    INT 21H

    ; Print thank you message
    LEA DX, THANK_YOU
    MOV AH, 09H
    INT 21H 
   
   mov bl, 2         ; Set the value to 2 (can be 1, 2, or 3)
    
    JMP LEAVE


BUY_PRODUCT3:
    ; Print the name of Product 3
    LEA DX, RB
    MOV AH, 09H
    INT 21H
       
    
    ; Ask for credit card number
    LEA DX, MSG_CARD
    MOV AH, 09H
    INT 21H

    ; Read credit card number
    MOV AH, 0AH
    LEA DX, CREDIT_CARD
    INT 21H
;PRINT RECEIPT---------------------------------------------------------
   
    MOV AH, 00      ; Clear screen just to make it look wayyy better
    INT 10H
   
     ; Print FITAPP header
    LEA DX, FITAPP_HEADER
    MOV AH, 09H
    INT 21H

    ; Print separator
    LEA DX, SEPARATOR
    MOV AH, 09H
    INT 21H

    ; Print item name
    LEA DX, ITEM_NAME3
    MOV AH, 09H
    INT 21H

    ; Print total
    LEA DX, TOTAL3
    MOV AH, 09H
    INT 21H
    
      
    ; Print total with tax
    LEA DX, TAX3
    MOV AH, 09H
    INT 21H
    
    
    ; Print separator
    LEA DX, SEPARATOR
    MOV AH, 09H
    INT 21H

    ; Print thank you message
    LEA DX, THANK_YOU
    MOV AH, 09H
    INT 21H
    
    mov bl, 3         ; Set the value to 3 (can be 1, 2, or 3)
   
    JMP LEAVE
                                  
OPTION3_SELECTED:   ;to count water intake ---------------------------------------------------------------------------------------

  
    LEA DX, MSG_NEWLINE      ; Newline (Skip a line)  just to make it look nicer
    MOV AH, 09H
    INT 21H 
   
; Display prompt to enter an integer
    MOV AH, 09H
    LEA DX, MSG_INPUT
    INT 21H

    ; Read input
    MOV AH, 01H
    INT 21H
    SUB AL, 30H  ; Convert ASCII to numeric value
    MOV INPUT_NUM, AL

    ; Check if the input is less than 3
    CMP INPUT_NUM, 3
    JGE CONGRATS  ; Jump if greater than or equal to 3
    
     
    
    ; If the input is less than 3, subtract it from 3
    MOV AL, 3
    SUB AL, INPUT_NUM
    MOV INPUT_NUM, AL
    
      
    LEA DX, MSG_NEWLINE      ; Newline (Skip a line)  just to make it look nicer
    MOV AH, 09H
    INT 21H 
    
    ; Display just to make it nicer
    MOV AH, 09H
    LEA DX, NICER
    INT 21H
    
    ; Display the result after subtraction
    MOV AH, 02H
    MOV DL, INPUT_NUM
    ADD DL, 30H  ; Convert numeric value to ASCII
    INT 21H

    JMP LEAVE

CONGRATS:
    ; Display congratulations message
    MOV AH, 09H
    LEA DX, MSG_CONGRATS
    INT 21H
    

   JMP LEAVE 
      
OPTION4_SELECTED:       ;Display most recent past purchases.

    MOV AH, 00      ; Clear screen just to make it look wayyy better
    INT 10H
   
   LEA DX, INTRO
    MOV AH, 09H
    INT 21H
     
   LEA DX, MSG_NEWLINE      ; Newline (Skip a line)  just to make it look nicer
    MOV AH, 09H
    INT 21H
    
   ; Compare the value with each possible condition
    cmp bl, 1         ; Check if value is 1
    je condition1     ; If true, jump to label condition1
    cmp bl, 2         ; Check if value is 2
    je condition2     ; If true, jump to label condition2
    cmp bl, 3         ; Check if value is 3
    je condition3     ; If true, jump to label condition3

    ; Default case if none of the conditions are met
    jmp LEAVE   ; Jump to end_program if condition is not met

condition1:
    

    mov ah, 09h       ; Function number for DOS print string
    lea dx, message1  ; Load address of message1 into DX
    int 21h           ; Invoke DOS interrupt to display message
    jmp LEAVE   ; Jump to end_program

condition2:   
   
    
    mov ah, 09h       ; Function number for DOS print string
    lea dx, message2  ; Load address of message2 into DX
    int 21h           ; Invoke DOS interrupt to display message
    jmp LEAVE   ; Jump to end_program

condition3:
    
    
    mov ah, 09h       ; Function number for DOS print string
    lea dx, message3  ; Load address of message3 into DX
    int 21h           ; Invoke DOS interrupt to display message
   

    JMP LEAVE


    
OPTION5_SELECTED:        ;leave if user wants
    
    MOV AH, 00      ; Clear screen just to make it look wayyy better
    INT 10H
    JMP LEAVE
    
INVALID1:
    LEA DX, INVALID
    MOV AH, 09H
    INT 21H

LEAVE:       ;ask user if they want to exit or go to home page
    
    
    
    LEA DX, L     ;display question
    MOV AH, 09H
    INT 21H

    ; Read user input
    MOV AH, 01H
    INT 21H 
    

    ; Check user input
    CMP AL, 'Y'
    JE IFY 
    
    CMP AL, 'y'
    JE IFY

    CMP AL, 'N'
    JE EXIT_PROGRAM
    
    CMP AL, 'n'
    JE EXIT_PROGRAM
    ; Invalid input, ask again
    JMP INVALID2


IFY:
    MOV AH, 00      ; Clear screen just to make it look wayyy better
    INT 10H 
    JE SELECTION
   
INVALID2:
    LEA DX, INVALID12
    MOV AH, 09H
    INT 21H  
    
INVALID3:
    LEA DX, INVALID22
    MOV AH, 09H
    INT 21H
    
    
   
    
EXIT_PROGRAM:       ; Exit program
    
    MOV AH,4CH
    INT 21H   

MAIN  ENDP   



 END    MAIN



