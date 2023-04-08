#DATOS
.data 
#se definen tres numeros en esta sección
num1: .word 10 #este seria el numero menor, pero me piden el numero mayor.
num2: .word 90 #este dato seria en este caso el numero mayor, el cual se almacenará en el registro
num3: .word 30 #este seria el tercer dato.
max: .word 0 #	esta variable de nombre "max" almacenara el nmero mayor encontrado

#TEXTO
.text
main:
# carga los tres números en los registros
    lw $t0, num1
    lw $t1, num2
    lw $t2, num3
  
#en este caso se procede a una serie de comparaciones con el fin de encontrar 
#el numero mayor y guardarlo en la variable "max" con el fin de mostrarlo en pantalla mas adelante.

    # compara el num1 con el num2
    slt $t3, $t0, $t1
    beq $t3, 1, greater1
    # si el num1 no es mayor, entonces el num2 es el mayor
    move $t4, $t1
    j compare3

#greater=mayor
greater1:
    # si el num1 es mayor, entonces comprueba si num1 es mayor que el num3
    slt $t3, $t0, $t2
    beq $t3, 1, greater2
    # si el num1 no es mayor que el num3, entonces num3 es el mayor
    move $t4, $t2
    j compare3

greater2:
    # si el num1 es mayor que num3, entonces num1 es el mayor
    move $t4, $t0

compare3:
    # compara el número máximo encontrado hasta ahora con el num3
    slt $t3, $t4, $t2
    beq $t3, 1, greater3
    # si el num3 no es mayor que el número máximo encontrado hasta ahora, el número máximo sigue siendo el mismo
    j print

greater3: #como son tres tipos de datos, por este se realizaron tres tipos de comparaciones.
    # si el num3 es mayor que el número máximo encontrado hasta ahora, actualiza el número máximo "mov"
    move $t4, $t2

print:# funcion para imprimir
    # imprime el número máximo
    sw $t4, max
    li $v0, 1
    lw $a0, max
    syscall

exit:#funcion para salir
    # salida del programa
    li $v0, 10
    syscall
    