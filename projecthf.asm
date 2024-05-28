;coal project


.model small
.stack 100h
;-----------------------------------MACROS-------------------------------------------------------------
;--------------------------------------------------------------
;-----------------------------------------------------------
delete_block_macro MACRO x,y_start,y_end

mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, y_start     ;top row of window
mov cl, x     ;left most column of window
add x,3
mov dh, y_end    ;Bottom row of window
mov dl, x     ;Right most column of window
int 10h

sub x,3

ENDM
;-----------------------------------------------------------



.data
 
string db "WELCOME TO BRICK BREAKER$"
cnt dw 0
msex db 50


string1 db "Press 1 for New Game$"
cnt1 dw 0
msex1 db 50


string2 db "Press 2 for Resume$"
cnt2 dw 0
msex2 db 53

string3 db "Press 3 for Instructions$"
cnt3 dw 0
msex3 db 49

string4 db "Press 4 for Exit$"
cnt4 dw 0
msex4 db 51

string112 db "Enter your name Here!$"
count112 dw 0
mousex112 db 8
mousey112 db 19

string113 db "-->$"
count113 dw 0
mousex113 db 8
mousey113 db 19







stringI1 db "Instructions$"
countI1 dw 0
mousexI1 db 43

stringI2 db "~ <- -> to move the paddle$"
countI2 dw 0
mousexI2 db 20

stringI3 db "~ 2 points for red$"
countI3 dw 0
mousexI3 db 26


stringI4 db "3 points for light blue$"
countI4 dw 0
mousexI4 db 26

stringI5 db "random points for other colours$"
countI5 dw 0
mousexI5 db 15

stringI6 db "Press 1 for main menu$"
countI6 dw 0
mousexI6 db 30

barystart db 1
baryend db 2
barx db 0
;//////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////DATA VARIABLES OF THE GAME////////////////////////////////

	    

count db 0

;Score bar
score_string db "SCORE:$"
score1122 dw 0

the_al_score db 0
the_ah_score db 0
breaking_brick db 0
score_x1122 db 14
count_of_loop dw ?


stringofname db "NAME:$"
name db ?
level_of_string db "LEVEL:$"
level db 49

brokenbricks dw 0

name_x db 30
level_x db 30

game_is_over db "GAME OVER$"

;Lives
num dw 20
lives_lost db 0

;////////////////////////////////////Paddle cordinates/////////////////////////////////
;Paddle coordinates
paddle_x_cordinate1 db 15
paddle_x_cordinate2 db 24
paddle_y_cordinate1 db 22
paddle_y_cordinate2 db 23

const_x_cordinate1 db 16
const_x_cordinate2 db 23
const_y_cordinate1 db 22
const_y_cordinate2 db 23

pixel1_paddlex dw ?    ;paddle coordinates in pixels 
pixel2_paddlex dw ?
pixel1_paddley dw ?
;////////////////////////////////-----------------------////////////////////////////


;BRICK CORDINATES OF THE GAME FROM ROW 1 TO ROW 7
;////////////////////////////////-----------------------////////////////////////////
;row1 bricks coordinates 1x3
row1ys db 3
row1ye db 4
row1_xa db 6 
row1_xb db 10
row1_xc db 14
row1_xd db 18
row1_xe db 22
row1_xf db 26
row1_xg db 30
y1_a db 0
y1_b db 0
y1_c db 0
y1_d db 0
y1_e db 0
y1_f db 0
y1_g db 0

;row2 bricks coordinates 
row2ys db 5
row2ye db 6
row2_xa db 8 
row2_xb db 12
row2_xc db 16 
row2_xd db 20
row2_xe db 24
row2_xf db 28
y2_a db 0
y2_b db 0
y2_c db 0
y2_d db 0
y2_e db 0
y2_f db 0
y2_g db 0

;row3 brick coordinates
;x coordinates same as row 1
row3ys db 7
row3ye db 8
y3_a db 0
y3_b db 0
y3_c db 0
y3_d db 0
y3_e db 0
y3_f db 0
y3_g db 0

;row4 brick coordinates
;x coordinates same as row 2
row4ys db 9
row4ye db 10
y4_a db 0
y4_b db 0
y4_c db 0
y4_d db 0
y4_e db 0
y4_f db 0

;row5 brick coordinates
;x coordinates same as row 1
row5ys db 11
row5ye db 12
y5_a db 0
y5_b db 0
y5_c db 0
y5_d db 0
y5_e db 0
y5_f db 0
y5_g db 0

;row6 brick coordinates
;x coordinates same as row 2
row6ys db 13
row6ye db 14
y6_a db 0
y6_b db 0
y6_c db 0
y6_d db 0
y6_e db 0
y6_f db 0

;row7 brick coordinates
;x coordinates same as row 1
row7ys db 15
row7ye db 16
y7_a db 0
y7_b db 0
y7_c db 0
y7_d db 0
y7_e db 0
y7_f db 0
y7_g db 0
;////////////////////////////////-----------------------////////////////////////////


;Boundary coordinates
boundary_xcod_1 db 0
boundary_xcod_2 db 39
boundary_ycod_1 db 0
boundary_ycod_2 db 24

;TIME
time_a_var db 1 ;to check if time has changed

time_aux_move db 1



;ball coordinates
ball_xcord db 20      ;coordinates in pixel
ball_ycord db 21

const_ball_xcordinate db 20      ;coordinates in pixel
const_ball_ycordinate db 21
ball_label db ?





;---------
x db ?
bx_var db ?







;////////////////////////////////////////////////////////code part///////////////////////////////////////////////
.code


jmp start

;CLEAR SCREEN KA PROC
CLEAR_SCREEN PROC              
	
			MOV AH,00h                 
			MOV AL,13h                
			INT 10h    	
		
			MOV AH,0Bh 				
			MOV BH,00h 			
			MOV BL,00h 					
			INT 10h    	
			
			RET
			
	CLEAR_SCREEN ENDp


;WELCOME KA PROC
welcome proc
mov ah,06h
mov al,3
mov bh, 01010000b
mov ch,7
mov cl,0
mov dh,10
mov dl,39
int 10h


;wellcome to brick breaker string112
mov si,0
mov cx,21
l112:
mov count112,cx
mov bh,0
mov ah,2
mov dh,9
mov dl,mousex112
int 10h

mov al,[string112+si]    ;ASCII code of Character 
mov bx,0
mov bl,15  
mov cx,1       ;repetition count112
mov ah,09h
int 10h

mov cx,count112
inc si
inc mousex112
LOOP l112







;---> 
mov si,0
mov cx,3
l113:
mov count113,cx
mov bh,0
mov ah,2
mov dh,12
mov dl,mousex113
int 10h

mov al,[string113+si]    ;ASCII code of Character 
mov bx,0
mov bl,15  
mov cx,1       ;repetition count112
mov ah,09h
int 10h

mov cx,count113
inc si
inc mousex113
LOOP l113





;-------------------------INPUT name-------------------------------------------
mov ah,2
mov dh, 12    ; row
mov dl, 12   ;column
int 10h
Loop1:
mov ah,0
int 16h
cmp ah,28
je endofwellcome
mov dl,al
mov ah,2
int 21h
jmp Loop1
ret
welcome endp



;///////////////////////////////////////////////////////////MAIN MENU///////////////////////////////////////////////////////
main_menu proc

call clear_screen



;top (well come to Brick breaker)
mov ah,06h
mov al,3
mov bh, 01000000b
mov ch,0
mov cl,0
mov dh,3
mov dl,39
int 10h

;New Game
mov ah,06h
mov al,3
mov bh, 00100000b
mov ch,5
mov cl,9
mov dh,8
mov dl,30
int 10h

;Resume
mov ah,06h
mov al,3
mov bh, 00100000b
mov ch,10
mov cl,12
mov dh,12
mov dl,31
int 10h

;instructions
mov ah,06h
mov al,3
mov bh, 00100000b
mov ch,13
mov cl,8
mov dh,16
mov dl,33
int 10h


;exit
mov ah,06h
mov al,3
mov bh, 00100000b
mov ch,17
mov cl,10
mov dh,20
mov dl,28
int 10h


;wellcome to brick breaker STRING
mov si,0
mov cx,24
l1:
mov cnt,cx
mov bh,0
mov ah,2
mov dh,2
mov dl,msex
int 10h

mov al,[string+si]    ;ASCII code of Character 
mov bx,0
mov bl,15   
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov cx,cnt
inc si
inc msex
LOOP l1




;New Game STRING
mov si,0
mov cx,20
l2:
mov cnt1,cx
mov bh,0
mov ah,2
mov dh,7
mov dl,msex1
int 10h

mov al,[string1+si]    ;ASCII code of Character 
mov bx,0
mov bl,15   
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov cx,cnt1
inc si
inc msex1
LOOP l2





;Resume STRING
mov si,0
mov cx,18
l3:
mov cnt2,cx
mov bh,0
mov ah,2
mov dh,11
mov dl,msex2
int 10h

mov al,[string2+si]    ;ASCII code of Character 
mov bx,0
mov bl,15   
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov cx,cnt2
inc si
inc msex2
LOOP l3


;Instructions STRING
mov si,0
mov cx,24
l4:
mov cnt3,cx
mov bh,0
mov ah,2
mov dh,15
mov dl,msex3
int 10h

mov al,[string3+si]    ;ASCII code of Character 
mov bx,0
mov bl,15   
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov cx,cnt3
inc si
inc msex3
LOOP l4





;Exit STRING
mov si,0
mov cx,16
l5:
mov cnt4,cx
mov bh,0
mov ah,2
mov dh,19
mov dl,msex4
int 10h

mov al,[string4+si]    ;ASCII code of Character 
mov bx,0
mov bl,15   
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov cx,cnt4
inc si
inc msex4
LOOP l5

              

ret
main_menu endp


;///////////////////////////////Instructions proc////////////////////////////////////////
Instructions_page proc
call clear_screen

mov si,0
mov cx,12
lI2:
mov countI1,cx
mov bh,0
mov ah,2
mov dh,4
mov dl,mousexI1
int 10h

mov al,[stringI1+si]    ;ASCII code of Character 
mov bx,0
mov bl,15   
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov cx,countI1
inc si
inc mousexI1
LOOP lI2





mov si,0
mov cx,26
lI3:
mov countI2,cx
mov bh,0
mov ah,2
mov dh,6
mov dl,mousexI2
int 10h

mov al,[stringI2+si]    ;ASCII code of Character 
mov bx,0
mov bl,15  
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov cx,countI2
inc si
inc mousexI2
LOOP lI3



mov si,0
mov cx,18
lI4:
mov countI3,cx
mov bh,0
mov ah,2
mov dh,8
mov dl,mousexI3
int 10h

mov al,[stringI3+si]    ;ASCII code of Character 
mov bx,0
mov bl,15   
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov cx,countI3
inc si
inc mousexI3
LOOP lI4



mov si,0
mov cx,23
lI5:
mov countI4,cx
mov bh,0
mov ah,2
mov dh,10
mov dl,mousexI4
int 10h

mov al,[stringI4+si]    ;ASCII code of Character 
mov bx,0
mov bl,15   
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov cx,countI4
inc si
inc mousexI4
LOOP lI5



mov si,0
mov cx,31
lI6:
mov countI5,cx
mov bh,0
mov ah,2
mov dh,12
mov dl,mousexI5
int 10h

mov al,[stringI5+si]    ;ASCII code of Character 
mov bx,0
mov bl,15 
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov cx,countI5
inc si
inc mousexI5
LOOP lI6




mov si,0
mov cx,21
lI7:
mov countI6,cx
mov bh,0
mov ah,2
mov dh,14
mov dl,mousexI6
int 10h

mov al,[stringI6+si]    ;ASCII code of Character 
mov bx,0
mov bl,15  
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov cx,countI6
inc si
inc mousexI6
LOOP lI7


mov ah,00h
int 16h
.if(al=='1')
jmp endofwellcome

.endif

ret
Instructions_page endp

;////////////////////////////////////////////LEVEL 1//////////////////////////////////////////////////////////
gamelevel1 proc
call CLEAR_SCREEN
call printtopbar
call score_printing_funtion
call name_level_function

call create_ball_function
call print_lives_function
call printing_block_function
call paddle_printing_function




call leveloneofgame


CMP lives_lost,3
JE jumptogameover





jumptogameover:
;CALL game_is_over
mov ah, 4ch
int 21h


ret
gamelevel1 endp


;////////////////////////////game procs//////////////////////
printtopbar PROC

mov ah, 6
mov al, 0
mov bh, 08H    
mov ch, barystart    
mov cl, barx    
add barx,40
mov dh, baryend    
mov dl, barx    
int 10h

sub barx,40
ret
printtopbar ENDP



;////////////////////////////////////Blocks printing//////////////////////////////////////////
;-----------------------------------------------------------
printing_block_function PROC

;PRINTING ROW 1 (LEVEL 1)
mov ah, 6
mov al, 0
mov bh, 01h     ;color
mov ch, row1ys     ;top row of window
mov cl, row1_xa     ;left most column of window
add row1_xa,3
mov dh, row1ye    ;Bottom row of window
mov dl, row1_xa     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 0bh     
mov ch, row1ys    
mov cl, row1_xb     
add row1_xb,3
mov dh, row1ye    
mov dl, row1_xb    
int 10h

mov ah, 6
mov al, 0
mov bh, 01h     
mov ch, row1ys    
mov cl, row1_xc    
add row1_xc,3
mov dh, row1ye   
mov dl, row1_xc     
int 10h

mov ah, 6
mov al, 0
mov bh, 0bh    
mov ch, row1ys     
mov cl, row1_xd     
add row1_xd,3
mov dh, row1ye  
mov dl, row1_xd     
int 10h

mov ah, 6
mov al, 0
mov bh, 01h     
mov ch, row1ys     
mov cl, row1_xe     
add row1_xe,3
mov dh, row1ye    
mov dl, row1_xe     
int 10h

mov ah, 6
mov al, 0
mov bh, 0bh    
mov ch, row1ys     
mov cl, row1_xf    
add row1_xf,3
mov dh, row1ye    
mov dl, row1_xf     
int 10h

mov ah, 6
mov al, 0
mov bh, 01h     
mov ch, row1ys     
mov cl, row1_xg     
add row1_xg,3
mov dh, row1ye    
mov dl, row1_xg     
int 10h

sub row1_xa,3
sub row1_xb,3
sub row1_xc,3
sub row1_xd,3
sub row1_xe,3
sub row1_xf,3
sub row1_xg,3

;PRINTING ROW 2 
mov ah, 6
mov al, 0
mov bh, 04h     
mov ch, row2ys    
mov cl, row2_xa     
add row2_xa,3
mov dh, row2ye    
mov dl, row2_xa  
int 10h

mov ah, 6
mov al, 0
mov bh, 0Eh
mov ch, row2ys     
mov cl, row2_xb    
add row2_xb,3
mov dh, row2ye    
mov dl, row2_xb    
int 10h

mov ah, 6
mov al, 0
mov bh, 04h     
mov ch, row2ys     
mov cl, row2_xc     
add row2_xc,3
mov dh, row2ye    
mov dl, row2_xc     
int 10h

mov ah, 6
mov al, 0
mov bh, 0Eh     
mov ch, row2ys     
mov cl, row2_xd     
add row2_xd,3
mov dh, row2ye    
mov dl, row2_xd     
int 10h

mov ah, 6
mov al, 0
mov bh, 04h     
mov ch, row2ys     
mov cl, row2_xe     
add row2_xe,3
mov dh, row2ye    
mov dl, row2_xe     
int 10h

mov ah, 6
mov al, 0
mov bh, 0Eh    
mov ch, row2ys     
mov cl, row2_xf     
add row2_xf,3
mov dh, row2ye    
mov dl, row2_xf     
int 10h

sub row2_xa,3
sub row2_xb,3
sub row2_xc,3
sub row2_xd,3
sub row2_xe,3
sub row2_xf,3

;PRINTING ROW 3
mov ah, 6
mov al, 0
mov bh, 01h     
mov ch, row3ys    
mov cl, row1_xa    
add row1_xa,3
mov dh, row3ye    
mov dl, row1_xa     
int 10h

mov ah, 6
mov al, 0
mov bh, 0bh     
mov ch, row3ys     
mov cl, row1_xb     
add row1_xb,3
mov dh, row3ye
mov dl, row1_xb    
int 10h

mov ah, 6
mov al, 0
mov bh, 01h     
mov ch, row3ys     
mov cl, row1_xc     
add row1_xc,3
mov dh, row3ye    
mov dl, row1_xc     
int 10h

mov ah, 6
mov al, 0
mov bh, 0bh     
mov ch, row3ys     
mov cl, row1_xd     
add row1_xd,3
mov dh, row3ye    
mov dl, row1_xd     
int 10h

mov ah, 6
mov al, 0
mov bh, 01h    
mov ch, row3ys    
mov cl, row1_xe    
add row1_xe,3
mov dh, row3ye   
mov dl, row1_xe    
int 10h

mov ah, 6
mov al, 0
mov bh, 0bh   
mov ch, row3ys     
mov cl, row1_xf    
add row1_xf,3
mov dh, row3ye    
mov dl, row1_xf    
int 10h

mov ah, 6
mov al, 0
mov bh, 01h     
mov ch, row3ys     
mov cl, row1_xg     
add row1_xg,3
mov dh, row3ye    
mov dl, row1_xg     
int 10h

sub row1_xa,3
sub row1_xb,3
sub row1_xc,3
sub row1_xd,3
sub row1_xe,3
sub row1_xf,3
sub row1_xg,3

;PRINTING ROW 4 
mov ah, 6
mov al, 0
mov bh, 04h     
mov ch, row4ys    
mov cl, row2_xa    
add row2_xa,3
mov dh, row4ye    
mov dl, row2_xa     
int 10h

mov ah, 6
mov al, 0
mov bh, 0Eh
mov ch, row4ys     
mov cl, row2_xb     
add row2_xb,3
mov dh, row4ye   
mov dl, row2_xb     
int 10h

mov ah, 6
mov al, 0
mov bh, 04h     
mov ch, row4ys    
mov cl, row2_xc     
add row2_xc,3
mov dh, row4ye  
mov dl, row2_xc  
int 10h

mov ah, 6
mov al, 0
mov bh, 0Eh    
mov ch, row4ys    
mov cl, row2_xd    
add row2_xd,3
mov dh, row4ye   
mov dl, row2_xd    
int 10h

mov ah, 6
mov al, 0
mov bh, 04h   
mov ch, row4ys    
mov cl, row2_xe  
add row2_xe,3
mov dh, row4ye   
mov dl, row2_xe     
int 10h

mov ah, 6
mov al, 0
mov bh, 0Eh    
mov ch, row4ys    
mov cl, row2_xf    
add row2_xf,3
mov dh, row4ye   
mov dl, row2_xf    
int 10h

sub row2_xa,3
sub row2_xb,3
sub row2_xc,3
sub row2_xd,3
sub row2_xe,3
sub row2_xf,3

;PRINTING ROW 5
mov ah, 6
mov al, 0
mov bh, 01h   
mov ch, row5ys     
mov cl, row1_xa     
add row1_xa,3
mov dh, row5ye   
mov dl, row1_xa    
int 10h

mov ah, 6
mov al, 0
mov bh, 0bh    
mov ch, row5ys   
mov cl, row1_xb   
add row1_xb,3
mov dh, row5ye    
mov dl, row1_xb     
int 10h

mov ah, 6
mov al, 0
mov bh, 01h     
mov ch, row5ys    
mov cl, row1_xc    
add row1_xc,3
mov dh, row5ye    
mov dl, row1_xc   
int 10h

mov ah, 6
mov al, 0
mov bh, 0bh     
mov ch, row5ys     
mov cl, row1_xd    
add row1_xd,3
mov dh, row5ye    
mov dl, row1_xd     
int 10h

mov ah, 6
mov al, 0
mov bh, 01h    
mov ch, row5ys    
mov cl, row1_xe     
add row1_xe,3
mov dh, row5ye   
mov dl, row1_xe     
int 10h

mov ah, 6
mov al, 0
mov bh, 0bh    
mov ch, row5ys    
mov cl, row1_xf     
add row1_xf,3
mov dh, row5ye    
mov dl, row1_xf     
int 10h

mov ah, 6
mov al, 0
mov bh, 01h    
mov ch, row5ys     
mov cl, row1_xg    
add row1_xg,3
mov dh, row5ye    
mov dl, row1_xg     
int 10h

sub row1_xa,3
sub row1_xb,3
sub row1_xc,3
sub row1_xd,3
sub row1_xe,3
sub row1_xf,3
sub row1_xg,3

;PRINTING ROW 6 
mov ah, 6
mov al, 0
mov bh, 04h    
mov ch, row6ys    
mov cl, row2_xa     
add row2_xa,3
mov dh, row6ye   
mov dl, row2_xa     
int 10h

mov ah, 6
mov al, 0
mov bh, 0Eh    
mov ch, row6ys    
mov cl, row2_xb    
add row2_xb,3
mov dh, row6ye
mov dl, row2_xb    
int 10h

mov ah, 6
mov al, 0
mov bh, 04h  
mov ch, row6ys   
mov cl, row2_xc     
add row2_xc,3
mov dh, row6ye   
mov dl, row2_xc   
int 10h

mov ah, 6
mov al, 0
mov bh, 0Eh     
mov ch, row6ys     
mov cl, row2_xd     
add row2_xd,3
mov dh, row6ye   
mov dl, row2_xd    
int 10h

mov ah, 6
mov al, 0
mov bh, 04h    
mov ch, row6ys    
mov cl, row2_xe   
add row2_xe,3
mov dh, row6ye  
mov dl, row2_xe   
int 10h

mov ah, 6
mov al, 0
mov bh, 0Eh    
mov ch, row6ys    
mov cl, row2_xf    
add row2_xf,3
mov dh, row6ye   
mov dl, row2_xf   
int 10h

sub row2_xa,3
sub row2_xb,3
sub row2_xc,3
sub row2_xd,3
sub row2_xe,3
sub row2_xf,3

;PRINTING ROW 7
mov ah, 6
mov al, 0
mov bh, 01h  
mov ch, row7ys    
mov cl, row1_xa     
add row1_xa,3
mov dh, row7ye   
mov dl, row1_xa   
int 10h

mov ah, 6
mov al, 0
mov bh, 0bh    
mov ch, row7ys    
mov cl, row1_xb   
add row1_xb,3
mov dh, row7ye   
mov dl, row1_xb     
int 10h

mov ah, 6
mov al, 0
mov bh, 01h    
mov ch, row7ys     
mov cl, row1_xc     
add row1_xc,3
mov dh, row7ye   
mov dl, row1_xc    
int 10h

mov ah, 6
mov al, 0
mov bh, 0bh     
mov ch, row7ys     
mov cl, row1_xd     
add row1_xd,3
mov dh, row7ye   
mov dl, row1_xd   
int 10h

mov ah, 6
mov al, 0
mov bh, 01h    
mov ch, row7ys    
mov cl, row1_xe   
add row1_xe,3
mov dh, row7ye    
mov dl, row1_xe
int 10h

mov ah, 6
mov al, 0
mov bh, 0bh    
mov ch, row7ys   
mov cl, row1_xf    
add row1_xf,3
mov dh, row7ye   
mov dl, row1_xf     
int 10h

mov ah, 6
mov al, 0
mov bh, 01h     
mov ch, row7ys     
mov cl, row1_xg     
add row1_xg,3
mov dh, row7ye   
mov dl, row1_xg     
int 10h

sub row1_xa,3
sub row1_xb,3
sub row1_xc,3
sub row1_xd,3
sub row1_xe,3
sub row1_xf,3
sub row1_xg,3
ret
printing_block_function ENDP




;-----------------------------------------------------------
paddle_printing_function PROC
mov ah, 6
mov al, 0
mov bh, 0aH     ;color
mov ch, paddle_y_cordinate1     ;top row of window
mov cl, paddle_x_cordinate1     ;left most column of window
mov dh, paddle_y_cordinate2    ;Bottom row of window
mov dl, paddle_x_cordinate2     ;Right most column of window
int 10h
ret
paddle_printing_function ENDP

;-----------------------------------------------------------




leveloneofgame PROC

Again:

;TIME
check_time:

mov ah,2CH ;get the system time
int 21h   ;CH=hrs,CL=min,DH,sec,DL=1/100 sec

CMP Dl,time_a_var
JE check_time 
 
mov time_a_var,dl

check_time2:
mov ah,2CH ;get the system time
int 21h   ;CH=hrs,CL=min,DH,sec,DL=1/100 sec

CMP Dl,time_a_var
JE check_time2 
 
mov time_a_var,dl


CALL Delete_BALL
CALL MOVE_BALL
CALL create_ball_function
CALL BRICK_BREAKING
CALL UPDATE_SCORE


CMP ball_label,5
JNE cont
CALL OVER
CALL RESET_paddle

mov al,const_ball_xcordinate       ;reset ball
mov ah,const_ball_ycordinate
mov ball_xcord,al
mov ball_ycord,ah

cont:
CMP lives_lost,3
JE exit

CMP brokenbricks,46
JE exit

mov ah,1
int 16h
JZ again

mov ah,0
int 16h

CMP ah,04bh
JE left

CMP ah,4dh
JE right

CMP al,08
JE exit

JMP again

left:
CALL MOVING_LEFT
JMP again

right:
CALL MOVING_RIGHT
JMP again

exit:
RET
leveloneofgame ENDP
;------------------------------------------------------------

;GAME LEVEL FUNCTIONSSSSSS
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
MOVE_BALL PROC

mov al,ball_xcord
mov bl,ball_ycord

CMP al,paddle_x_cordinate1
JB compare2
CMP al,paddle_x_cordinate2
JA compare2
CMP bl,paddle_y_cordinate1
JB compare2
CMP ball_label,4
JE label3
CMP ball_label,2
JMP label1

compare2:
CMP bl,2
JA compare3
CMP ball_label,1
JE label2
CMP ball_label,3
JMP label4

compare3:
CMP al,1
JA compare4
CMP ball_label,3
JE label1
CMP ball_label,4
JMP label2


compare4:
CMP al,39
JB compare5
CMP ball_label,1
JE label3
CMP ball_label,2
JMP label4

compare5:
CMP bl,23
JB compare6
CMP ball_label,2
JMP label1
CMP ball_label,4
JMP label3

compare6:
CMP bl,paddle_y_cordinate1
JNE labels
mov ball_label,5
JMP moved

labels:
CMP ball_label,1
JNE next1
JMP label1

next1:
CMP ball_label,2
JNE next2
JMP label2

next2:
CMP ball_label,3
JNE label4
JMP label3

timecheck2:
mov ah,2CH ;get the system time
int 21h   ;CH=hrs,CL=min,DH,sec,DL=1/100 sec

CMP DH,time_aux_move
JNE timecheck2 
 
mov time_aux_move,dH

label1:
add ball_xcord,1
sub ball_ycord,1
mov ball_label,1
JMP moved

label2:
add ball_xcord,1
add ball_ycord,1
mov ball_label,2
JMP moved

label3:
sub ball_xcord,1
sub ball_ycord,1
mov ball_label,3
JMP moved

label4:
sub ball_xcord,1
add ball_ycord,1
mov ball_label,4
JMP moved


moved:

MOVE_BALL ENDP

;//////////////////////////////////////////////////////
;-----------------------------------------------------------
BRICK_BREAKING PROC

;blue score1122:3,cyan score1122:1,yellow score1122:2,red score1122:4

mov al,ball_xcord
mov bl,ball_ycord

mov breaking_brick,0
mov ah,row1_xa
mov bx_var,1
mov x,ah
CALL BREAK_ODD
CMP breaking_brick,1
JNE stop1

STOP1:
mov breaking_brick,0
mov ah,row1_xb
mov bx_var,2
mov x,ah
CALL BREAK_ODD
CMP breaking_brick,1
JNE stop2

stop2:
mov breaking_brick,0
mov ah,row1_xc
mov bx_var,3
mov x,ah
CALL BREAK_ODD
CMP breaking_brick,1
JNE stop3

stop3:
mov breaking_brick,0
mov ah,row1_xd
mov bx_var,4
mov x,ah
CALL BREAK_ODD
CMP breaking_brick,1
JNE stop4


stop4:
mov breaking_brick,0
mov ah,row1_xe
mov bx_var,5
mov x,ah
CALL BREAK_ODD
CMP breaking_brick,1
JNE stop5


stop5:
mov breaking_brick,0
mov ah,row1_xf
mov bx_var,6
mov x,ah
CALL BREAK_ODD
CMP breaking_brick,1
JNE stop6


stop6:
mov breaking_brick,0
mov ah,row1_xg
mov bx_var,7
mov x,ah
CALL BREAK_ODD
CMP breaking_brick,1
JNE stop7


stop7:
mov breaking_brick,0
mov ah,row2_xa
mov bx_var,1
mov x,ah
CALL BREAK_EVEN
CMP breaking_brick,1
JE stop8


stop8:
mov breaking_brick,0
mov ah,row2_xb
mov bx_var,2
mov x,ah
CALL BREAK_EVEN
CMP breaking_brick,1
JE stop9


stop9:
mov breaking_brick,0
mov ah,row2_xc
mov bx_var,3
mov x,ah
CALL BREAK_EVEN
CMP breaking_brick,1
JE stop10


stop10:
mov breaking_brick,0
mov ah,row2_xd
mov bx_var,4
mov x,ah
CALL BREAK_EVEN
CMP breaking_brick,1
JE stop11


stop11:
mov breaking_brick,0
mov ah,row2_xe
mov bx_var,5
mov x,ah
CALL BREAK_EVEN
CMP breaking_brick,1
JE stop12


stop12:
mov breaking_brick,0
mov ah,row2_xf
mov bx_var,6
mov x,ah
CALL BREAK_EVEN
CMP breaking_brick,1
JE stop13


stop13:

ret
BRICK_BREAKING ENDP


;--------------------------------------------------------
create_ball_function PROC

mov ah, 6
mov al, 0
mov bh, 0dH     ;color
mov ch, ball_ycord     ;top row of window
mov cl, ball_xcord     ;left most column of window
mov dh, ball_ycord    ;Bottom row of window
mov dl, ball_xcord     ;Right most column of window
int 10h

ret
create_ball_function ENDP
;------------------------------------------------------------------------------
;-----------------------------------------------------------
RESET_PADDLE PROC

mov ah, 6
mov al, 0
mov bh, 08h     ;color
mov ch, paddle_y_cordinate1     ;top row of window
mov cl, paddle_x_cordinate1     ;left most column of window
mov dh, paddle_y_cordinate2    ;Bottom row of window
mov dl, paddle_x_cordinate2     ;Right most column of window
int 10h

mov al,const_x_cordinate1    ;reset paddle
mov ah,const_y_cordinate1
mov paddle_x_cordinate1,al
mov paddle_y_cordinate1,ah
mov al,const_x_cordinate2
mov ah,const_y_cordinate2
mov paddle_x_cordinate2,al
mov paddle_y_cordinate2,ah

CALL paddle_printing_function
ret
RESET_PADDLE ENDP
;-----------------------------------------------------------
;--------------------------------------------------------------
UPDATE_SCORE PROC

mov ax,score1122

SHL ax,1           
SHL ax,1
SHL ax,1 
SHL ax,1

SHR al,1
SHR al,1                
SHR al,1
SHR al,1

mov the_al_score,al
mov the_ah_score,ah

add the_al_score,48
add the_ah_score,48

mov ax,0
mov bh,0
mov ah,2
mov dh,1
mov dl,score_x1122
int 10h

mov al,the_ah_score    ;ASCII code of Character 
mov bx,0
mov bl,15   ;Green color
mov cx,1       ;repetition count
mov ah,09h
int 10h

inc score_x1122

mov ax,0
mov bh,0
mov ah,2
mov dh,1
mov dl,score_x1122
int 10h

mov al,the_al_score    ;ASCII code of Character 
mov bx,0
mov bl,15   ;Green color
mov cx,1       ;repetition count
mov ah,09h
int 10h

dec score_x1122

ret

UPDATE_SCORE ENDP
;-----------------------------------------------------------

;-----------------------------------------------------------
DELETE_BALL PROC

mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, ball_ycord     ;top row of window
mov cl, ball_xcord     ;left most column of window
mov dh, ball_ycord    ;Bottom row of window
mov dl, ball_xcord     ;Right most column of window
int 10h

ret
DELETE_BALL ENDP






;-----------------------------------------------------------
MOVING_LEFT PROC

mov bl,paddle_x_cordinate1
dec bl

CMP bl,0
JE STOP

mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, paddle_y_cordinate1     ;top row of window
mov cl, paddle_x_cordinate1     ;left most column of window
mov dh, paddle_y_cordinate2    ;Bottom row of window
mov dl, paddle_x_cordinate2     ;Right most column of window
int 10h

dec paddle_x_cordinate1
dec paddle_x_cordinate2

;printing the new paddle
mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, paddle_y_cordinate1     ;top row of window
mov cl, paddle_x_cordinate1     ;left most column of window
mov dh, paddle_y_cordinate2    ;Bottom row of window
mov dl, paddle_x_cordinate2     ;Right most column of window
int 10h

STOP:
ret
MOVING_LEFT ENDP

;-----------------------------------------------------------
MOVING_RIGHT PROC

mov bl,paddle_x_cordinate2
inc bl

CMP bl,39
JE STOP

mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, paddle_y_cordinate1     ;top row of window
mov cl, paddle_x_cordinate1     ;left most column of window
mov dh, paddle_y_cordinate2    ;Bottom row of window
mov dl, paddle_x_cordinate2     ;Right most column of window
int 10h

inc paddle_x_cordinate1
inc paddle_x_cordinate2

;printing the new paddle
mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, paddle_y_cordinate1     ;top row of window
mov cl, paddle_x_cordinate1     ;left most column of window
mov dh, paddle_y_cordinate2    ;Bottom row of window
mov dl, paddle_x_cordinate2     ;Right most column of window
int 10h

STOP:
ret
MOVING_RIGHT ENDP

;------------------------------------------------------------------------------------------

OVER PROC

inc lives_lost
sub num,10
MOV CX, num    ;x-cordinate (column)
MOV DX, 13    ;y-cordinate (row)
MOV AL, 5  ;color
MOV AH, 0CH 
INT 10H
inc num
MOV CX, num    ;x-cordinate (column)
MOV DX, 13    ;y-cordinate (row)
MOV AL, 5  ;color
MOV AH, 0CH 
INT 10H
add num,2
MOV CX, num    ;x-cordinate (column)
MOV DX, 13    ;y-cordinate (row)
MOV AL, 5  ;color
MOV AH, 0CH 
INT 10H
inc num
MOV CX, num    ;x-cordinate (column)
MOV DX, 13    ;y-cordinate (row)
MOV AL, 5  ;color
MOV AH, 0CH 
INT 10H

sub num,4
MOV CX, num    ;x-cordinate (column)
MOV DX, 14    ;y-cordinate (row)
MOV AL, 5  ;color
MOV AH, 0CH 
INT 10H
inc num
MOV CX, num    ;x-cordinate (column)
MOV DX, 14    ;y-cordinate (row)
MOV AL, 5  ;color
MOV AH, 0CH 
INT 10H
inc num
MOV CX, num    ;x-cordinate (column)
MOV DX, 14    ;y-cordinate (row)
MOV AL, 5  ;color
MOV AH, 0CH 
INT 10H
inc num
MOV CX, num    ;x-cordinate (column)
MOV DX, 14    ;y-cordinate (row)
MOV AL, 5  ;color
MOV AH, 0CH 
INT 10H
inc num
MOV CX, num    ;x-cordinate (column)
MOV DX, 14    ;y-cordinate (row)
MOV AL, 5  ;color
MOV AH, 0CH 
INT 10H

sub num,4
MOV CX, num   ;x-cordinate (column)
MOV DX, 15    ;y-cordinate (row)
MOV AL, 5  ;color
MOV AH, 0CH 
INT 10H
inc num
MOV CX, num    ;x-cordinate (column)
MOV DX, 15    ;y-cordinate (row)
MOV AL, 5  ;color
MOV AH, 0CH 
INT 10H
inc num
MOV CX, num    ;x-cordinate (column)
MOV DX, 15    ;y-cordinate (row)
MOV AL, 5  ;color
MOV AH, 0CH 
INT 10H
inc num
MOV CX, num    ;x-cordinate (column)
MOV DX, 15    ;y-cordinate (row)
MOV AL, 5  ;color
MOV AH, 0CH 
INT 10H
inc num
MOV CX, num    ;x-cordinate (column)
MOV DX, 15    ;y-cordinate (row)
MOV AL, 5  ;color
MOV AH, 0CH 
INT 10H

sub num,3
MOV CX, num    ;x-cordinate (column)
MOV DX, 16    ;y-cordinate (row)
MOV AL, 5  ;color
MOV AH, 0CH 
INT 10H
inc num
MOV CX, num    ;x-cordinate (column)
MOV DX, 16    ;y-cordinate (row)
MOV AL, 5  ;color
MOV AH, 0CH 
INT 10H
inc num
MOV CX, num    ;x-cordinate (column)
MOV DX, 16    ;y-cordinate (row)
MOV AL, 5  ;color
MOV AH, 0CH 
INT 10H

dec num
MOV CX, num    ;x-cordinate (column)
MOV DX, 17    ;y-cordinate (row)
MOV AL, 5  ;color
MOV AH, 0CH 
INT 10H

ret
OVER ENDP

;-----------------------------------------------------------

;///////////////////////////------------------------------------------------------///////////////////////////////////////
BREAK_ODD PROC

;mark brick as broken aka 1
;reset brick broke after every cinditions has been checked

CMP al,x
JB moved1
add x,3
CMP al,x
JA moved1

CMP bx_var,1
JNE c1
CMP y1_a,1
JE compare12

c1:
CMP bx_var,2
JNE c2
CMP y1_b,1
JE compare12

c2:
CMP bx_var,3
JNE c3
CMP y1_c,1
JE compare12

c3:
CMP bx_var,4
JNE c4
CMP y1_d,1
JE compare12

c4:
CMP bx_var,5
JNE c5
CMP y1_e,1
JE compare12

c5:
CMP bx_var,6
JNE c6
CMP y1_f,1
JE compare12

c6:
CMP bx_var,7
JNE c7
CMP y1_g,1
JE compare12

c7:
CMP bl,row1ys       
JB compare12
CMP bl,row1ye
JA compare12
sub x,3
delete_block_macro x,row1ys,row1ye 
add score1122,1
mov breaking_brick,1

CMP ball_label,1
JNE k1
mov ball_label,2

k1:
CMP ball_label,3
JNE k2
mov ball_label,4

k2:

;CALL MOVE_BALL
 
CMP bx_var,1
JNE n1                          
mov y1_a,1
inc brokenbricks
JMP moved1

n1:                 
CMP bx_var,2 
JNE n2                
mov y1_b,1
inc brokenbricks
JMP moved1

n2:
CMP bx_var,3
JNE n3
mov y1_c,1
inc brokenbricks
JMP moved1

n3:
CMP bx_var,4
JNE n4
mov y1_d,1
inc brokenbricks
JMP moved1

n4:
CMP bx_var,5
JNE n5
mov y1_e,1
inc brokenbricks
JMP moved1

n5:
CMP bx_var,6
JNE n6
mov y1_f,1
inc brokenbricks
JMP moved1

n6:
CMP bx_var,7
JNE n7
mov y1_g,1
inc brokenbricks
JMP moved1

n7:
JMP moved1


compare12:
CMP bx_var,1
JNE c11
CMP y3_a,1
JE compare13

c11:
CMP bx_var,2
JNE c12
CMP y3_b,1
JE compare13

c12:
CMP bx_var,3
JNE c13
CMP y3_c,1
JE compare13

c13:
CMP bx_var,4
JNE c14
CMP y3_d,1
JE compare13

c14:
CMP bx_var,5
JNE c15
CMP y3_e,1
JE compare13

c15:
CMP bx_var,6
JNE c16
CMP y3_f,1
JE compare13

c16:
CMP bx_var,7
JNE c17
CMP y3_g,1
JE compare13

c17:
CMP bl,row3ys
JB compare13
CMP bl,row3ye
JA compare13
sub x,3
delete_block_macro x,row3ys,row3ye
add score1122,1
mov breaking_brick,1
CMP ball_label,1
JNE k11
mov ball_label,2

k11:
CMP ball_label,3
JNE k12
mov ball_label,4

k12:


;CALL MOVE_BALL

CMP bx_var,1
JNE n8                          
mov y3_a,1
inc brokenbricks
JMP moved1

n8:                 
CMP bx_var,2 
JNE n9                
mov y3_b,1
inc brokenbricks
JMP moved1

n9:
CMP bx_var,3
JNE n10
mov y3_c,1
inc brokenbricks
JMP moved1

n10:
CMP bx_var,4
JNE n11
mov y3_d,1
inc brokenbricks
JMP moved1

n11:
CMP bx_var,5
JNE n12
mov y3_e,1
inc brokenbricks
JMP moved1

n12:
CMP bx_var,6
JNE n13
mov y3_f,1
inc brokenbricks
JMP moved1

n13:
CMP bx_var,7
JNE n14
mov y3_g,1
inc brokenbricks
JMP moved1

n14:
JMP moved1


compare13:
CMP bx_var,1
JNE c21
CMP y5_a,1
JE compare14

c21:
CMP bx_var,2
JNE c22
CMP y5_b,1
JE compare14

c22:
CMP bx_var,3
JNE c23
CMP y5_c,1
JE compare14

c23:
CMP bx_var,4
JNE c24
CMP y5_d,1
JE compare14

c24:
CMP bx_var,5
JNE c25
CMP y5_e,1
JE compare14

c25:
CMP bx_var,6
JNE c26
CMP y5_f,1
JE compare14

c26:
CMP bx_var,7
JNE c27
CMP y5_g,1
JE compare12

c27:
CMP bl,row5ys
JB compare14
CMP bl,row5ye
JA compare14
sub x,3
delete_block_macro x,row5ys,row5ye 
add score1122,1
mov breaking_brick,1
CMP ball_label,1
JNE k21
mov ball_label,2

k21:
CMP ball_label,3
JNE k22
mov ball_label,4

k22:


;CALL MOVE_BALL

CMP bx_var,1
JNE n15                          
mov y5_a,1
inc brokenbricks
JMP moved1

n15:                 
CMP bx_var,2 
JNE n16                
mov y5_b,1
inc brokenbricks
JMP moved1

n16:
CMP bx_var,3
JNE n17
mov y5_c,1
inc brokenbricks
JMP moved1

n17:
CMP bx_var,4
JNE n18
mov y5_d,1
inc brokenbricks
JMP moved1

n18:
CMP bx_var,5
JNE n19
mov y5_e,1
inc brokenbricks
JMP moved1

n19:
CMP bx_var,6
JNE n20
mov y5_f,1
inc brokenbricks
JMP moved1

n20:
CMP bx_var,7
JNE n21
mov y5_g,1
inc brokenbricks
JMP moved1

n21:
JMP moved1

compare14:
CMP bx_var,1
JNE c31
CMP y7_a,1
JE moved1

c31:
CMP bx_var,2
JNE c32
CMP y7_b,1
JE moved1

c32:
CMP bx_var,3
JNE c33
CMP y7_c,1
JE moved1

c33:
CMP bx_var,4
JNE c34
CMP y7_d,1
JE moved1

c34:
CMP bx_var,5
JNE c35
CMP y7_e,1
JE moved1

c35:
CMP bx_var,6
JNE c36
CMP y7_f,1
JE moved1

c36:
CMP bx_var,7
JNE c37
CMP y7_g,1
JE moved1

c37:
CMP bl,row7ys
JB moved1
CMP bl,row7ye
JA moved1
sub x,3
delete_block_macro x,row7ys,row7ye
add score1122,1
mov breaking_brick,1
CMP ball_label,1
JNE k41
mov ball_label,2

k41:
CMP ball_label,3
JNE k42
mov ball_label,4

k42:

mov ball_label,3
; CALL MOVE_BALL
CMP bx_var,1
JNE n22                          
mov y7_a,1
inc brokenbricks
JMP moved1

n22:                 
CMP bx_var,2 
JNE n23                
mov y7_b,1
inc brokenbricks
JMP moved1

n23:
CMP bx_var,3
JNE n24
mov y7_c,1
inc brokenbricks
JMP moved1

n24:
CMP bx_var,4
JNE n25
mov y7_d,1
inc brokenbricks
JMP moved1

n25:
CMP bx_var,5
JNE n26
mov y7_e,1
inc brokenbricks
JMP moved1

n26:
CMP bx_var,6
JNE n27
mov y7_f,1
inc brokenbricks
JMP moved1

n27:
CMP bx_var,7
JNE moved1
mov y7_g,1
inc brokenbricks
JMP moved1

moved1:
ret
BREAK_ODD ENDP


;///////////////////////////////////////////////////////////////////////////////////
;-----------------------------------------------------------
BREAK_EVEN PROC

CMP al,x
JB moved2
add x,3
CMP al,x
JA moved2

CMP bx_var,1
JNE n1
CMP y2_a,1
JE compare22

n1:
CMP bx_var,2
JNE n2
CMP y2_b,1
JE compare22

n2:
CMP bx_var,3
JNE n3
CMP y2_c,1
JE compare22

n3:
CMP bx_var,4
JNE n4
CMP y2_d,1
JE compare22

n4:
CMP bx_var,5
JNE n5
CMP y2_e,1
JE compare22

n5:
CMP bx_var,6
JNE n6
CMP y2_f,1
JE compare22

n6:
CMP bl,row2ys
JB compare22
CMP bl,row2ye
JA compare22
sub x,3
delete_block_macro x,row2ys,row2ye 
mov breaking_brick,1
add score1122,2
CMP ball_label,1
JNE k51
mov ball_label,2

k51:
CMP ball_label,3
JNE k52
mov ball_label,4

k52:

;CALL MOVE_BALL
CMP bx_var,1
JNE n28                          
mov y2_a,1
inc brokenbricks
JMP moved2

n28:                 
CMP bx_var,2 
JNE n29                
mov y2_b,1
inc brokenbricks
JMP moved2

n29:
CMP bx_var,3
JNE n30
mov y2_c,1
inc brokenbricks
JMP moved2

n30:
CMP bx_var,4
JNE n31
mov y2_d,1
inc brokenbricks
JMP moved2

n31:
CMP bx_var,5
JNE n32
mov y2_e,1
inc brokenbricks
JMP moved2

n32:
CMP bx_var,6
JNE moved2
mov y2_f,1
inc brokenbricks
JMP moved2

compare22:
CMP bx_var,1
JNE n11
CMP y4_a,1
JE compare23

n11:
CMP bx_var,2
JNE n12
CMP y4_b,1
JE compare23

n12:
CMP bx_var,3
JNE n13
CMP y4_c,1
JE compare23

n13:
CMP bx_var,4
JNE n14
CMP y4_d,1
JE compare23

n14:
CMP bx_var,5
JNE n15
CMP y4_e,1
JE compare23

n15:
CMP bx_var,6
JNE n16
CMP y4_f,1
JE compare23

n16:
CMP bl,row4ys
JB compare23
CMP bl,row4ye
JA compare23
sub x,3
delete_block_macro x,row4ys,row4ye 
add score1122,2
mov breaking_brick,1
CMP ball_label,1
JNE k61
mov ball_label,2

k61:
CMP ball_label,3
JNE k62
mov ball_label,4

k62:

;CALL MOVE_BALL
CMP bx_var,1
JNE n33                          
mov y4_a,1
inc brokenbricks
JMP moved2

n33:                 
CMP bx_var,2 
JNE n34                
mov y4_b,1
inc brokenbricks
JMP moved2

n34:
CMP bx_var,3
JNE n35
mov y4_c,1
inc brokenbricks
JMP moved2

n35:
CMP bx_var,4
JNE n36
mov y4_d,1
inc brokenbricks
JMP moved2

n36:
CMP bx_var,5
JNE n37
mov y4_e,1
inc brokenbricks
JMP moved2

n37:
CMP bx_var,6
JNE moved2
mov y4_f,1
inc brokenbricks
JMP moved2

compare23:
CMP bx_var,1
JNE n21
CMP y6_a,1
JE moved2

n21:
CMP bx_var,2
JNE n22
CMP y6_b,1
JE moved2

n22:
CMP bx_var,3
JNE n23
CMP y6_c,1
JE moved2

n23:
CMP bx_var,4
JNE n24
CMP y6_d,1
JE moved2

n24:
CMP bx_var,5
JNE n25
CMP y6_e,1
JE moved2

n25:
CMP bx_var,6
JNE n26
CMP y6_f,1
JE moved2

n26:
CMP bl,row6ys
JB moved2
CMP bl,row6ye
JA moved2
sub x,3
delete_block_macro x,row6ys,row6ye 
add score1122,2
mov breaking_brick,1
CMP ball_label,1
JNE k71
mov ball_label,2

k71:
CMP ball_label,3
JNE k72
mov ball_label,4

k72:

;CALL MOVE_BALL
CMP bx_var,1
JNE n38                          
mov y6_a,1
inc brokenbricks
JMP moved2

n38:                 
CMP bx_var,2 
JNE n39                
mov y6_b,1
inc brokenbricks
JMP moved2

n39:
CMP bx_var,3
JNE n40
mov y6_c,1
inc brokenbricks
JMP moved2

n40:
CMP bx_var,4
JNE n41
mov y6_d,1
inc brokenbricks
JMP moved2

n41:
CMP bx_var,5
JNE n42
mov y6_e,1
inc brokenbricks
JMP moved2

n42:
CMP bx_var,6
JNE moved2
mov y6_f,1
inc brokenbricks
JMP moved2

moved2:

ret
BREAK_EVEN ENDP
;---------------------------------------------------------------------------------

;-----------------------------------------------------------
score_printing_funtion PROC

mov si,0
mov cx,6
l1:
mov count_of_loop,cx
mov bh,0
mov ah,2
mov dh,1
mov dl,score_x1122
int 10h

mov al,[score_string+si]    ;ASCII code of Character 
mov bx,0
mov bl,15   ;Green color
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov cx,count_of_loop
inc si
inc score_x1122
LOOP l1

ret
score_printing_funtion ENDP

;-----------------------------------------------------------
;-----------------------------------------------------------
name_level_function PROC

mov si,0
mov cx,5
PrintNAME:
mov count_of_loop,cx
mov bh,0
mov ah,2
mov dh,1
mov dl,name_x
int 10h

mov al,[stringofname+si]    ;ASCII code of Character 
mov bx,0
mov bl,15   ;Green color
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov cx,count_of_loop
inc si
inc name_x
LOOP PrintNAME

mov si,0
mov cx,6
PrintLEVEL:
mov count_of_loop,cx
mov bh,0
mov ah,2
mov dh,2
mov dl,level_x
int 10h

mov al,[level_of_string+si]    ;ASCII code of Character 
mov bx,0
mov bl,15   ;Green color
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov cx,count_of_loop
inc si
inc level_x
LOOP PrintLevel

ret
name_level_function ENDP



;/////////////////////////////////////////////////////////////////////////////////
;-----------------------------------------------------------
print_lives_function PROC

mov cx,3
Loop1:
mov bx,cx

MOV CX, num    ;x-cordinate (column)
MOV DX, 13    ;y-cordinate (row)
MOV AL, 12  ;color
MOV AH, 0CH 
INT 10H
inc num
MOV CX, num    ;x-cordinate (column)
MOV DX, 13    ;y-cordinate (row)
MOV AL, 12  ;color
MOV AH, 0CH 
INT 10H
add num,2
MOV CX, num    ;x-cordinate (column)
MOV DX, 13    ;y-cordinate (row)
MOV AL, 12  ;color
MOV AH, 0CH 
INT 10H
inc num
MOV CX, num    ;x-cordinate (column)
MOV DX, 13    ;y-cordinate (row)
MOV AL, 12  ;color
MOV AH, 0CH 
INT 10H

sub num,4
MOV CX, num    ;x-cordinate (column)
MOV DX, 14    ;y-cordinate (row)
MOV AL, 12  ;color
MOV AH, 0CH 
INT 10H
inc num
MOV CX, num    ;x-cordinate (column)
MOV DX, 14    ;y-cordinate (row)
MOV AL, 12  ;color
MOV AH, 0CH 
INT 10H
inc num
MOV CX, num    ;x-cordinate (column)
MOV DX, 14    ;y-cordinate (row)
MOV AL, 12  ;color
MOV AH, 0CH 
INT 10H
inc num
MOV CX, num    ;x-cordinate (column)
MOV DX, 14    ;y-cordinate (row)
MOV AL, 12  ;color
MOV AH, 0CH 
INT 10H
inc num
MOV CX, num    ;x-cordinate (column)
MOV DX, 14    ;y-cordinate (row)
MOV AL, 12  ;color
MOV AH, 0CH 
INT 10H

sub num,4
MOV CX, num   ;x-cordinate (column)
MOV DX, 15    ;y-cordinate (row)
MOV AL, 12  ;color
MOV AH, 0CH 
INT 10H
inc num
MOV CX, num    ;x-cordinate (column)
MOV DX, 15    ;y-cordinate (row)
MOV AL, 12  ;color
MOV AH, 0CH 
INT 10H
inc num
MOV CX, num    ;x-cordinate (column)
MOV DX, 15    ;y-cordinate (row)
MOV AL, 12  ;color
MOV AH, 0CH 
INT 10H
inc num
MOV CX, num    ;x-cordinate (column)
MOV DX, 15    ;y-cordinate (row)
MOV AL, 12  ;color
MOV AH, 0CH 
INT 10H
inc num
MOV CX, num    ;x-cordinate (column)
MOV DX, 15    ;y-cordinate (row)
MOV AL, 12  ;color
MOV AH, 0CH 
INT 10H

sub num,3
MOV CX, num    ;x-cordinate (column)
MOV DX, 16    ;y-cordinate (row)
MOV AL, 12  ;color
MOV AH, 0CH 
INT 10H
inc num
MOV CX, num    ;x-cordinate (column)
MOV DX, 16    ;y-cordinate (row)
MOV AL, 12  ;color
MOV AH, 0CH 
INT 10H
inc num
MOV CX, num    ;x-cordinate (column)
MOV DX, 16    ;y-cordinate (row)
MOV AL, 12  ;color
MOV AH, 0CH 
INT 10H

dec num
MOV CX, num    ;x-cordinate (column)
MOV DX, 17    ;y-cordinate (row)
MOV AL, 12  ;color
MOV AH, 0CH 
INT 10H

add num,7
mov cx,bx
dec cx
JNE Loop1

ret
print_lives_function ENDP
;---------------------------////////////////////////////------------------------
;-----------------------------------------------------------

;-----------------------------------------------------------





;--------------------------------------------------------------------------------------------
;START KA LABEL
start:

mov ax,@data
mov ds,ax
mov ax,0

mov ah, 0
mov al, 13h    ;320x200
int 10h



call welcome
endofwellcome:
CALL clear_screen
end_of_main_menu_after_instructions:
call main_menu

mov ah,00h
int 16h
.if (al=='3')
  call Instructions_page
  
.elseif(al =='1')
  call gamelevel1
  
.endif


exit1:

mov ah,4ch
int 21h


end


