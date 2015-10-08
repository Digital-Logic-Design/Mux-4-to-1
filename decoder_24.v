 //-----------------------------------------------------
 // Design Name : 2-to-4 decoder
 // File Name   : decoder.v
 // Function    : decoder using Logic Gates
 // Coder       : Watchanan Chantapakul
 // Date 		: October 8, 2015
 //-----------------------------------------------------
 
module decoder_24 (
	dout_3, dout_2, dout_1, dout_0,
	d_en,
	din_1, din_0
);

	input d_en, din_1, din_0;
	output dout_3, dout_2, dout_1, dout_0;
	wire w_not1, w_not0;

	not not0 (w_not0, din_0);
	not not1 (w_not1, din_1);
	and and0 (dout_0, d_en, w_not1, w_not0);
	and and1 (dout_1, d_en, w_not1, din_0);
	and and2 (dout_2, d_en, din_1, w_not0);
	and and3 (dout_3, d_en, din_1, din_0);

endmodule