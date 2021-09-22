library ieee;
use ieee.std_logic_1164.all;

entity IR_register is

port(
De: in std_logic_vector(16 downto 0); 
CLKe, Se, RSe, ENe: in std_logic;
Qe: out std_logic_vector(16 downto 0)
);

end IR_register;

architecture IR_register_arc of IR_register is

component FFD is
port(

D, CLK, S, RS: in std_logic;
Q: out std_logic
);

end component;

component mux34x17 is

port(
Mm1, Mm2: in std_logic_vector(16 downto 0);
Sm: in std_logic;
Xm: out std_logic_vector(16 downto 0)
);

end component;

signal Dem, Qer: std_logic_vector(16 downto 0);

begin

mult: mux34x17 port map(
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

reg8: FFD port map(
    D => Dem(8), 
    CLK => CLKe, 
    S => Se, 
    RS => RSe,
    Q => Qer(8)
);

reg9: FFD port map(
    D => Dem(9), 
    CLK => CLKe, 
    S => Se, 
    RS => RSe,
    Q => Qer(9)
);

reg10: FFD port map(
    D => Dem(10), 
    CLK => CLKe, 
    S => Se, 
    RS => RSe,
    Q => Qer(10)
);

reg11: FFD port map(
    D => Dem(11), 
    CLK => CLKe, 
    S => Se, 
    RS => RSe,
    Q => Qer(11)
);

reg12: FFD port map(
    D => Dem(12), 
    CLK => CLKe, 
    S => Se, 
    RS => RSe,
    Q => Qer(12)
);

reg13: FFD port map(
    D => Dem(13), 
    CLK => CLKe, 
    S => Se, 
    RS => RSe,
    Q => Qer(13)
);

reg14: FFD port map(
    D => Dem(14), 
    CLK => CLKe, 
    S => Se, 
    RS => RSe,
    Q => Qer(14)
);

reg15: FFD port map(
    D => Dem(15), 
    CLK => CLKe, 
    S => Se, 
    RS => RSe,
    Q => Qer(15)
);

reg16: FFD port map(
    D => Dem(16), 
    CLK => CLKe, 
    S => Se, 
    RS => RSe,
    Q => Qer(16)
);

Qe <= Qer;

end IR_register_arc;