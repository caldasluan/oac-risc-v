# OAC - 2/2019
Repositório contendo os trabalhos feitos em grupo para a disciplina OAC - Organização e Arquitetura de Computadores na UnB - Universidade de Brasília.

## Requisitos
É necessário ter a JVM instalada para executar o simulador RARS.

### Registradores
Register	ABI	            Use by convention	                    Preserved?
    x0	    zero	        hardwired to 0, ignores writes	            n/a
    x1	    ra	            return address for jumps	                no
    x2	    sp	            stack pointer	                            yes
    x3	    gp	            global pointer	                            n/a
    x4      tp  	        thread pointer	                            n/a
    x5	    t0	            temporary register 0	                    no
    x6	    t1  	        temporary register 1	                    no
    x7	    t2          	temporary register 2	                    no
    x8	    s0 or fp    	saved register 0 or frame pointer	        yes
    x9	    s1	            saved register 1	                        yes
    x10	    a0      	    return value or function argument 0	        no
    x11	    a1      	    return value or function argument 1	        no
    x12	    a2	            function argument 2	                        no
    x13	    a3          	function argument 3	                        no
    x14	    a4	            function argument 4	                        no
    x15	    a5	            function argument 5	                        no
    x16	    a6	            function argument 6	                        no
    x17	    a7	            function argument 7	                        no
    x18	    s2	            saved register 2	                        yes
    x19	    s3	            saved register 3	                        yes
    x20	    s4	            saved register 4	                        yes
    x21	    s5	            saved register 5	                        yes
    x22	    s6	            saved register 6	                        yes
    x23	    s7	            saved register 7	                        yes
    x24	    s8	            saved register 8	                        yes
    x25	    s9	            saved register 9	                        yes
    x26	    s10	            saved register 10	                        yes
    x27	    s11	            saved register 11	                        yes
    x28	    t3          	temporary register 3	                    no
    x29	    t4          	temporary register 4	                    no
    x30	    t5          	temporary register 5	                    no
    x31	    t6          	temporary register 6	                    no
    pc	    (none)	        program counter	                            n/a
