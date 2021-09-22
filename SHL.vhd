library ieee;
use ieee.std_logic_1164.all;

entity SHL is 
  port(A_shl:  in std_logic_vector(7 downto 0);
       S_shl:  out std_logic_vector(7 downto 0)
		 );
end SHL;

architecture arrangement of SHL is
	begin

	S_shl(7) <= A_shl(6); 
	S_shl(6) <= A_shl(5);
	S_shl(5) <= A_shl(4);
	S_shl(4) <= A_shl(3);
	S_shl(3) <= A_shl(2);
	S_shl(2) <= A_shl(1);
	S_shl(1) <= A_shl(0);
	S_shl(0) <= '0';


end arrangement;

   