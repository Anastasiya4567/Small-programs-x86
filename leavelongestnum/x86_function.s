	section .text
	
	global x86_function

x86_function:
	push rbp	
	mov rbp, rsp	

;------------------------------------------------------------------------------

	mov rdx, rdi	; save copy of string begin pointer

;------------------------------------------------------------------------------

	mov rsi, 0	; max_length
	mov rcx, 0	; current counter
			; rdx - max pointer
	dec rdi	

loop:
	inc rdi
	mov al, [rdi]
	cmp al, 0
	jz last

	cmp rcx, 0
	jne continue_finding

	cmp al, '0'
	jb loop

	cmp al, '9'
	ja loop
	
	inc rcx
	jmp loop


continue_finding:

	cmp al, '0'
	jb last

	cmp al, '9'
	ja last
	
	inc rcx
	jmp loop
last:
	cmp rcx, rsi
	jbe noreplace

	mov rsi, rcx
	mov rdx, rdi
	sub rdx, rcx

	cmp al, 0
	je end

noreplace:
	cmp al, 0
	je end
	mov rcx, 0
	jmp loop

;------------------------------------------------------------------------------
	
end:
	
	mov rax, rdx
	add rdx, rsi
	mov byte [rdx], 0

	mov rsp, rbp	
	pop rbp	
	ret

