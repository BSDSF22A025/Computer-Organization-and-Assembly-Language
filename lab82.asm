.model small
.stack 100h
.data
str1 db "Enter number : $"
str2 db "The difference is :$"
arr1 dw 2 dup('$')
arr2 db 2 dup('$')
var1 db 0
var2 db 2
.code
	main proc
		
		mov ax,@data
		mov ds,ax
		
		
		lea si,arr1
		lea di,arr2
		
loop1:	
		lea dx,str1
		mov ah,09h
		int 21h
		
		mov var1,0
		mov bx,0
again:	mov ah,01h
		int 21h
		
		cmp al,13
		je exit
		
		sub al,48
		mov cl,al
		
		mov ch,0
		mov ax,bx
		
		mov bx,10
		mul bx
		
		add ax,cx
		mov bx,ax
		inc var1
		jmp again
 
		
		
		
		
		
exit:	mov [si],bx
		mov cl,var1
		mov [di],cl
		inc di
		add si,2
		dec var2
		jnz loop1
		
	lea dx,str2
	mov ah,09h
	int 21h
	
	lea si,arr1
	mov ax,[si]
	add si,2
	mov bx,[si]
	sub ax,bx
	
	
	
	mov cx,0
		
again2:	cmp ax,0
		je exit2
		
		mov bx,10
		
		
		mov dx,0
		
		div bx
		
		
		
		push dx
		inc cx
		
		jmp again2
		
exit2:
		pop dx
		
		add dl,48
		
		mov ah,02h
		int 21h
		
		dec cx
		jnz exit2
	
	
		
	mov ah,4ch
	int 21h

main endp
end main