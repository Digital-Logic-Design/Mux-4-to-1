 //-----------------------------------------------------
 // Design Name : 4-to-1 mux
 // File Name   : mux_41.v
 // Function    : 4:1 Mux using Logic Gates
 // Coder       : Watchanan Chantapakul
 // Date 		: October 8, 2015
 //-----------------------------------------------------
 
module mux_41(
	mux_out,
	mux_en,
	mux_in3, mux_in2, mux_in1, mux_in0,
	mux_s1, mux_s0
);

	input mux_en, mux_in3, mux_in2, mux_in1, mux_in0, mux_s1, mux_s0;
	output mux_out;
	wire w_and0, w_and1, w_and2, w_and3;
	wire dout_3, dout_2, dout_1, dout_0;
	
	decoder_24 decoder_24_for_mux (dout_3, dout_2, dout_1, dout_0, mux_en, mux_s1, mux_s0);
	
	and and0 (w_and0, mux_en, mux_in0, dout_0);
	and and1 (w_and1, mux_en, mux_in1, dout_1);
	and and2 (w_and2, mux_en, mux_in2, dout_2);
	and and3 (w_and3, mux_en, mux_in3, dout_3);
	or or0 (mux_out, w_and0, w_and1, w_and2, w_and3);

endmodule