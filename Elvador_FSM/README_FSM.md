# Máquina de Estados Finita (FSM) de Elevador

## Descripción del Proyecto

Este proyecto implementa una **Máquina de Estados Finita (FSM)** para controlar la lógica de un sistema de elevador. El diseño está escrito en el lenguaje **Verilog** y se desarrolló utilizando el entorno de diseño **Xilinx Vivado**. El objetivo principal es simular y sintetizar el comportamiento de un elevador, manejando las solicitudes de los usuarios y las transiciones entre estados de movimiento, inactividad y puerta abierta.

## Funcionalidad de la FSM

El diseño incluye los siguientes estados y funcionalidades clave:

### Estados
La FSM opera con los siguientes estados:
* **Idle**: El elevador está inactivo, esperando una llamada o solicitud.
* **Moving Up**: El elevador se mueve hacia un piso superior.
* **Moving Down**: El elevador se mueve hacia un piso inferior.
* **Door Open**: Las puertas del elevador están abiertas en un piso.
* **Maintenance**: Modo de mantenimiento, el elevador no responde a las llamadas.

### Entradas (Inputs)
| Bits de Entrada | Descripción |
| :--- | :--- |
| `CU` (Call Up) | Alguien llama desde un piso superior. |
| `FR` (Floor Request) | Se presiona un botón de piso dentro del elevador. |
| `BR` (Button Request) | Alguien llama desde un piso inferior. |

### Salidas (Outputs)
El proyecto genera salidas Moore y Mealy para el control:
* **Moore**: `M_hi`, `M_lo`, `Door` - Indican el estado del elevador (subiendo, bajando, puerta abierta).
* **Mealy**: `Start`, `Stop` - Indican si el elevador debe iniciar o detener su movimiento, dependiendo de la solicitud actual.

## Herramientas de Desarrollo

* **Software**: Xilinx Vivado
* **Lenguaje de Descripción de Hardware (HDL)**: Verilog

## Contenido del Repositorio

* `elevator_fsm.v`: El código fuente principal de la FSM del elevador.
* `elevator_fsm_tb.v`: El banco de pruebas (testbench) para simular y verificar la funcionalidad de la FSM.
* `schematic.png`: Diagrama esquemático generado por Vivado que muestra la implementación a nivel de compuertas lógicas del diseño.
* `FSM_Elevador_Maria_Cospin.xlsx.pdf`: Tabla de estados que sirvió de base para la implementación de la FSM.

## Cómo Utilizar el Proyecto

Para simular y sintetizar este proyecto, sigue estos pasos:

1.  **Clonar el Repositorio**: Usa Git para clonar este repositorio en tu máquina local.
    ```bash
    git clone [https://github.com/TuUsuario/TuRepositorio.git](https://github.com/TuUsuario/TuRepositorio.git)
    ```
2.  **Abrir en Vivado**: Inicia Vivado y abre el proyecto.
3.  **Ejecutar Simulación**: En el panel de `Flow Navigator`, haz clic en `Run Simulation` > `Run Behavioral Simulation`.
4.  **Generar Esquemático**: Para visualizar el circuito, haz clic en `Run Synthesis` y luego en `Open Synthesized Design` > `Open Schematic`.
