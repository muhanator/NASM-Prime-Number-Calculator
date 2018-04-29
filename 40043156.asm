section .data
	number db 5
	answer db 1; 1 means the number is prime(TRUE), 0 means number is not prime (FALSE)

section .bss
section .text

	global _start

_start:

	mov esi, number 	; get the offset of number and put into esi
keith: 
	mov eax, 0		; clearing the eax register
	mov al, [esi]		; get the number from memory and move it into al
	mov dl, al		; put that number into dl
	mov bl, 2		; bl holds divisor which will start from 2 and inccrement each time
	mov cl,1		;move to answer to cl
	jmp CheckCondition	;check if the divisor is less than the number to continue execution

loopy: 
	
	div bl			; ax/bl with quot in al and rem in ah  
				;to determine whether the remainder is 0
	and ax,1111111100000000b; isolate the rem in ah with a AND mask 
				;to determine whether the remainder is 0
	
	cmp ah,0		;check if the remainder is 0
	je primeIsFalse 	;if remainder is 0 it jumps to primeIsFalse
				
	inc bl			;check the next divisor and keep looping
	mov eax,0		;reset accumulator 
	mov al,[esi]		;move number back into esi
	jmp CheckCondition	;jump to compare divisor and number to see 
				;if loop should contiue to execute

primeIsFalse: 

	mov cl,0		;clear the cl register
	mov [answer],cl		;move cl to answer
	inc bl			;increment the divisor 
	mov eax,0		;reset the accumulator
	mov al,[esi]		;move number back into al
	jmp loopy		;jump to loopy to begin while loop


CheckCondition:

	cmp bl,al		;compare divisor and number
	jl loopy		;jump back to while loop and see if prime
	jmp done		;jump to done if divisor is greater than number
	
done:

	mov eax,1          	; The system exit
        mov ebx,0           	; Exit with 0 return code
        int 80h










	

	
	
	
	
	

	
	


