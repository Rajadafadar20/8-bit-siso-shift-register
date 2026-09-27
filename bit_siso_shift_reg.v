module siso_shift_register (
    input clk,          // Clock signal
    input reset,        // Asynchronous reset
    input serial_in,    // Serial input bit
    output serial_out   // Serial output bit
);

    reg [7:0] shift_reg; // 8-bit register

       always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= 8'b00000000;   // Clear register on reset
        end else begin
          shift_reg <= {serial_in, shift_reg[7:1]}; // Shift right, insert new bit
          //shift_reg <= { shift_reg[6:0], serial_in};
        end
    end

    // Output the MSB (last shifted bit)
    assign serial_out = shift_reg[7];

endmodule
