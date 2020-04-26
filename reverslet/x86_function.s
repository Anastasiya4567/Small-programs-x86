	section .text
	
	global x86_function

x86_function:
	push rbp	
	mov rbp, rsp	

;------------------------------------------------------------------------------

	mov rsi, rdi	; save copy of string begin pointer

;------------------------------------------------------------------------------

	mov dl, [rdi]
	cmp dl, 0
	je end	

find_string_end:
	inc rdi		
	mov dl, [rdi]
	cmp dl, 0
	jnz find_string_end

	dec rsi

loop_2:			
loop_2_A:		
	inc rsi		
	cmp rsi, rdi	
	jge end
	mov al, [rsi]
	
	cmp al, 'A'
	jb loop_2_A

	cmp al, 'Z'
	jb loop_2_B

	cmp al, 'a'
	jb loop_2_A

	cmp al, 'z'
	jae loop_2_A
	
loop_2_B:		
	dec rdi		
	cmp rsi, rdi	
	jge end
	mov dl, [rdi]

	cmp dl, 'A'
	jb loop_2_B

	cmp dl, 'Z'
	jb swap

	cmp dl, 'a'
	jb loop_2_B

	cmp dl, 'z'
	jae loop_2_B

swap:	
	mov [rdi], al	
	mov [rsi], dl
	
	jmp loop_2
	
end:

;------------------------------------------------------------------------------

	mov rsp, rbp	; restore original stack pointer
	pop rbp		; restore "calling procedure" frame pointer
	ret

