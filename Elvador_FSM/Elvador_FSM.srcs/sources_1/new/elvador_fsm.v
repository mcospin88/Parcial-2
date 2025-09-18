`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 22:36:29
// Design Name: 
// Module Name: elvador_fsm
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

module elevator_fsm (
    input wire clk,
    input wire reset,
    input wire [2:0] input_bits,
    output reg [2:0] current_state,
    output reg [2:0] moore_output,
    output reg [1:0] mealy_output
);

    // Definición de los estados
    localparam [2:0]
        IDLE        = 3'b000,
        MOVING_UP   = 3'b001,
        MOVING_DOWN = 3'b010,
        DOOR_OPEN   = 3'b011,
        MAINTENANCE = 3'b100;

    // Lógica secuencial para la transición de estados
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= IDLE;
        end else begin
            case (current_state)
                IDLE: begin
                    case (input_bits)
                        3'b001: current_state <= MOVING_UP;
                        3'b010: current_state <= MOVING_DOWN;
                        3'b100: current_state <= MOVING_UP;
                        default: current_state <= IDLE;
                    endcase
                end
                MOVING_UP: begin
                    case (input_bits)
                        3'b001: current_state <= DOOR_OPEN;
                        3'b010: current_state <= MOVING_UP;
                        3'b100: current_state <= DOOR_OPEN;
                        default: current_state <= MOVING_UP;
                    endcase
                end
                MOVING_DOWN: begin
                    case (input_bits)
                        3'b001: current_state <= MOVING_DOWN;
                        3'b010: current_state <= DOOR_OPEN;
                        3'b100: current_state <= DOOR_OPEN;
                        default: current_state <= MOVING_DOWN;
                    endcase
                end
                DOOR_OPEN: begin
                    case (input_bits)
                        3'b001: current_state <= IDLE;
                        3'b010: current_state <= MOVING_DOWN;
                        3'b100: current_state <= MOVING_UP;
                        default: current_state <= IDLE;
                    endcase
                end
                MAINTENANCE: begin
                    current_state <= MAINTENANCE;
                end
            endcase
        end
    end

    // Lógica combinacional para las salidas de Moore
    always @(current_state) begin
        case (current_state)
            IDLE: moore_output <= 3'b000;
            MOVING_UP: moore_output <= 3'b010;
            MOVING_DOWN: moore_output <= 3'b100;
            DOOR_OPEN: moore_output <= 3'b001;
            MAINTENANCE: moore_output <= 3'b000;
            default: moore_output <= 3'b000;
        endcase
    end

    // Lógica combinacional para las salidas de Mealy
    always @(current_state or input_bits) begin
        case (current_state)
            IDLE: begin
                case (input_bits)
                    3'b001, 3'b010, 3'b100: mealy_output <= 2'b10;
                    default: mealy_output <= 2'b00;
                endcase
            end
            MOVING_UP, MOVING_DOWN, DOOR_OPEN, MAINTENANCE: begin
                mealy_output <= 2'b00;
            end
            default: mealy_output <= 2'b00;
        endcase
    end

endmodule
