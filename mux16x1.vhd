library ieee;
use ieee.std_logic_1164.all;

entity mux16x1 is

port(
INm_16x1: in std_logic_vector(15 downto 0);
ENm_16x1: in std_logic;
SELm_16x1: in std_logic_vector(3 downto 0);
OUTm_16x1: out std_logic
);

end mux16x1;

architecture mux16x1_arc of mux16x1 is

begin

OUTm_16x1 <= ENm_16x1 and ((INm_16x1(0) and (not SELm_16x1(3)) and (not SELm_16x1(2)) and (not SELm_16x1(1)) and (not SELm_16x1(0))) or
				 (INm_16x1(1) and (not SELm_16x1(3)) and (not SELm_16x1(2)) and (not SELm_16x1(1)) and (SELm_16x1(0))) or
				 (INm_16x1(2) and (not SELm_16x1(3)) and (not SELm_16x1(2)) and (SELm_16x1(1)) and (not SELm_16x1(0))) or
				 (INm_16x1(3) and (not SELm_16x1(3)) and (not SELm_16x1(2)) and (SELm_16x1(1)) and (SELm_16x1(0))) or
				 (INm_16x1(4) and (not SELm_16x1(3)) and (SELm_16x1(2)) and (not SELm_16x1(1)) and (not SELm_16x1(0))) or
				 (INm_16x1(5) and (not SELm_16x1(3)) and (SELm_16x1(2)) and (not SELm_16x1(1)) and (SELm_16x1(0))) or
				 (INm_16x1(6) and (not SELm_16x1(3)) and (SELm_16x1(2)) and (SELm_16x1(1)) and (not SELm_16x1(0))) or
				 (INm_16x1(7) and (not SELm_16x1(3)) and (SELm_16x1(2)) and (SELm_16x1(1)) and (SELm_16x1(0))) or
				 (INm_16x1(8) and (SELm_16x1(3)) and (not SELm_16x1(2)) and (not SELm_16x1(1)) and (not SELm_16x1(0))) or
				 (INm_16x1(9) and (SELm_16x1(3)) and (not SELm_16x1(2)) and (not SELm_16x1(1)) and (SELm_16x1(0))) or
				 (INm_16x1(10) and (SELm_16x1(3)) and (not SELm_16x1(2)) and (SELm_16x1(1)) and (not SELm_16x1(0))) or
				 (INm_16x1(11) and (SELm_16x1(3)) and (not SELm_16x1(2)) and (SELm_16x1(1)) and (SELm_16x1(0))) or
				 (INm_16x1(12) and (SELm_16x1(3)) and (SELm_16x1(2)) and (not SELm_16x1(1)) and (not SELm_16x1(0))) or
				 (INm_16x1(13) and (SELm_16x1(3)) and (SELm_16x1(2)) and (not SELm_16x1(1)) and (SELm_16x1(0))) or
				 (INm_16x1(14) and (SELm_16x1(3)) and (SELm_16x1(2)) and (SELm_16x1(1)) and (not SELm_16x1(0))) or
				 (INm_16x1(15) and (SELm_16x1(3)) and (SELm_16x1(2)) and (SELm_16x1(1)) and (SELm_16x1(0))));

end mux16x1_arc;
