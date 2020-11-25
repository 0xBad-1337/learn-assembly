;this time we will print the sum of 2 arguments output them and them output if they are equal to 100
;we will be working with the stack
section .data
msg db "your boring sum is", 0xa                     ;don't forget the line feed
msg_win db "wow how you guessed that!!!", 0xa 		 ;if guess true
msg_error db "must be 2 command line argument", 0xa  ;if !=3 then it's command line argument
section .text
global _start
	_start:                 ;this where the program will start to look
		pop rcx			    ;put the value of the top of the stack to rcx(top of stack now contain argument count)
		cmp rcx,3           ;why 3?? because 0 is the program name
		jne argcError       ;if not 3 we jump to argument count error
		xor rcx,rcx         ;reinitialise rcx to 0
		
		mov r10, [rbp + 8]  ;get the first argument argv[0]
		call str_to_int     ;converts argument to integer
		mov r11, [rbp + 16] ;get the second argument argv[1]
		call str_to_int     ;converts argument to integer
		
		add r10,r11         ;sum them and get result to r10
		cmp r10,100
		je .win
		jmp .showsum

	.str_to_int:
		xor rax, rax
		mov rcx, 10	

	.win:
		mov rax, 1          ;sys_write syscall
		mov rdi, 1			;file descriptor standart output
		mov rsi, msg_win    ;win message
		mov rdx, 27		    ;length of message
		syscall             ;execute syscall
		jmp exit            ;jump to exit unless u want a segfault

	.argcError
		mov rax, 1          ;sys_write syscall
		mov rdi, 1			;file descriptor standart output
		mov rsi, msg_error  ;error message
		mov rdx, 31		    ;length of message
		syscall             ;execute syscall
		jmp exit            ;jump to exit unless u want a segfault	

	.exit:
		mov rax, 60
		mov rdi, 0
		syscall	




	
