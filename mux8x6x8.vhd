library ieee;
use ieee.std_logic_1164.all;

entity mux8x6x8 is

port(
IN0, IN1, IN2, IN3, IN4, IN5: in std_logic_vector(7 downto 0);
SEL_8x6x8: in std_logic_vector(2 downto 0);
OUT_8x6x8: out std_logic_vector(7 downto 0)
);

end mux8x6x8;

architecture mux8x6x8_arc of mux8x6x8 is

signal nSEL_8x6x8: std_logic_vector(2 downto 0);

begin

nSEL_8x6x8(2) <= not SEL_8x6x8(2);
nSEL_8x6x8(1) <= not SEL_8x6x8(1);
nSEL_8x6x8(0) <= not SEL_8x6x8(0);

OUT_8x6x8(7) <=
((IN0(7) and nSEL_8x6x8(2) and nSEL_8x6x8(1) and nSEL_8x6x8(0)) or
 (IN1(7) and nSEL_8x6x8(2) and nSEL_8x6x8(1) and SEL_8x6x8(0)) or
 (IN2(7) and nSEL_8x6x8(2) and SEL_8x6x8(1) and nSEL_8x6x8(0)) or
 (IN3(7) and nSEL_8x6x8(2) and SEL_8x6x8(1) and SEL_8x6x8(0)) or
 (IN4(7) and SEL_8x6x8(2) and nSEL_8x6x8(1) and nSEL_8x6x8(0)) or
 (IN5(7) and SEL_8x6x8(2) and nSEL_8x6x8(1) and SEL_8x6x8(0)));

OUT_8x6x8(6) <=
((IN0(6) and nSEL_8x6x8(2) and nSEL_8x6x8(1) and nSEL_8x6x8(0)) or
 (IN1(6) and nSEL_8x6x8(2) and nSEL_8x6x8(1) and SEL_8x6x8(0)) or
 (IN2(6) and nSEL_8x6x8(2) and SEL_8x6x8(1) and nSEL_8x6x8(0)) or
 (IN3(6) and nSEL_8x6x8(2) and SEL_8x6x8(1) and SEL_8x6x8(0)) or
 (IN4(6) and SEL_8x6x8(2) and nSEL_8x6x8(1) and nSEL_8x6x8(0)) or
 (IN5(6) and SEL_8x6x8(2) and nSEL_8x6x8(1) and SEL_8x6x8(0)));

OUT_8x6x8(5) <=
((IN0(5) and nSEL_8x6x8(2) and nSEL_8x6x8(1) and nSEL_8x6x8(0)) or
 (IN1(5) and nSEL_8x6x8(2) and nSEL_8x6x8(1) and SEL_8x6x8(0)) or
 (IN2(5) and nSEL_8x6x8(2) and SEL_8x6x8(1) and nSEL_8x6x8(0)) or
 (IN3(5) and nSEL_8x6x8(2) and SEL_8x6x8(1) and SEL_8x6x8(0)) or
 (IN4(5) and SEL_8x6x8(2) and nSEL_8x6x8(1) and nSEL_8x6x8(0)) or
 (IN5(5) and SEL_8x6x8(2) and nSEL_8x6x8(1) and SEL_8x6x8(0)));
 
OUT_8x6x8(4) <=
((IN0(4) and nSEL_8x6x8(2) and nSEL_8x6x8(1) and nSEL_8x6x8(0)) or
 (IN1(4) and nSEL_8x6x8(2) and nSEL_8x6x8(1) and SEL_8x6x8(0)) or
 (IN2(4) and nSEL_8x6x8(2) and SEL_8x6x8(1) and nSEL_8x6x8(0)) or
 (IN3(4) and nSEL_8x6x8(2) and SEL_8x6x8(1) and SEL_8x6x8(0)) or
 (IN4(4) and SEL_8x6x8(2) and nSEL_8x6x8(1) and nSEL_8x6x8(0)) or
 (IN5(4) and SEL_8x6x8(2) and nSEL_8x6x8(1) and SEL_8x6x8(0)));
 
OUT_8x6x8(3) <=
((IN0(3) and nSEL_8x6x8(2) and nSEL_8x6x8(1) and nSEL_8x6x8(0)) or
 (IN1(3) and nSEL_8x6x8(2) and nSEL_8x6x8(1) and SEL_8x6x8(0)) or
 (IN2(3) and nSEL_8x6x8(2) and SEL_8x6x8(1) and nSEL_8x6x8(0)) or
 (IN3(3) and nSEL_8x6x8(2) and SEL_8x6x8(1) and SEL_8x6x8(0)) or
 (IN4(3) and SEL_8x6x8(2) and nSEL_8x6x8(1) and nSEL_8x6x8(0)) or
 (IN5(3) and SEL_8x6x8(2) and nSEL_8x6x8(1) and SEL_8x6x8(0)));

OUT_8x6x8(2) <=
((IN0(2) and nSEL_8x6x8(2) and nSEL_8x6x8(1) and nSEL_8x6x8(0)) or
 (IN1(2) and nSEL_8x6x8(2) and nSEL_8x6x8(1) and SEL_8x6x8(0)) or
 (IN2(2) and nSEL_8x6x8(2) and SEL_8x6x8(1) and nSEL_8x6x8(0)) or
 (IN3(2) and nSEL_8x6x8(2) and SEL_8x6x8(1) and SEL_8x6x8(0)) or
 (IN4(2) and SEL_8x6x8(2) and nSEL_8x6x8(1) and nSEL_8x6x8(0)) or
 (IN5(2) and SEL_8x6x8(2) and nSEL_8x6x8(1) and SEL_8x6x8(0)));

OUT_8x6x8(1) <=
((IN0(1) and nSEL_8x6x8(2) and nSEL_8x6x8(1) and nSEL_8x6x8(0)) or
 (IN1(1) and nSEL_8x6x8(2) and nSEL_8x6x8(1) and SEL_8x6x8(0)) or
 (IN2(1) and nSEL_8x6x8(2) and SEL_8x6x8(1) and nSEL_8x6x8(0)) or
 (IN3(1) and nSEL_8x6x8(2) and SEL_8x6x8(1) and SEL_8x6x8(0)) or
 (IN4(1) and SEL_8x6x8(2) and nSEL_8x6x8(1) and nSEL_8x6x8(0)) or
 (IN5(1) and SEL_8x6x8(2) and nSEL_8x6x8(1) and SEL_8x6x8(0)));
 
OUT_8x6x8(0) <=
((IN0(0) and nSEL_8x6x8(2) and nSEL_8x6x8(1) and nSEL_8x6x8(0)) or
 (IN1(0) and nSEL_8x6x8(2) and nSEL_8x6x8(1) and SEL_8x6x8(0)) or
 (IN2(0) and nSEL_8x6x8(2) and SEL_8x6x8(1) and nSEL_8x6x8(0)) or
 (IN3(0) and nSEL_8x6x8(2) and SEL_8x6x8(1) and SEL_8x6x8(0)) or
 (IN4(0) and SEL_8x6x8(2) and nSEL_8x6x8(1) and nSEL_8x6x8(0)) or
 (IN5(0) and SEL_8x6x8(2) and nSEL_8x6x8(1) and SEL_8x6x8(0)));

end mux8x6x8_arc;