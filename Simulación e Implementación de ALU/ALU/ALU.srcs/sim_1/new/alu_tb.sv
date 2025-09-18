`timescale 1ns / 1ps

module alu_tb;

    // Declaración de las señales del testbench
    logic [7:0] tb_A;
    logic [7:0] tb_B;
    logic [2:0] tb_ALUControl;
    logic [7:0] tb_Result;
    logic       tb_CarryOut;
    logic       tb_Zero;
    logic       tb_Negative;

    // Instanciar la ALU personalizada
    custom_alu uut (
        .A(tb_A),
        .B(tb_B),
        .ALUControl(tb_ALUControl),
        .Result(tb_Result),
        .CarryOut(tb_CarryOut),
        .Zero(tb_Zero),
        .Negative(tb_Negative)
    );

    // Bloque de inicialización para aplicar los estímulos
    initial begin
        // Inicializar todas las señales
        tb_A = 8'd0;
        tb_B = 8'd0;
        tb_ALUControl = 3'b000;

        // **1. Prueba de la Suma (ALUControl = 000)**
        tb_A = 8'd50;
        tb_B = 8'd30;
        tb_ALUControl = 3'b000;
        #10; // Esperar 10 nanosegundos para que el resultado se estabilice
        $display("Suma: %d + %d = %d", tb_A, tb_B, tb_Result); // Resultado esperado: 80

        // **2. Prueba de la Resta (ALUControl = 001)**
        tb_A = 8'd100;
        tb_B = 8'd20;
        tb_ALUControl = 3'b001;
        #10;
        $display("Resta: %d - %d = %d", tb_A, tb_B, tb_Result); // Resultado esperado: 80

        // **3. Prueba de la operación AND (ALUControl = 010)**
        tb_A = 8'b10101010;
        tb_B = 8'b11110000;
        tb_ALUControl = 3'b010;
        #10;
        $display("AND: %b & %b = %b", tb_A, tb_B, tb_Result); // Resultado esperado: 10100000

        // **4. Prueba de la operación OR (ALUControl = 011)**
        tb_A = 8'b10101010;
        tb_B = 8'b11110000;
        tb_ALUControl = 3'b011;
        #10;
        $display("OR: %b | %b = %b", tb_A, tb_B, tb_Result); // Resultado esperado: 11111010

        // **5. Prueba de Shift Left (ALUControl = 100)**
        tb_A = 8'd10; // 00001010 en binario
        tb_ALUControl = 3'b100;
        #10;
        $display("Shift Left: %d << 1 = %d", tb_A, tb_Result); // Resultado esperado: 20 (00010100)

        // **6. Prueba de Shift Right (ALUControl = 101)**
        tb_A = 8'd20; // 00010100 en binario
        tb_ALUControl = 3'b101;
        #10;
        $display("Shift Right: %d >> 1 = %d", tb_A, tb_Result); // Resultado esperado: 10 (00001010)

        // Detener la simulación
        $finish;
    end

endmodule
