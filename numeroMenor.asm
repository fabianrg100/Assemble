#DATOS
.data
# se definen tres datos
num1: .word 85 #primer dato, numero mayor
num2: .word 50 #segundo dato
num3: .word 8 # numero menor solicitado
min: .word 0 # esta variable de nombre "max" almacenara el nmero mayor encontrado

#TEXTO
.text
main:
# carga los tres números en los registros "t0,t1,t2"
    lw $t0, num1
    lw $t1, num2
    lw $t2, num3

    # compara el num1 con el num2
    slt $t3, $t0, $t1
    beq $t3, 1, lesser1
    # si el num1 no es menor, entonces el num2 es el menor
    move $t4, $t1
    j compare3

#lesser=menor
lesser1:
    # si el num1 es menor, entonces comprueba si el num1 es menor que el num3
    slt $t3, $t0, $t2
    beq $t3, 1, lesser2
    # si el num1 no es menor que el num3, entonces el num3 es el menor
    move $t4, $t2
    j compare3

lesser2:
    # si el num1 es menor que el num3, entonces num1 es el menor
    move $t4, $t0

compare3:
    # compara el número minimo encontrado hasta ahora con el num3
    slt $t3, $t2, $t4
    beq $t3, 1, lesser3
    # si el num3 no es menor que el número mínimo encontrado hasta ahora, el número mínimo sigue siendo el mismo
    j print

lesser3:
    # si num3 es menor que el número mínimo encontrado hasta ahora, actualiza el número mínimo
    move $t4, $t2

print:
    # imprime el número mínimo
    sw $t4, min
    li $v0, 1
    lw $a0, min
    syscall

exit:
    # salida del programa
    li $v0, 10
    syscall
    