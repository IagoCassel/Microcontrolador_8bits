library ieee;
use ieee.std_logic_1164.all;

entity SHR is 
  port(A_shr:  in std_logic_vector(7 downto 0);
       S_shr:  out std_logic_vector(7 downto 0)
		 );
end SHR;

architecture arrangement of SHR is

	begin

	S_shr(7) <= '0'; 
	S_shr(6) <= A_shr(7);
	S_shr(5) <= A_shr(6);
	S_shr(4) <= A_shr(5);
	S_shr(3) <= A_shr(4);
	S_shr(2) <= A_shr(3);
	S_shr(1) <= A_shr(2);
	S_shr(0) <= A_shr(1);


end arrangement;
