library ieee;
use ieee.std_logic_1164.all;

entity Pilha_LIFO is 
	port (PUSH_p, POP_p, CLK_p: in std_logic;
			Data_in_p : in std_logic_vector(7 downto 0);
			Data_out_p : OUT std_logic_vector(7 downto 0));
end Pilha_LIFO;

architecture circuito of Pilha_LIFO is 
	component Cont_updw_4B is 
		port (PRE, CLR: in std_logic_vector(3 downto 0);
				UD, CK, EN: IN std_logic ;
				S : OUT std_logic_vector(3 downto 0));
	end component;
	 
	component registers_bank is
		port (WDATArb: in std_logic_vector(7 downto 0);
				WADDRrb, RADDRrb_A, RADDRrb_B: in std_logic_vector(3 downto 0);
				WRrb, RDrb_A, RDrb_B, CLKrb, CLRrb: in std_logic;
				RDATArb_A, RDATArb_B: out std_logic_vector(7 downto 0));
	end component;	
	
	signal EN_cont_wr, EN_cont_rd, UD_cont_wr, UD_cont_rd, vazio, cheio_rd, cheio_wr, WR_p, RD_p: std_logic;
	signal cont_addr_wr, cont_addr_rd: std_logic_vector(3 downto 0);

begin
	
	vazio <= NOT(cont_addr_wr(0) OR cont_addr_wr(1) OR cont_addr_wr(2) OR cont_addr_wr(3));
	cheio_wr <= cont_addr_wr(0) AND cont_addr_wr(1) AND cont_addr_wr(2) AND cont_addr_wr(3);
	cheio_rd <= cont_addr_rd(0) AND cont_addr_rd(1) AND cont_addr_rd(2) AND cont_addr_rd(3);
	EN_cont_wr <= (NOT(cheio_wr) AND NOT(vazio) AND NOT(PUSH_p) AND POP_p) OR (NOT(vazio) AND NOT(cheio_rd) AND NOT(PUSH_p) AND POP_p) OR (NOT(cheio_wr) AND NOT(cheio_rd) AND PUSH_p AND NOT(POP_p)) OR (NOT(cheio_wr) AND vazio AND PUSH_p AND NOT(POP_p));
	UD_cont_wr <= (NOT(cheio_wr) AND NOT(cheio_rd) AND PUSH_p AND NOT(POP_p)) OR (NOT(cheio_wr) AND vazio AND PUSH_p AND NOT(POP_p));
	EN_cont_rd <= (NOT(vazio) AND NOT(cheio_rd) AND PUSH_p AND NOT(POP_p)) OR (NOT(vazio) AND NOT(PUSH_p) AND POP_p) OR (NOT(cheio_wr) AND cheio_rd AND PUSH_p AND NOT(POP_p));
	UD_cont_rd <= (NOT(vazio) AND NOT(cheio_rd) AND PUSH_p AND NOT(POP_p)) OR (NOT(cheio_wr) AND cheio_rd AND PUSH_p AND NOT(POP_p));
	WR_p <= (NOT(vazio) AND NOT(cheio_rd) AND PUSH_p AND NOT(POP_p)) OR (NOT(cheio_wr) AND PUSH_p AND NOT(POP_p));
	RD_p <= NOT(vazio) OR cheio_rd OR '1';

	contador_wr: Cont_updw_4B port map(
		PRE => "1111", 
		CLR => "1111",
		UD => UD_cont_wr,
		CK => CLK_p,
		EN => EN_cont_wr,
		S  => cont_addr_wr);
		
	contador_rd: Cont_updw_4B port map(
		PRE => "1111", 
		CLR => "1111",
		UD => UD_cont_rd,
		CK => CLK_p,
		EN => EN_cont_rd,
		S  => cont_addr_rd);
				
	banco: registers_bank port map(
		WDATArb => Data_in_p,
		WADDRrb => cont_addr_wr,
		RADDRrb_A => cont_addr_rd,
		RADDRrb_B => "0000",
		WRrb => WR_p,
		RDrb_A => RD_p,
		RDrb_B => '0',
		CLKrb => CLK_p,
		CLRrb => '1',
		RDATArb_A => Data_out_p);
	
	
end circuito;