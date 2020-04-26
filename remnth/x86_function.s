	section .text
	
	global x86_function

x86_function:
	push rbp	
	mov rbp, rsp	

;------------------------------------------------------------------------------

	mov rbx, rdi	; save copy of string begin pointer
	; rsi - n

;------------------------------------------------------------------------------
	mov rcx, rsi
	dec rdi

loop:
	inc rdi
	mov al, [rdi]
	cmp al, 0
	jz end

	dec rcx
	cmp rcx, 0
	jz reset

	mov [rbx], al
	inc rbx
	jmp loop
reset:
	mov rcx, rsi
	jmp loop

;------------------------------------------------------------------------------
	
end:
	mov [rbx], al
	mov rsp, rbp	
	pop rbp	
	ret

