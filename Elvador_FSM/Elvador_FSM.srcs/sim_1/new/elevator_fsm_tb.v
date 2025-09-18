`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 22:37:58
// Design Name: 
// Module Name: elevator_fsm_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps

module elevator_fsm_tb;

    // Entradas del DUT (Device Under Test)
    reg clk;
    reg reset;
    reg [2:0] input_bits;

    // Salidas del DUT
    wire [2:0] current_state;
    wire [2:0] moore_output;
    wire [1:0] mealy_output;

    // Instancia de tu FSM
    elevator_fsm DUT (
        .clk(clk),
        .reset(reset),
        .input_bits(input_bits),
        .current_state(current_state),
        .moore_output(moore_output),
        .mealy_output(mealy_output)
    );

    // Lógica del reloj
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Un reloj con un período de 10 ns
    end

    // Lógica de las entradas de prueba
    initial begin
        // 1. Resetear la FSM
        reset = 1;
        #10 reset = 0;

        // 2. Probar la transición de Idle a MovingUp
        input_bits = 3'b000;
        #10 input_bits = 3'b001; // Call Up
        #100;

        // 3. Probar la transición de MovingUp a DoorOpen
        input_bits = 3'b000;
        #10 input_bits = 3'b001; // Floor Request
        #100;

        // 4. Regresar a Idle y luego a MovingDown
        input_bits = 3'b000;
        #100;
        input_bits = 3'b010; // Call Down
        #100;

        // Finalizar la simulación
        $finish;
    end

endmodule
