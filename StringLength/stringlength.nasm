;we want to change our program so that it display all the string not only few bytes
section .data
msg db 'CalculateMe', 0Ah; initialise a variable msg with a string

section .text
global _start

_start:
	mov ebx, msg 	 ;addresse of msg to ebx
	mov eax, ebx 	 ;both ebx and eax points to same memory address

nextchar:
	cmp byte[eax], 0 ;comapre the first byte to zero
	jz finished      ;if it's 0 then finish (no string)
	inc eax          ;increment eax
	jmp nextchar	 ;recheck the nex byte(char)

finished:
	sub eax, ebx     ;substract the number of bytes between eax and ebx
				     ;result will be saved to eax
				     ;eax now equals the number of bytes in our string
	
	mov edx, eax     ;pass number of bytes
	mov ecx, msg     ;mov msg to ecx
	mov ebx, 1		 ;stdout	
	mov eax, 4		 ;invoke SYS_WRITE
	int 80h

	mov ebx, 0		;same as return 0 in c(no error)
	mov eax, 1		;invoke sys_exit (kernel opcode 1)
	int 80h			     



	