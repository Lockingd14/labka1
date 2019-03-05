section .data
	enter_num db "Enter a number"
	len equ $-enter_num
	enter_num2 db "Enter a number"
	len2 equ $-enter_num2
	out_str db "Now x = "
	out_str2 db "Now y = "
section .bss
	x resb 1
	y resb 1
section .text
	global _start
_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, enter_num
	mov edx, len
	int 0x80
	
	mov eax, 3
	mov ebx, 2
	mov ecx, x
	mov edx, 2 ; 1 значное число 
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov ecx, enter_num2
	mov edx, len2
	int 0x80
	
	mov eax, 3
	mov ebx, 2
	mov ecx, y
	mov edx, 2 ; 1 значное число 
	int 0x80
	
	mov eax, [x]
	mov ebx, [y]
	xchg eax, ebx
	mov [x], eax
	mov [y], ebx
	
	mov eax, 4
	mov ebx, 1
	mov ecx, out_str
	mov edx, 1
	int 0x80
	; Result
	mov eax, 4
	mov ebx, 1
	mov ecx, x
	mov edx, 1
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov ecx, out_str2
	mov edx, 1
	int 0x80
	; Result
	mov eax, 4
	mov ebx, 1
	mov ecx, y
	mov edx, 1
	int 0x80
	
	mov eax, 1
	int 0x80
