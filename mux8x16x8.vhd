library ieee;
use ieee.std_logic_1164.all;

entity mux8x16x8 is

port(
INm_8_0, INm_8_1, INm_8_2, INm_8_3, 
INm_8_4, INm_8_5, INm_8_6, INm_8_7, 
INm_8_8, INm_8_9, INm_8_10, INm_8_11, 
INm_8_12, INm_8_13, INm_8_14, INm_8_15 : in std_logic_vector(7 downto 0);
ENm_8x16x8: in std_logic;
SELm_8x16x8: in std_logic_vector(3 downto 0);
OUTm_8x16x8: out std_logic_vector(7 downto 0)
);

end mux8x16x8;

architecture mux8x16x8_arc of mux8x16x8 is

component mux16x1 is

port(
INm_16x1: in std_logic_vector(15 downto 0);
ENm_16x1: in std_logic;
SELm_16x1: in std_logic_vector(3 downto 0);
OUTm_16x1: out std_logic
);

end component;

begin

mux0: mux16x1 port map(
INm_16x1(0) => INm_8_0(0),
INm_16x1(1) => INm_8_1(0),
INm_16x1(2) => INm_8_2(0),
INm_16x1(3) => INm_8_3(0),
INm_16x1(4) => INm_8_4(0),
INm_16x1(5) => INm_8_5(0),
INm_16x1(6) => INm_8_6(0),
INm_16x1(7) => INm_8_7(0),
INm_16x1(8) => INm_8_8(0),
INm_16x1(9) => INm_8_9(0),
INm_16x1(10) => INm_8_10(0),
INm_16x1(11) => INm_8_11(0),
INm_16x1(12) => INm_8_12(0),
INm_16x1(13) => INm_8_13(0),
INm_16x1(14) => INm_8_14(0),
INm_16x1(15) => INm_8_15(0),
ENm_16x1 => ENm_8x16x8,
SELm_16x1 => SELm_8x16x8,
OUTm_16x1 => OUTm_8x16x8(0)
);

mux1: mux16x1 port map(
INm_16x1(0) => INm_8_0(1),
INm_16x1(1) => INm_8_1(1),
INm_16x1(2) => INm_8_2(1),
INm_16x1(3) => INm_8_3(1),
INm_16x1(4) => INm_8_4(1),
INm_16x1(5) => INm_8_5(1),
INm_16x1(6) => INm_8_6(1),
INm_16x1(7) => INm_8_7(1),
INm_16x1(8) => INm_8_8(1),
INm_16x1(9) => INm_8_9(1),
INm_16x1(10) => INm_8_10(1),
INm_16x1(11) => INm_8_11(1),
INm_16x1(12) => INm_8_12(1),
INm_16x1(13) => INm_8_13(1),
INm_16x1(14) => INm_8_14(1),
INm_16x1(15) => INm_8_15(1),
ENm_16x1 => ENm_8x16x8,
SELm_16x1 => SELm_8x16x8,
OUTm_16x1 => OUTm_8x16x8(1)
);

mux2: mux16x1 port map(
INm_16x1(0) => INm_8_0(2),
INm_16x1(1) => INm_8_1(2),
INm_16x1(2) => INm_8_2(2),
INm_16x1(3) => INm_8_3(2),
INm_16x1(4) => INm_8_4(2),
INm_16x1(5) => INm_8_5(2),
INm_16x1(6) => INm_8_6(2),
INm_16x1(7) => INm_8_7(2),
INm_16x1(8) => INm_8_8(2),
INm_16x1(9) => INm_8_9(2),
INm_16x1(10) => INm_8_10(2),
INm_16x1(11) => INm_8_11(2),
INm_16x1(12) => INm_8_12(2),
INm_16x1(13) => INm_8_13(2),
INm_16x1(14) => INm_8_14(2),
INm_16x1(15) => INm_8_15(2),
ENm_16x1 => ENm_8x16x8,
SELm_16x1 => SELm_8x16x8,
OUTm_16x1 => OUTm_8x16x8(2)
);

mux3: mux16x1 port map(
INm_16x1(0) => INm_8_0(3),
INm_16x1(1) => INm_8_1(3),
INm_16x1(2) => INm_8_2(3),
INm_16x1(3) => INm_8_3(3),
INm_16x1(4) => INm_8_4(3),
INm_16x1(5) => INm_8_5(3),
INm_16x1(6) => INm_8_6(3),
INm_16x1(7) => INm_8_7(3),
INm_16x1(8) => INm_8_8(3),
INm_16x1(9) => INm_8_9(3),
INm_16x1(10) => INm_8_10(3),
INm_16x1(11) => INm_8_11(3),
INm_16x1(12) => INm_8_12(3),
INm_16x1(13) => INm_8_13(3),
INm_16x1(14) => INm_8_14(3),
INm_16x1(15) => INm_8_15(3),
ENm_16x1 => ENm_8x16x8,
SELm_16x1 => SELm_8x16x8,
OUTm_16x1 => OUTm_8x16x8(3)
);

mux4: mux16x1 port map(
INm_16x1(0) => INm_8_0(4),
INm_16x1(1) => INm_8_1(4),
INm_16x1(2) => INm_8_2(4),
INm_16x1(3) => INm_8_3(4),
INm_16x1(4) => INm_8_4(4),
INm_16x1(5) => INm_8_5(4),
INm_16x1(6) => INm_8_6(4),
INm_16x1(7) => INm_8_7(4),
INm_16x1(8) => INm_8_8(4),
INm_16x1(9) => INm_8_9(4),
INm_16x1(10) => INm_8_10(4),
INm_16x1(11) => INm_8_11(4),
INm_16x1(12) => INm_8_12(4),
INm_16x1(13) => INm_8_13(4),
INm_16x1(14) => INm_8_14(4),
INm_16x1(15) => INm_8_15(4),
ENm_16x1 => ENm_8x16x8,
SELm_16x1 => SELm_8x16x8,
OUTm_16x1 => OUTm_8x16x8(4)
);

mux5: mux16x1 port map(
INm_16x1(0) => INm_8_0(5),
INm_16x1(1) => INm_8_1(5),
INm_16x1(2) => INm_8_2(5),
INm_16x1(3) => INm_8_3(5),
INm_16x1(4) => INm_8_4(5),
INm_16x1(5) => INm_8_5(5),
INm_16x1(6) => INm_8_6(5),
INm_16x1(7) => INm_8_7(5),
INm_16x1(8) => INm_8_8(5),
INm_16x1(9) => INm_8_9(5),
INm_16x1(10) => INm_8_10(5),
INm_16x1(11) => INm_8_11(5),
INm_16x1(12) => INm_8_12(5),
INm_16x1(13) => INm_8_13(5),
INm_16x1(14) => INm_8_14(5),
INm_16x1(15) => INm_8_15(5),
ENm_16x1 => ENm_8x16x8,
SELm_16x1 => SELm_8x16x8,
OUTm_16x1 => OUTm_8x16x8(5)
);

mux6: mux16x1 port map(
INm_16x1(0) => INm_8_0(6),
INm_16x1(1) => INm_8_1(6),
INm_16x1(2) => INm_8_2(6),
INm_16x1(3) => INm_8_3(6),
INm_16x1(4) => INm_8_4(6),
INm_16x1(5) => INm_8_5(6),
INm_16x1(6) => INm_8_6(6),
INm_16x1(7) => INm_8_7(6),
INm_16x1(8) => INm_8_8(6),
INm_16x1(9) => INm_8_9(6),
INm_16x1(10) => INm_8_10(6),
INm_16x1(11) => INm_8_11(6),
INm_16x1(12) => INm_8_12(6),
INm_16x1(13) => INm_8_13(6),
INm_16x1(14) => INm_8_14(6),
INm_16x1(15) => INm_8_15(6),
ENm_16x1 => ENm_8x16x8,
SELm_16x1 => SELm_8x16x8,
OUTm_16x1 => OUTm_8x16x8(6)
);

mux7: mux16x1 port map(
INm_16x1(0) => INm_8_0(7),
INm_16x1(1) => INm_8_1(7),
INm_16x1(2) => INm_8_2(7),
INm_16x1(3) => INm_8_3(7),
INm_16x1(4) => INm_8_4(7),
INm_16x1(5) => INm_8_5(7),
INm_16x1(6) => INm_8_6(7),
INm_16x1(7) => INm_8_7(7),
INm_16x1(8) => INm_8_8(7),
INm_16x1(9) => INm_8_9(7),
INm_16x1(10) => INm_8_10(7),
INm_16x1(11) => INm_8_11(7),
INm_16x1(12) => INm_8_12(7),
INm_16x1(13) => INm_8_13(7),
INm_16x1(14) => INm_8_14(7),
INm_16x1(15) => INm_8_15(7),
ENm_16x1 => ENm_8x16x8,
SELm_16x1 => SELm_8x16x8,
OUTm_16x1 => OUTm_8x16x8(7)
);

end mux8x16x8_arc;