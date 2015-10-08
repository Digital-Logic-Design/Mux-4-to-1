 //-----------------------------------------------------
 // Design Name : mux stimulus
 // File Name   : mux_stimulus.v
 // Function    : mux stimulus block for test bench
 // Coder       : Watchanan Chantapakul
 // Date 		: October 8, 2015
 //-----------------------------------------------------
 
 module mux_stimulus;
 
	reg mux_en;
	reg mux_in3, mux_in2, mux_in1, mux_in0;
	reg mux_s1, mux_s0;
	wire mux_out;
	
	mux_41 mux1(mux_out, mux_en, mux_in3, mux_in2, mux_in1, mux_in0, mux_s1, mux_s0);
	
	initial
		begin
			$dumpfile("MuxTimeDiagram.vcd");
			$dumpvars(0,mux_stimulus);
			mux_en = 1'b0;
			mux_in3 = 1'b0;
			mux_in2 = 1'b0;
			mux_in1 = 1'b0;
			mux_in0 = 1'b0;
			mux_s1 = 1'b0;
			mux_s0 = 1'b0;
			$display ("-> Enable is now active [LOW]");
		end
	
	always
		#1 mux_in0 = ~mux_in0;
	always
		#2 mux_in1 = ~mux_in1;
	always
		#4 mux_in2 = ~mux_in2;
	always
		#8 mux_in3 = ~mux_in3;
	always
		#16 mux_s0 = ~mux_s0;
	always
		#32 mux_s1 = ~mux_s1;
	always
		begin
			#64 mux_en = ~mux_en;
			$display ("-> Enable is now active [HIGH]");
		end
	
	initial
		begin
			#64 begin
				mux_in3 = 1'b1;
				mux_in2 = 1'b1;
				mux_in1 = 1'b1;
				mux_in0 = 1'b1;
			end
		end
	
	initial
		begin
			#127 $finish;
		end
	
	initial
		begin
			$monitor ($time, "# Output: mux_en=%d mux_s1=%d mux_s0=%d | mux_in3=%d mux_in2=%d mux_in1=%d mux_in0=%d | mux_out=%d", mux_en, mux_s1, mux_s0, mux_in3, mux_in2, mux_in1, mux_in0, mux_out);
		end
 endmodule