module custom_alu (
    input logic [7:0] A,
    input logic [7:0] B,
    input logic [2:0] ALUControl,
    output logic [7:0] Result,
    output logic CarryOut,
    output logic Zero,
    output logic Negative
);

    // Variables internas para los resultados de las unidades funcionales
    logic [7:0] arithmetic_result;
    logic [7:0] logic_result;
    logic [7:0] shift_result;

    // Aritmética: suma y resta
    // 3'b000: A + B
    // 3'b001: A - B (Implementada como A + ~B + 1)
    assign arithmetic_result = (ALUControl[0] == 1'b0) ? (A + B) : (A + (~B + 8'b1));

    // Lógica: AND y OR
    // 3'b010: A & B
    // 3'b011: A | B
    assign logic_result = (ALUControl[0] == 1'b0) ? (A & B) : (A | B);

    // Desplazamiento: Shift Left y Shift Right
    // 3'b100: Shift Left
    // 3'b101: Shift Right
    assign shift_result = (ALUControl[0] == 1'b0) ? (A << 1) : (A >> 1);

    // Lógica para el multiplexor que selecciona el resultado final
    // Usamos una sentencia 'case' para la selección, es más legible
    always_comb begin
        case (ALUControl)
            3'b000, 3'b001: Result = arithmetic_result;
            3'b010, 3'b011: Result = logic_result;
            3'b100, 3'b101: Result = shift_result;
            default: Result = 8'b0; // Valor por defecto
        endcase
    end

    // Lógica para las banderas (flags)
    // Zero: Result es igual a cero
    assign Zero = (Result == 8'b0);
    // Negative: Bit más significativo (MSB) es 1
    assign Negative = Result[7];
    // CarryOut: En este ejemplo simple, solo para la suma
    assign CarryOut = (ALUControl == 3'b000) ? (A[7] & B[7]) | ((A[7] ^ B[7]) & Result[7]) : 1'b0;

endmodule
