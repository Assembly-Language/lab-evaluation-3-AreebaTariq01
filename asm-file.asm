include Irvine32.inc

.data
zeroCount DWORD 0  

.code
countZeros PROC
    
    ; EAX -> Pointer to the array
    ; EDX -> Size of the array (number of elements)

    push ebp             ; Set up the stack frame
    mov ebp, esp

    mov esi, [ebp + 8]   ; ESI = array pointer
    mov ecx, [ebp + 12]  ; ECX = size of the array
    xor eax, eax         ; EAX = zero count (initialize to 0)

count_loop:
    cmp ecx, 0           ; Check if all elements are processed
    je end_loop          ; Exit loop if ECX is 0

    mov edx, [esi]       ; Load current array element into EDX
    cmp edx, 0           ; Check if the value is zero
    jne not_zero         ; Skip increment if not zero

    inc eax              ; Increment zero count if value is zero

not_zero:
    add esi, 4           ; Move to the next element (4 bytes per element)
    loop
asmfunc ENDP
end INCLUDE Irvine32.inc
.data
;public asmfunc
msg db "assebly procedure end now",0


.code

asmfunc PROC p1:DWORD, p2:DWORD         ; There are 2 parameters
    
    mov esi,p1      ; esi = address of parameter 1
    mov edi,p2      ; edi = address of the parameter 2
    mov ebx,0       ; ebx = will have total zeros
    mov ecx,8       ; Counter for the loop 


    next:
        mov eax, [esi]      ; eax = value at esi
        cmp eax,0           ; compare eax with 0
        pushfd              ; Push all the flags
        add esi,4           ; move esi to next index
        popfd               ; pop all the flags
        jz count            ; if zero flag is set then jump to count

    CheckAgain:             ; Otherwise check again
        loop next           ; loop to the next element

        jmp EndFunc         ; if ecx = 0 then jump to the end

             
    count:                  ; Label for counting total zero's

        inc ebx             ; increment in ebx if zero found
        jmp CheckAgain      ; Then jump to check again

    EndFunc:                ; label to end the function
        mov [edi],ebx       ; move the ebx value to the pointing index of edi
        
        ; Print Message string

        mov edx,offset msg  
        call writestring


    
    ret
asmfunc ENDP
end