# PRACTICA 4. PRINCIPIO DE COMPUTADORES.

# programa que valida si una columna de la matriz expuesta
# esta ordenada de forma creciente

# La matriz tiene dimension mxn


m = 3		# numero de filas de m1

#n = 5		# numero de columnas de  m1

#size = 4	# tamano de cada elemento

		
.data

#m:	.word 3
n:	.word 5
size:	.word 4

m1:				.word	1,4,3,4,5
				.word	2,3,3,4,5
                        	.word	3,2,3,2,5
                        	.word	4,1,3,2,5
            



col:                    .word   3 # variable con la columna que queremos comprobar
                                  

# la primera fila es la fila 0
                                 
# la primera columna es la columna 0


ordenada:		.asciiz "La columna esta ORDENADA\n";
desordenada:		.asciiz "La columna esta DESORDENADA\n";
texto:			.asciiz "Introduzca la columna a ordenar\n";
error:			.asciiz "La columna introducida no se encuentra en la matriz\n";  
   
                   .text

# INTRODUCIR COMENTADO EL ALGORITMO PROPUESTO EN LENGUAJE DE ALTO NIVEL




#int col=0;
#int elemento=-9999;
#cout <<"Introduzca el numero de la columna que quiere ver ordenada"<<endl;
#    cin >>col;
#while(col<n){
#	if (col>n){
#	cout<<"La columna introducida no se encuentra en la matriz"<<endl;	
#	return;
#	}
#    bool ordenado=true;
#    for(int i=0;i<m;i++){
#        if(elemento<=matriz[i][col]){
#        }else{
#            ordenado=false;
#		return;
#        }
#	elemento=matriz[i][col];
#    }

#    if (ordenado==true)
#        cout <<"La columna esta ordenada"<<endl;
#    else
#        cout <<"La columna NO esta ordenada"<<endl;
#}
main:
        

	    
do:	li	$v0,4	# $v0 = 4 funcion print string
	la	$a0,texto	# Sa0 = direccion de la cadena a imprimir
	syscall

	li $v0,5	#cojemos el entero por pantalla
	syscall
	
	lw $t2,size	#cargamos tamaño del elemento de la matriz
	lw $t3,n	#cargamos el numero de filas
	move $s0,$v0	#movemos el valor que leemos por pantalla a s0 que sera nuestra columna a recorrer


	
error1:	bge $s0,$t3,error2
	b finerror1
error2:	li	$v0,4	# $v0 = 4 funcion print string
	la	$a0,error	# Sa0 = direccion de la cadena a imprimir
	syscall
	b fi1

finerror1:
	move $t0,$zero	#iterador
	li $s1,-999999	#elemento
	li $s4,1	#bool = true
	move $s5,$zero	#desplazamiento columna introducida
	move $s6,$zero	#desplazamiento de la matriz	
	
	la $s2,m1	#cargamos en s2 la matriz
	
	
	mult $t2,$t3	#   "size x n"
	mflo $s6	#multiplicamos para calcular el desplazamiento en la matriz por columna = s6
	
	li $t7,4
      	mult $s0,$t7
      	mflo $s5		#calculamos el desplazamiento de la columna introducida por pantalla = s5	

	add $s2,$s2,$s5		#sumamos el desplazamiento  para empezar en la columna introducida
	

for:	bge $t0,m,endfor	#si nuestro iterador t0 es mayor o igual a m salta a endfor

	lw $s3,0($s2)		#cargamos en s3 el dato 
	
	
if:	bgt $s1,$s3,else
	
	b fi	#sigue nuestra variable a true rompemos el if
else:
	li $s4,0		#bool =false
	b endfor
fi:
#-----------------------------------------
	move $s1,$s3		#guardamos el dato en elemento(s1) para poder comparar en el if
	
	
	add $s2,$s2,$s6		#en $s6 tenemos el desplazamiento de la matriz y se lo sumamos a s2 que tiene nuestra matriz
				
	add $t0,$t0,1		#incrementamos el iterador
	
	
	b for
endfor:
	
if1:	beq $s4,$zero,else1
	
	#nuestro bool es igual a true->Ordenado
	li	$v0,4	# $v0 = 4 funcion print string
	la	$a0,ordenada	# Sa0 = direccion de la cadena a imprimir
	syscall
	b fi1

else1:
	#nuestro bool es igual a false->NO ordenado
	li	$v0,4	# $v0 = 4 funcion print string
	la	$a0,desordenada	# Sa0 = direccion de la cadena a imprimir
	syscall	
fi1:
while:bge $s0,$t3,endwhile
	b do
endwhile:
# salida del sistema
            
	li	$v0,10
            
	syscall
			
