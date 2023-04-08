#DATOS
.data
fib: .word 0, 1, 0, 10  # el 4to número indica el número de términos de la serie

#TEXTO
.text
main:
    # carga el primer y segundo término de la serie de Fibonacci en los registros
    lw $t0, fib
    lw $t1, fib+4
    li $t2, 2  # el tercer término es la suma de los primeros dos términos

    # muestra los dos primeros términos de la serie de Fibonacci
    li $v0, 1  # la llamada al sistema 1 imprime un entero en la pantalla
    move $a0, $t0
    syscall
    move $a0, $t1
    syscall

    # genera el resto de la serie de Fibonacci
    add $t3, $zero, $zero  # $t3 se utiliza como contador
    
    loop: #bucle
        add $t3, $t3, 1  # incrementa el contador
        beq $t3, $t2, exit  # salta a la etiqueta exit si se han generado suficientes términos
        add $t4, $t0, $t1  # suma los dos términos anteriores
        move $t0, $t1  # mueve el segundo término al primer término
        move $t1, $t4  # mueve la suma al segundo término
        move $a0, $t4  # prepara el valor para imprimir
        li $v0, 1  # imprime el valor
        syscall
        j loop  # retorne al bucle

  
    exit:# salir del programa
    li $v0, 10  # la llamada al sistema 10 sale del programa
    syscall