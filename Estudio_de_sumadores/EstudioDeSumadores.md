# README – EstudioDeSumadores.circ

---

Este proyecto de **Logisim-evolution** contiene varios circuitos que demuestran el funcionamiento de distintos tipos de sumadores, componentes esenciales en electrónica digital y arquitectura de computadoras.  
El archivo `EstudioDeSumadores.circ` puede abrirse y simularse directamente en Logisim-evolution.

---

## Componentes principales del circuito

El archivo incluye los siguientes circuitos, cada uno con su funcionalidad y propósito específico:

* **Half-Adder (Medio sumador):**  
  Sumador básico que toma dos entradas (`X` y `Y`) y produce una suma (`Sum`) y un acarreo de salida (`Co`). Se usa para sumar un solo bit.

* **Full-Adder (Sumador completo):**  
  Toma tres entradas (`X`, `Y` y acarreo de entrada `Ci`) y genera la suma (`Sum`) y el acarreo de salida (`Co`).

* **Ripple Carry Adder (Sumador de acarreo por propagación):**  
  Sumador de varios bits construido en cascada con múltiples sumadores completos. El acarreo de cada sumador se conecta al siguiente, generando un retardo lineal según la cantidad de bits.

* **Prefix Adder (Sumador prefijo):**  
  Calcula los acarreos en paralelo usando un enfoque de prefijos, acelerando la operación en sumas de varios bits.

* **Carry Lookahead Adder (Sumador de anticipación de acarreo):**  
  Optimiza la generación de acarreos de manera paralela, reduciendo considerablemente la latencia frente a los sumadores de acarreo por propagación, aunque con más complejidad de circuitos.

---

## Uso

1. Abrir `EstudioDeSumadores.circ` en **Logisim-evolution**.  
2. Explorar cada subcircuito haciendo doble clic sobre él.  
3. Modificar los valores de entrada para probar los sumadores y observa los resultados.  
4. Los sumadores de varios bits incluyen LEDs para visualizar acarreos y suma.

---

## Video explicativo

**Enlace al video:** [AQUÍ EL ENLACE](#)

---

## Elección del sumador según aplicación

Dependiendo de las necesidades de velocidad y cantidad de compuertas, estos serían los sumadores recomendados:

* **Aplicaciones lentas con restricción de espacio y presupuesto:**  
  Para este caso, lo ideal es usar un **Ripple Carry Adder**. Aunque es más lento porque el acarreo se propaga de bit en bit, su diseño es muy sencillo, ocupa pocas compuertas y es barato de implementar. Es perfecto si no necesitas rapidez extrema y quieres ahorrar espacio y costo.

* **Aplicaciones rápidas sin restricción de espacio y presupuesto:**  
  Aquí lo más conveniente es un **Carry Lookahead Adder** o un **Prefix Adder**. Ambos calculan los acarreos en paralelo, lo que permite que la suma sea mucho más rápida que un Ripple Carry. No importa que ocupen más compuertas, porque no hay limitación de espacio ni presupuesto, y la velocidad es la prioridad.

* **Aplicaciones rápidas con restricción de espacio y presupuesto:**  
  En este escenario conviene un **Prefix Adder**. Aunque ocupa más compuertas que un Ripple Carry, es más eficiente en tiempo que un Carry Lookahead cuando el número de bits es grande, y su estructura modular permite un buen balance entre velocidad y cantidad de compuertas, optimizando el espacio disponible.

---
