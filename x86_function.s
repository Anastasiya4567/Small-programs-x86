	section .text
	
	global x86_function

x86_function:
	push rbp	
	mov rbp, rsp
			; rsi - a = sil
			; rdx - b = dl

;------------------------------------------------------------------------------

	mov rax, rdi	; save copy of string begin pointer

;------------------------------------------------------------------------------
	
	dec rdi

loop_1:
	inc rdi
	mov cl, [rdi]
	cmp cl, 0
	jz end

	cmp cl, sil
	jb loop_2
	cmp cl, dl
	jbe loop_1
loop_2:
	mov [rax], cl
	inc rax
	jmp loop_1

;------------------------------------------------------------------------------
	
end:
	mov [rax], cl
	mov rsp, rbp	; restore original stack pointer
	pop rbp		; restore "calling procedure" frame pointer
	ret

