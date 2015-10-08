 //-----------------------------------------------------
 // Design Name : decoder stimulus
 // File Name   : decoder_stimulus.v
 // Function    : decoder stimulus block for test bench
 // Coder       : Watchanan Chantapakul
 // Date 		: October 8, 2015
 //-----------------------------------------------------
 
 module decoder_stimulus;
 
	reg d_en;
	reg din_1, din_0;
	wire dout_3, dout_2, dout_1, dout_0;
	
	decoder_24 decoder_24_for_stimulus (dout_3, dout_2, dout_1, dout_0, d_en, din_1, din_0);
	
	initial
		begin
			$dumpfile("DecoderTimeDiagram.vcd");
			$dumpvars(0,decoder_stimulus);
			d_en = 1'b0;
			din_1 = 1'b0;
			din_0 = 1'b0;
		end
		
	always
		#5 din_0 = ~din_0;
	always
		#10 din_1 = ~din_1;
	always
		#20 d_en = ~d_en;
	initial
		begin
			#35 $finish;
		end
	
	initial
		$monitor ($time, "# Output d_en=%d | din_1=%d din_0=%d | dout_3=%d dout_2=%d dout_1=%d dout_0=%d", d_en, din_1, din_0, dout_3, dout_2, dout_1, dout_0);
 
 endmodule