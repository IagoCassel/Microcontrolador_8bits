library ieee;
use ieee.std_logic_1164.all;

entity dec1x16 is

port(
INd_1x16: in std_logic;
SELd_1x16: in std_logic_vector(3 downto 0);
OUTd_1x16: out std_logic_vector(15 downto 0)
);

end dec1x16;

architecture dec1x16_arc of dec1x16 is

begin

OUTd_1x16(0) <= (INd_1x16 and (not SELd_1x16(3)) and (not SELd_1x16(2)) and (not SELd_1x16(1)) and (not SELd_1x16(0)));
OUTd_1x16(1) <= (INd_1x16 and (not SELd_1x16(3)) and (not SELd_1x16(2)) and (not SELd_1x16(1)) and (SELd_1x16(0)));
OUTd_1x16(2) <= (INd_1x16 and (not SELd_1x16(3)) and (not SELd_1x16(2)) and (SELd_1x16(1)) and (not SELd_1x16(0)));
OUTd_1x16(3) <= (INd_1x16 and (not SELd_1x16(3)) and (not SELd_1x16(2)) and (SELd_1x16(1)) and (SELd_1x16(0)));
OUTd_1x16(4) <= (INd_1x16 and (not SELd_1x16(3)) and (SELd_1x16(2)) and (not SELd_1x16(1)) and (not SELd_1x16(0)));
OUTd_1x16(5) <= (INd_1x16 and (not SELd_1x16(3)) and (SELd_1x16(2)) and (not SELd_1x16(1)) and (SELd_1x16(0)));
OUTd_1x16(6) <= (INd_1x16 and (not SELd_1x16(3)) and (SELd_1x16(2)) and (SELd_1x16(1)) and (not SELd_1x16(0)));
OUTd_1x16(7) <= (INd_1x16 and (not SELd_1x16(3)) and (SELd_1x16(2)) and (SELd_1x16(1)) and (SELd_1x16(0)));
OUTd_1x16(8) <= (INd_1x16 and (SELd_1x16(3)) and (not SELd_1x16(2)) and (not SELd_1x16(1)) and (not SELd_1x16(0)));
OUTd_1x16(9) <= (INd_1x16 and (SELd_1x16(3)) and (not SELd_1x16(2)) and (not SELd_1x16(1)) and (SELd_1x16(0)));
OUTd_1x16(10) <= (INd_1x16 and (SELd_1x16(3)) and (not SELd_1x16(2)) and (SELd_1x16(1)) and (not SELd_1x16(0)));
OUTd_1x16(11) <= (INd_1x16 and (SELd_1x16(3)) and (not SELd_1x16(2)) and (SELd_1x16(1)) and (SELd_1x16(0)));
OUTd_1x16(12) <= (INd_1x16 and (SELd_1x16(3)) and (SELd_1x16(2)) and (not SELd_1x16(1)) and (not SELd_1x16(0)));
OUTd_1x16(13) <= (INd_1x16 and (SELd_1x16(3)) and (SELd_1x16(2)) and (not SELd_1x16(1)) and (SELd_1x16(0)));
OUTd_1x16(14) <= (INd_1x16 and (SELd_1x16(3)) and (SELd_1x16(2)) and (SELd_1x16(1)) and (not SELd_1x16(0)));
OUTd_1x16(15) <= (INd_1x16 and (SELd_1x16(3)) and (SELd_1x16(2)) and (SELd_1x16(1)) and (SELd_1x16(0)));

end dec1x16_arc;