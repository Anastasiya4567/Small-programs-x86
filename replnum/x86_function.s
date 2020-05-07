	section .text
	
	global x86_function

x86_function:
	push rbp	
	mov rbp, rsp	

	mov rax, rdi	; save copy of string begin pointer
			; rsi (sil) - our symbol
	dec rdi

loop:
	inc rdi
	mov dl, [rdi]
	cmp dl, 0
	jz end

	cmp dl, '0'
	jb copy

	cmp dl, '9'
	jbe write_symbol_to_rdx

copy:
	mov [rax], dl
	inc rax
	jmp loop	

find_whole_num_seq:
	inc rdi
	mov dl, [rdi]
	cmp dl, 0
	jz end

	cmp dl, '0'
	jb copy

	cmp dl, '9'
	ja copy

	jmp find_whole_num_seq

write_symbol_to_rdx:
	mov [rax], sil
	inc rax
	jmp find_whole_num_seq

;------------------------------------------------------------------------------
	
end:
	mov [rax], dl
	mov rsp, rbp	
	pop rbp	
	ret

