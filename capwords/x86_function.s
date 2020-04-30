	section .text
	
	global x86_function

x86_function:
	push rbp	
	mov rbp, rsp	

;------------------------------------------------------------------------------

	mov dl, [rdi]
	cmp dl, 0
	jz end
comp:
	mov eax, 0	; counter of spaces
	cmp dl, 97
	jb loop
	cmp dl, 122
	ja loop

	add dl, -32
	mov [rdi], dl

loop:
	inc rdi
	mov dl, [rdi]
	cmp dl, 0
	jz end

	cmp dl, ' '
	je inc_c

	cmp eax, 0
	jne comp

	jmp loop

inc_c:
	inc eax
	jmp loop

;------------------------------------------------------------------------------
	
end:
	mov rsp, rbp	
	pop rbp	
	ret

