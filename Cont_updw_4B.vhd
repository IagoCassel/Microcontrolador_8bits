library ieee;
use ieee.std_logic_1164.all;

entity Cont_updw_4B is 
	port (PRE, CLR: in std_logic_vector(3 downto 0);
	      UD, CK, EN: IN std_logic ;
	      S : OUT std_logic_vector(3 downto 0));
end Cont_updw_4B;

architecture circuito of Cont_updw_4B is 
	component ffjk IS
		port (clk ,J ,K ,P , C : IN std_logic ;
	       	      q : OUT std_logic );
	end component;
	
	signal q_B01, q_B02, q_B03, or_B01, or_B02, or_B03: std_logic;
	signal and_B01, and_B02, and_B03:  std_logic_vector(1 downto 0);  
	signal pres: std_logic_vector(3 downto 0);

begin

	B01: ffjk port map(
		clk => CK,
		P => PRE(0),
		C => CLR(0),
		J => EN,
		K => EN,
		q => q_B01);
		
	and_B01(0) <= q_B01 AND UD AND EN;
	and_B01(1) <= (not q_B01) AND (not UD) AND EN;
	or_B01 <= and_B01(0) OR and_B01(1);

	B02: ffjk port map(
		clk => CK,
		P => PRE(1),
		C => CLR(1),
		J => or_B01,
		K => or_B01,
		q => q_B02);

	and_B02(0) <= q_B02 AND and_B01(0);
	and_B02(1) <= (not q_B02) AND and_B01(1);
	or_B02 <= and_B02(0) OR and_B02(1);		

	B03: ffjk port map(
		clk => CK,
		P => PRE(2),
		C => CLR(2),
		J => or_B02,
		K => or_B02,
		q => q_B03);

	and_B03(0) <= q_B03 AND and_B02(0);
	and_B03(1) <= (not q_B03) AND and_B02(1);
	or_B03 <= and_B03(0) OR and_B03(1);			

	B04: ffjk port map(
		clk => CK,
		P => PRE(3),
		C => CLR(3),
		J => or_B03,
		K => or_B03,
		q => S(3));

	S(0) <= q_B01;
	S(1) <= q_B02;
	S(2) <= q_B03;

end circuito;