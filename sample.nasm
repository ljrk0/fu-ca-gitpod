        global tri_area

tri_area:   mov rax, rdi
            mov rdx, 0
            mul rsi

            mov rdx, 0
            mov rcx, 2
            div rcx
            
            ret