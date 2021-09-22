library ieee;
use ieee.std_logic_1164.all;

entity registers_bank is
port(
WDATArb: in std_logic_vector(7 downto 0);
WADDRrb, RADDRrb_A, RADDRrb_B: in std_logic_vector(3 downto 0);
WRrb, RDrb_A, RDrb_B, CLKrb, CLRrb: in std_logic;
RDATArb_A, RDATArb_B: out std_logic_vector(7 downto 0)
);

end registers_bank;

architecture registers_bank_arc of registers_bank is

signal OUTd_1x16_aux: std_logic_vector(15 downto 0);
signal Qe_aux_0, Qe_aux_1, Qe_aux_2, Qe_aux_3, 
Qe_aux_4, Qe_aux_5, Qe_aux_6, Qe_aux_7, 
Qe_aux_8, Qe_aux_9, Qe_aux_10, Qe_aux_11, 
Qe_aux_12, Qe_aux_13, Qe_aux_14, Qe_aux_15: std_logic_vector(7 downto 0);

component eight_bit_register is

port(
De: in std_logic_vector(7 downto 0); 
CLKe, Se, RSe, ENe: in std_logic;
Qe: out std_logic_vector(7 downto 0)
);

end component;

component dec1x16 is

port(
INd_1x16: in std_logic;
SELd_1x16: in std_logic_vector(3 downto 0);
OUTd_1x16: out std_logic_vector(15 downto 0)
);

end component;

component mux8x16x8 is

port(
INm_8_0, INm_8_1, INm_8_2, INm_8_3, 
INm_8_4, INm_8_5, INm_8_6, INm_8_7, 
INm_8_8, INm_8_9, INm_8_10, INm_8_11, 
INm_8_12, INm_8_13, INm_8_14, INm_8_15 : in std_logic_vector(7 downto 0);
ENm_8x16x8: in std_logic;
SELm_8x16x8: in std_logic_vector(3 downto 0);
OUTm_8x16x8: out std_logic_vector(7 downto 0)
);

end component;

begin

decoder: dec1x16 port map(
INd_1x16 => WRrb,
SELd_1x16 => WADDRrb,
OUTd_1x16 => OUTd_1x16_aux
);

reg0: eight_bit_register port map(
De => WDATArb,
CLKe => CLKrb,
Se => '1',
RSe => CLRrb,
ENe => OUTd_1x16_aux(0),
Qe => Qe_aux_0
);

reg1: eight_bit_register port map(
De => WDATArb,
CLKe => CLKrb,
Se => '1',
RSe => CLRrb,
ENe => OUTd_1x16_aux(1),
Qe => Qe_aux_1
);

reg2: eight_bit_register port map(
De => WDATArb,
CLKe => CLKrb,
Se => '1',
RSe => CLRrb,
ENe => OUTd_1x16_aux(2),
Qe => Qe_aux_2
);

reg3: eight_bit_register port map(
De => WDATArb,
CLKe => CLKrb,
Se => '1',
RSe => CLRrb,
ENe => OUTd_1x16_aux(3),
Qe => Qe_aux_3
);

reg4: eight_bit_register port map(
De => WDATArb,
CLKe => CLKrb,
Se => '1',
RSe => CLRrb,
ENe => OUTd_1x16_aux(4),
Qe => Qe_aux_4
);

reg5: eight_bit_register port map(
De => WDATArb,
CLKe => CLKrb,
Se => '1',
RSe => CLRrb,
ENe => OUTd_1x16_aux(5),
Qe => Qe_aux_5
);

reg6: eight_bit_register port map(
De => WDATArb,
CLKe => CLKrb,
Se => '1',
RSe => CLRrb,
ENe => OUTd_1x16_aux(6),
Qe => Qe_aux_6
);

reg7: eight_bit_register port map(
De => WDATArb,
CLKe => CLKrb,
Se => '1',
RSe => CLRrb,
ENe => OUTd_1x16_aux(7),
Qe => Qe_aux_7
);

reg8: eight_bit_register port map(
De => WDATArb,
CLKe => CLKrb,
Se => '1',
RSe => CLRrb,
ENe => OUTd_1x16_aux(8),
Qe => Qe_aux_8
);

reg9: eight_bit_register port map(
De => WDATArb,
CLKe => CLKrb,
Se => '1',
RSe => CLRrb,
ENe => OUTd_1x16_aux(9),
Qe => Qe_aux_9
);

reg10: eight_bit_register port map(
De => WDATArb,
CLKe => CLKrb,
Se => '1',
RSe => CLRrb,
ENe => OUTd_1x16_aux(10),
Qe => Qe_aux_10
);

reg11: eight_bit_register port map(
De => WDATArb,
CLKe => CLKrb,
Se => '1',
RSe => CLRrb,
ENe => OUTd_1x16_aux(11),
Qe => Qe_aux_11
);

reg12: eight_bit_register port map(
De => WDATArb,
CLKe => CLKrb,
Se => '1',
RSe => CLRrb,
ENe => OUTd_1x16_aux(12),
Qe => Qe_aux_12
);

reg13: eight_bit_register port map(
De => WDATArb,
CLKe => CLKrb,
Se => '1',
RSe => CLRrb,
ENe => OUTd_1x16_aux(13),
Qe => Qe_aux_13
);

reg14: eight_bit_register port map(
De => WDATArb,
CLKe => CLKrb,
Se => '1',
RSe => CLRrb,
ENe => OUTd_1x16_aux(14),
Qe => Qe_aux_14
);

reg15: eight_bit_register port map(
De => WDATArb,
CLKe => CLKrb,
Se => '1',
RSe => CLRrb,
ENe => OUTd_1x16_aux(15),
Qe => Qe_aux_15
);

mux0: mux8x16x8 port map(
INm_8_0 => Qe_aux_0,
INm_8_1 => Qe_aux_1,
INm_8_2 => Qe_aux_2,
INm_8_3 => Qe_aux_3,
INm_8_4 => Qe_aux_4,
INm_8_5 => Qe_aux_5,
INm_8_6 => Qe_aux_6,
INm_8_7 => Qe_aux_7,
INm_8_8 => Qe_aux_8,
INm_8_9 => Qe_aux_9,
INm_8_10 => Qe_aux_10,
INm_8_11 => Qe_aux_11,
INm_8_12 => Qe_aux_12,
INm_8_13 => Qe_aux_13,
INm_8_14 => Qe_aux_14,
INm_8_15 => Qe_aux_15,
ENm_8x16x8 => RDrb_A,
SELm_8x16x8 => RADDRrb_A,
OUTm_8x16x8 => RDATArb_A
);


mux1: mux8x16x8 port map(
INm_8_0 => Qe_aux_0,
INm_8_1 => Qe_aux_1,
INm_8_2 => Qe_aux_2,
INm_8_3 => Qe_aux_3,
INm_8_4 => Qe_aux_4,
INm_8_5 => Qe_aux_5,
INm_8_6 => Qe_aux_6,
INm_8_7 => Qe_aux_7,
INm_8_8 => Qe_aux_8,
INm_8_9 => Qe_aux_9,
INm_8_10 => Qe_aux_10,
INm_8_11 => Qe_aux_11,
INm_8_12 => Qe_aux_12,
INm_8_13 => Qe_aux_13,
INm_8_14 => Qe_aux_14,
INm_8_15 => Qe_aux_15,
ENm_8x16x8 => RDrb_B,
SELm_8x16x8 => RADDRrb_B,
OUTm_8x16x8 => RDATArb_B
);

end registers_bank_arc;