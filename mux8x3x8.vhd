library ieee;
use ieee.std_logic_1164.all;

entity mux8x3x8 is

port(
IN0, IN1, IN2: in std_logic_vector(7 downto 0);
SEL_8x3x8: in std_logic_vector(1 downto 0);
OUT_8x3x8: out std_logic_vector(7 downto 0)
);

end mux8x3x8;

architecture mux8x3x8_arc of mux8x3x8 is

signal nSEL_8x3x8: std_logic_vector(1 downto 0);

begin

nSEL_8x3x8(1) <= not SEL_8x3x8(1);
nSEL_8x3x8(0) <= not SEL_8x3x8(0);

OUT_8x3x8(7) <=
((IN0(7) and nSEL_8x3x8(1) and nSEL_8x3x8(0)) or
 (IN1(7) and nSEL_8x3x8(1) and SEL_8x3x8(0)) or
 (IN2(7) and SEL_8x3x8(1) and nSEL_8x3x8(0)));

OUT_8x3x8(6) <=
((IN0(6) and nSEL_8x3x8(1) and nSEL_8x3x8(0)) or
 (IN1(6) and nSEL_8x3x8(1) and SEL_8x3x8(0)) or
 (IN2(6) and SEL_8x3x8(1) and nSEL_8x3x8(0)));

OUT_8x3x8(5) <=
((IN0(5) and nSEL_8x3x8(1) and nSEL_8x3x8(0)) or
 (IN1(5) and nSEL_8x3x8(1) and SEL_8x3x8(0)) or
 (IN2(5) and SEL_8x3x8(1) and nSEL_8x3x8(0)));
 
OUT_8x3x8(4) <=
((IN0(4) and nSEL_8x3x8(1) and nSEL_8x3x8(0)) or
 (IN1(4) and nSEL_8x3x8(1) and SEL_8x3x8(0)) or
 (IN2(4) and SEL_8x3x8(1) and nSEL_8x3x8(0)));
 
OUT_8x3x8(3) <=
((IN0(3) and nSEL_8x3x8(1) and nSEL_8x3x8(0)) or
 (IN1(3) and nSEL_8x3x8(1) and SEL_8x3x8(0)) or
 (IN2(3) and SEL_8x3x8(1) and nSEL_8x3x8(0)));

OUT_8x3x8(2) <=
((IN0(2) and nSEL_8x3x8(1) and nSEL_8x3x8(0)) or
 (IN1(2) and nSEL_8x3x8(1) and SEL_8x3x8(0)) or
 (IN2(2) and SEL_8x3x8(1) and nSEL_8x3x8(0)));

OUT_8x3x8(1) <=
((IN0(1) and nSEL_8x3x8(1) and nSEL_8x3x8(0)) or
 (IN1(1) and nSEL_8x3x8(1) and SEL_8x3x8(0)) or
 (IN2(1) and SEL_8x3x8(1) and nSEL_8x3x8(0)));
 
OUT_8x3x8(0) <=
((IN0(0) and nSEL_8x3x8(1) and nSEL_8x3x8(0)) or
 (IN1(0) and nSEL_8x3x8(1) and SEL_8x3x8(0)) or
 (IN2(0) and SEL_8x3x8(1) and nSEL_8x3x8(0)));

end mux8x3x8_arc;