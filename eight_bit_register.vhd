library ieee;
use ieee.std_logic_1164.all;

entity eight_bit_register is

port(
De: in std_logic_vector(7 downto 0); 
CLKe, Se, RSe, ENe: in std_logic;
Qe: out std_logic_vector(7 downto 0)
);

end eight_bit_register;

architecture eight_bit_register_arc of eight_bit_register is

component FFD is
port(

D, CLK, S, RS: in std_logic;
Q: out std_logic
);

end component;

component mux16x8 is

port(
Mm1, Mm2: in std_logic_vector(7 downto 0);
Sm: in std_logic;
Xm: out std_logic_vector(7 downto 0)
);

end component;

signal Dem, Qer: std_logic_vector(7 downto 0);

begin

mult: mux16x8 port map(
    Mm1 => Qer, 
    Mm2 => De,
    Sm => ENe,
    Xm => Dem
);

reg0: FFD port map(
    D => Dem(0), 
    CLK => CLKe, 
    S => Se, 
    RS => RSe,
    Q => Qer(0)
);

reg1: FFD port map(
    D => Dem(1), 
    CLK => CLKe, 
    S => Se, 
    RS => RSe,
    Q => Qer(1)
);

reg2: FFD port map(
    D => Dem(2), 
    CLK => CLKe, 
    S => Se, 
    RS => RSe,
    Q => Qer(2)
);

reg3: FFD port map(
    D => Dem(3), 
    CLK => CLKe, 
    S => Se, 
    RS => RSe,
    Q => Qer(3)
);

reg4: FFD port map(
    D => Dem(4), 
    CLK => CLKe, 
    S => Se, 
    RS => RSe,
    Q => Qer(4)
);

reg5: FFD port map(
    D => Dem(5), 
    CLK => CLKe, 
    S => Se, 
    RS => RSe,
    Q => Qer(5)
);

reg6: FFD port map(
    D => Dem(6), 
    CLK => CLKe, 
    S => Se, 
    RS => RSe,
    Q => Qer(6)
);

reg7: FFD port map(
    D => Dem(7), 
    CLK => CLKe, 
    S => Se, 
    RS => RSe,
    Q => Qer(7)
);

Qe <= Qer;

end eight_bit_register_arc;