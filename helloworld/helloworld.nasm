section .data; static data

msg db "hello, world!"

section .text; code
	global _start; must start like that
_start:
	mov rax, 1; syscall write to rax  
	mov rdi, 1; file descriptor 1(stdout)
	mov rsi, msg; second argument which is the message
	mov rdx, 13; number of bytes to write 
	syscall; make the syscall
	mov rax,60; exit syscall to rax
	mov rdi, 0; exit without error
	syscall
