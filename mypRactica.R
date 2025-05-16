#Archivo de practica en la plataforma R
#Carlos Alberto Rivas Garcia, Mexico.

#Operaciones Basicas con R:

3+6 #suma
8*9 #multiplicacion
10-8 #resta
5/2 #division
4^2 #potencias

5+2*3 #primero se evalua el producto
(5+2)*3 #primero se evaluan los parentesis

log(100) #logaritmo natural base (e)
log(100,10) #log nat base 10
exp(2) #exponencial 2
sqrt(16) #raiz cuadrada

x<-90 #el angulo en R debe estar en radianes
sin(x*pi/180) #calcula el seno de x 
cos(x*pi/180) #calcula el coseno de x

#Vectores

w<- 1:6 #w tiene valores del 1 al 6
w2<- seq(1,6,0.5) #w2 tiene valores del 1 al 6 secuenciados cada 0.5

x<- c("a","a","a","b","b","b") #valores caracter

ww<- w > 4 #vectores logicos asignan valores mayores a 4 de w
w[ww] #valores correspondientes a la condicion


#Matrices

y <- matrix(1:20, ncol = 4) #crea una matriz del 1 al 20 de 4 columnas y 5 filas
yy<- matrix(1:20, byrow = TRUE, ncol = 4) #matriz 1 al 20 inicia conteo por filas
yyy<- matrix(1:20, byrow = TRUE, ncol = 4, dimnames = list(paste("r", 1:5, sep = ""), paste("c", 1:4, sep = ".")))
#crea una matriz del 1:20 inicia en filas, y agrega etiquetas de filas y columnas

#Atributo de objetos

class(y)
class(yy)
class(yyy)
class(w)
class(w2)
class(x)
class(ww)

#Operaciones con vectores y matrices

A <- matrix(c(1,2,3,4), ncol = 2)
b <- c(2,3)
A * b #producto entre elementos *
A %*% b #producto matricial % * %

t(A) #matriz transpuesta
solve(A) #matriz inversa

#borrando objetos
ls() #enlista los objetos creados
rm(y) #remueve el objeto y
rm(list = ls()) #remueve todos los objetos a la vez

#Graficas simples

z <- data.frame(grupo = sort(rep(c("a", "b"), 8)), var1 = rnorm(16)) #crea una tabla 2x16
plot(z$var1) #crea grafica dispersion
hist(z$var1) #crea un histograma
boxplot(var1 ~ grupo, data=z, main="boxplot de prueba", xlab = "grupo", ylab = "variable 1")
#crea un grafico de cajas y bigotes de v1 respecto al gpo con etiquetas

z$var2 <- (z$var1)^2 #se agrega una segunda columna a z
z <- z[order(z$var1), ] #se ordena el dataframe respecto a var1

par(mfrow=c(2,2)) #se crea la ventana con subplots 2 x 2
#la función par(), que explica los parámetros gráficos que pueden ser modificados
#por el usuario, por ejemplo el tamaño de la fuente, símbolos, colores, etc.

plot(z$var1, z$var2, type="p", main="solo puntos")
plot(z$var1, z$var2, type="l", main="solo líneas")
plot(z$var1, z$var2, type="b", main="puntos y líneas")
plot(z$var1, z$var2, type="o", main="puntos y líneas\n sobrepuestos")

#Uso de la Ayuda en R

?ls #List object vector de cadena de caracteres con los nombres de objetos en el entorno especifico
help("rnorm") #Calculo de la distribucion normal
help(par) #ajuste de parametros para los graficos.
help.search("hist") #ayuda que busca en diversas fuentes la funcion en interes


#Importando mi archivo de datos

getwd() #para verificar el directorio actual en el que estamos
setwd("C:/Users/KALVEIRO") #se establece el directorio de trabajo

data <- read.table("./repogit/Myprueba1/ense-cat.dat") #ruta del subdirectorio donde se encuentra el archivo a trabajar
dim(data) #nos dice las dimenciones del archivo (filas columnas)
names(data) #indica el nombre de cada variable en caso que tenga encabezados
summary(data) #muestara una serie de estadisticas descriptivas del archivo

par(mfrow=c(1,1)) #establece el tamaño de la ventana de graficado

#plot(data$V8,type="l", col= "blue",ylab = "Altura de marea (m)",xlab="Tiempo (horas)", main = "Marea en Ensenada B.C. \n (12-mayo-2025)", lty=3,lwd=1) 
plot(data$V8 - mean(data$V8),type="l", col="navy",ylab = "Altura de marea (m)",xlab="Tiempo (minutos, dt = 1 min)", main = "Registro de  marea por 24 hrs en Ensenada B.C. \n (12-mayo-2025)", lty=1,lwd=1)

#type puede ser ("l") para lineas, ("b") para puntos y lineas...
#("c") puntos vacios unidos por lineas, "o" para puntos y lineas sobrepuestas...
#("s") y ("S") para  escalones, y ("h") para histograma.
#col para los colores de graficado, "blue", "green", "red", "grey", "black", "orange", "yellow")

abline(h = c(-0.5 , 0.5), v=c(0,1440), col="grey") #se aplica un grid
#axis(1, at=0, 60, 1440) #Encontrar formato de para eje de tiempo en horas

#guardando nuestro grafico
#savePlot(filename="Ense_120525", type = c("png")) #NO me guarda la figura

