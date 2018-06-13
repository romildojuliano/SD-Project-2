module juncao(CLOCK_50, IRDA_RXD, HEXUNIA, HEXDEZA, HEXUNIB, HEXDEZB, HEXCENR, HEXDEZR, HEXUNIR, SOUTR, SOUTA, SOUTB, OPR);
	input CLOCK_50, IRDA_RXD;
	
	output wire[6:0] HEXUNIA, HEXDEZA, HEXUNIB, HEXDEZB, HEXCENR, HEXDEZR, HEXUNIR;
	output wire SOUTR, SOUTA, SOUTB, OPR;
	
	wire okBit, SINR, SINA, SINB;
	wire[7:0] dataDec, dataRes, A, B;
	
	lastHopeDec dec(CLOCK_50, IRDA_RXD, okBit, dataDec);
	
	ULA2 ulaULA(CLOCK_50, dataDec, dataRes, okBit, A, B, SINR, SINA, SINB, OPR);
	
	decoder99 bcdA(HEXUNIA, A, HEXDEZA, SINA, SOUTA);
	decoder99 bcdB(HEXUNIB, B, HEXDEZB, SINB, SOUTB);
	decoder198 bcdR(HEXUNIR, dataRes, HEXDEZR, HEXCENR, SINR, SOUTR);
endmodule 