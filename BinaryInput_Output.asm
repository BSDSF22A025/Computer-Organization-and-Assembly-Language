.model small
.stack 100h
.data
.code
	main proc 
		mov bl,0b
		mov cx,8
again:	mov ah,01h
		int 21h
		
		cmp al,0Dh
		je exit
		
		sub al,48d
		
		shl bl,1
		or bl,al
		dec cx
		jnz again
exit:
		mov dl,10
		mov ah,02h
		int 21h
		mov dl,13
		mov ah,02h
		int 21h 
		
		mov cx,8
agai:	rol bl,1
		jc one
		
		mov dl,'0'
		jmp print
		
one:	mov dl,'1'

print:	mov ah,02h
		int 21h
		
		dec cx
		jnz agai

	mov ah,4ch
	int 21h
main endp
end main 