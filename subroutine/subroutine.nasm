section .data
msg db 'hello, world!!', 0ah ;remember 0Ah is line feed ('\n')

section .text
global _start

_start:
	mov eax, msg
	call strlen   ;call our function

	mov edx, eax
	mov ecx, msg
	mov ebx, 1
	mov eax, 4
	int 80h

	mov ebx, 0
	mov eax, 1
	int 80h

strlen:
	push ebx      ;push ebx to stack to preserve it
	mov ebx, eax  ;give the value of eax to ebx to compare later

nextchar:
	cmp byte[eax], 0
	jz finished
	inc eax
	jmp nextchar

finished:
	sub eax, ebx
	pop ebx       ;pop the value from stack into ebx
	ret			  ;return to where the function got called		 	