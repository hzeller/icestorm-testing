module main(clk, led_ring, center_led);
   input clk;
   output [3:0] led_ring;
   output 	center_led;

   reg [25:0] i;
   assign center_led = i[25];
   assign led_ring   = i[22:25];

   always @ (posedge clk) begin
      i <= i + 1;
   end
endmodule
