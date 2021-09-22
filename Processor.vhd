library ieee;
use ieee.std_logic_1164.all;

entity Processor is
  port(CLK_pr, RESET_p: in std_logic;
		 D_p, E_p: in std_logic_vector(7 downto 0);
		 led_ovf_sum_p, led_ovf_mult_p, led_ovf_inc_p: out std_logic;
		 A_p, B_p, C_p: out std_logic_vector(7 downto 0)
		 );
		 
end Processor;

architecture Processor_arc of Processor is

-------------------------------------------------------------------

component registers_bank is
port(
WDATArb: in std_logic_vector(7 downto 0);
WADDRrb, RADDRrb_A, RADDRrb_B: in std_logic_vector(3 downto 0);
WRrb, RDrb_A, RDrb_B, CLKrb, CLRrb: in std_logic;
RDATArb_A, RDATArb_B: out std_logic_vector(7 downto 0)
);

end component;

-------------------------------------------------------------------

component ULA is
  port(A_ula: in std_logic_vector(7 downto 0);
		 B_ula: in std_logic_vector(7 downto 0);
		 Se_ula: in std_logic_vector(3 downto 0);
		 Out_ula: out std_logic_vector(7 downto 0);
		 led_ovf_sum: out std_logic;
		 led_ovf_mult: out std_logic;
		 led_ovf_inc: out std_logic;
		 jump_eq: out std_logic;
		 jump_hi: out std_logic;
		 jump_lo: out std_logic);
		 
end component;

-------------------------------------------------------------------

component mux8x6x8 is

port(
IN0, IN1, IN2, IN3, IN4, IN5: in std_logic_vector(7 downto 0);
SEL_8x6x8: in std_logic_vector(2 downto 0);
OUT_8x6x8: out std_logic_vector(7 downto 0)
);

end component;

-------------------------------------------------------------------

component Pilha_LIFO is 
	port (PUSH_p, POP_p, CLK_p: in std_logic;
			Data_in_p : in std_logic_vector(7 downto 0);
			Data_out_p : OUT std_logic_vector(7 downto 0));
end component;

-------------------------------------------------------------------

component eight_bit_register is

port(
De: in std_logic_vector(7 downto 0); 
CLKe, Se, RSe, ENe: in std_logic;
Qe: out std_logic_vector(7 downto 0)
);

end component;

-------------------------------------------------------------------

component contadorPC is
  port (cont_func: in std_logic_vector(7 downto 0);
        PC_ld_cont: in std_logic;
        PC_inc_cont: in std_logic;
		  PC_clr_cont: in std_logic;
		  CLK_PC: in std_logic;
        pc_out: out std_logic_vector(7 downto 0));
        
end component;

-------------------------------------------------------------------

component IR_register is

port(
De: in std_logic_vector(16 downto 0); 
CLKe, Se, RSe, ENe: in std_logic;
Qe: out std_logic_vector(16 downto 0)
);

end component;

-------------------------------------------------------------------

component somador8bits is 
  port(A:  in std_logic_vector(7 downto 0);
       B:  in std_logic_vector(7 downto 0 );
       Ci: in std_logic;
       Co: out std_logic;
       S_MSB:  out std_logic_vector(7 downto 0)
		 );
		
end component;

-------------------------------------------------------------------

component subtrator8bits is 
  port(A_sub:  in std_logic_vector(7 downto 0);
       B_sub:  in std_logic_vector(7 downto 0 );
       En_sub: in std_logic;
		 S_sub:  out std_logic_vector(7 downto 0)
		 );
		    
end component;

-------------------------------------------------------------------

component mux8x3x8 is

port(
IN0, IN1, IN2: in std_logic_vector(7 downto 0);
SEL_8x3x8: in std_logic_vector(1 downto 0);
OUT_8x3x8: out std_logic_vector(7 downto 0)
);

end component;

-------------------------------------------------------------------

component Control is

port(
JMP_lo, JMP_hi, JMP_eq, CLKc, RESETc: in std_logic;

IR: in std_logic_vector(16 downto 0);

IR_ld, I_rd, 
PC_inc, PC_clr, PC_ld, 
ld_push_RET, ld_pop_RET,
RF_W_wr, RF_Rp_rd, RF_Rq_rd, 
MEM_rd, MEM_wr,
ld_push, ld_pop: out std_logic;

selec_PC, F_s: out std_logic_vector(1 downto 0);

RF_s: out std_logic_vector(2 downto 0);

alu_s, RF_W_addr, RF_Rp_addr, RF_Rq_addr: out std_logic_vector(3 downto 0);

JUMP_inc, CALL_addr, Port_Reg_data, MEM_addr: out std_logic_vector(7 downto 0)
);

end component;

-------------------------------------------------------------------

COMPONENT I_MEM IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (16 DOWNTO 0)
	);
END COMPONENT;

-------------------------------------------------------------------

COMPONENT DATA_MEM IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END COMPONENT;

-------------------------------------------------------------------

signal JMP_lo_SIG, JMP_hi_SIG, JMP_eq_SIG, IR_ld_SIG, I_rd_SIG, PC_inc_SIG, PC_clr_SIG, PC_ld_SIG, 
ld_push_RET_SIG, ld_pop_RET_SIG, RF_W_wr_SIG, RF_Rp_rd_SIG, RF_Rq_rd_SIG, MEM_rd_SIG, MEM_wr_SIG, 
ld_push_SIG, ld_pop_SIG, ld_A, ld_B, ld_C: std_logic;

signal selec_PC_SIG, F_s_SIG: std_logic_vector(1 downto 0);

signal RF_s_SIG: std_logic_vector(2 downto 0);

signal alu_s_SIG, RF_W_addr_SIG, RF_Rp_addr_SIG, RF_Rq_addr_SIG: std_logic_vector(3 downto 0);

signal JUMP_inc_SIG, CALL_addr_SIG, Port_Reg_data_SIG, MEM_addr_SIG, W_data_SIG, Rp_data_SIG, Rq_data_SIG,
Out_ula_SIG, LIFO_out_SIG, LIFO_out_RET_SIG, MEM_data_SIG, cont_func_SIG, IMEM_addr_SIG, ADD_JUMP_Out, FULL_JUMP_Out: std_logic_vector(7 downto 0);

signal IR_SIG, IMEM_data_SIG: std_logic_vector(16 downto 0);

begin

ld_A <= ((not F_s_SIG(1)) and F_s_SIG(0));
ld_B <= (F_s_SIG(1) and (not F_s_SIG(0)));
ld_C <= (F_s_SIG(1) and F_s_SIG(0));

CONTROLE: Control port map(

		 --in std_logic;

		 JMP_lo => JMP_lo_SIG, 
		 JMP_hi => JMP_hi_SIG, 
		 JMP_eq => JMP_eq_SIG, 
		 CLKc => CLK_pr, 
		 RESETc => RESET_p,
		 
		 --in std_logic_vector(16 downto 0)
		 
		 IR => IR_SIG,

		 --out std_logic;
		 
		 IR_ld => IR_ld_SIG, 
		 I_rd => I_rd_SIG, 
		 PC_inc => PC_inc_SIG, 
		 PC_clr => PC_clr_SIG, 
		 PC_ld => PC_ld_SIG, 
		 ld_push_RET => ld_push_RET_SIG, 
		 ld_pop_RET => ld_pop_RET_SIG,
		 RF_W_wr => RF_W_wr_SIG, 
		 RF_Rp_rd => RF_Rp_rd_SIG, 
		 RF_Rq_rd => RF_Rq_rd_SIG, 
		 MEM_rd => MEM_rd_SIG, 
		 MEM_wr => MEM_wr_SIG,
		 ld_push => ld_push_SIG, 
		 ld_pop => ld_pop_SIG,

		 --out std_logic_vector(1 downto 0)
		 
		 selec_PC => selec_PC_SIG, 
		 F_s => F_s_SIG,

		 --out std_logic_vector(2 downto 0)
		 
		 RF_s => RF_s_SIG,

		 --out std_logic_vector(3 downto 0)
		 
		 alu_s => alu_s_SIG, 
		 RF_W_addr => RF_W_addr_SIG, 
		 RF_Rp_addr => RF_Rp_addr_SIG, 
		 RF_Rq_addr => RF_Rq_addr_SIG,
		
		 --out std_logic_vector(7 downto 0)
		
		 JUMP_inc => JUMP_inc_SIG, 
		 CALL_addr => CALL_addr_SIG, 
		 Port_Reg_data => Port_Reg_data_SIG, 
		 MEM_addr => MEM_addr_SIG
);

BANCO: registers_bank port map(

		 WDATArb => W_data_SIG,
		 WADDRrb => RF_W_addr_SIG, 
		 RADDRrb_A => RF_Rp_addr_SIG, 
		 RADDRrb_B => RF_Rq_addr_SIG,
		 WRrb => RF_W_wr_SIG, 
		 RDrb_A => RF_Rp_rd_SIG, 
		 RDrb_B => RF_Rq_rd_SIG, 
		 CLKrb => CLK_pr, 
		 CLRrb => '1',
		 RDATArb_A => Rp_data_SIG, 
		 RDATArb_B => Rq_data_SIG
);

ALU: ULA port map(

		 A_ula => Rp_data_SIG,
		 B_ula => Rq_data_SIG,
		 Se_ula => alu_s_SIG,
		 Out_ula => Out_ula_SIG,
		 led_ovf_sum => led_ovf_sum_p,
		 led_ovf_mult => led_ovf_mult_p,
		 led_ovf_inc => led_ovf_inc_p,
		 jump_eq => JMP_eq_SIG,
		 jump_hi => JMP_hi_SIG,
		 jump_lo => JMP_lo_SIG
);

PILHA: Pilha_LIFO port map(

		 PUSH_p => ld_push_SIG, 
		 POP_p => ld_pop_SIG, 
		 CLK_p => CLK_pr,
		 Data_in_p => Rp_data_SIG,
		 Data_out_p => LIFO_out_SIG
);

MUX_BANCO: mux8x6x8 port map(

		 IN0 => D_p, 
		 IN1 => E_p, 
		 IN2 => LIFO_out_SIG, 
		 IN3 => Out_ula_SIG, 
		 IN4 => MEM_data_SIG, 
		 IN5 => Port_Reg_data_SIG,
		 SEL_8x6x8 => RF_s_SIG,
		 OUT_8x6x8 => W_data_SIG

);

REG_A: eight_bit_register port map(

		 De => Out_ula_SIG,
		 CLKe => CLK_pr, 
		 Se => '1', 
		 RSe => '1', 
		 ENe => ld_A,
		 Qe => A_p
);

REG_B: eight_bit_register port map(

		 De => Out_ula_SIG,
		 CLKe => CLK_pr, 
		 Se => '1', 
		 RSe => '1', 
		 ENe => ld_B,
		 Qe => B_p
);

REG_C: eight_bit_register port map(

		 De => Out_ula_SIG,
		 CLKe => CLK_pr, 
		 Se => '1', 
		 RSe => '1', 
		 ENe => ld_C,
		 Qe => C_p
);

IR: IR_register port map(

		 De => IMEM_data_SIG, 
		 CLKe => CLK_pr, 
		 Se => '1', 
		 RSe => '1', 
		 ENe => IR_ld_SIG,
		 Qe => IR_SIG
);

PC: contadorPC port map(

		 cont_func => cont_func_SIG,
       PC_ld_cont => PC_ld_SIG,
       PC_inc_cont => PC_inc_SIG,
		 PC_clr_cont => PC_clr_SIG,
		 CLK_PC => CLK_pr,
       pc_out => IMEM_addr_SIG
);

PILHA_JUMP: Pilha_LIFO port map(

		 PUSH_p => ld_push_RET_SIG, 
		 POP_p => ld_pop_RET_SIG, 
		 CLK_p => CLK_pr,
		 Data_in_p => IMEM_addr_SIG,
		 Data_out_p => LIFO_out_RET_SIG
);

ADD_JUMP: somador8bits port map(

		 A => IMEM_addr_SIG,
       B => JUMP_inc_SIG,
       Ci => '0',
       S_MSB => ADD_JUMP_Out
);

SUB_JUMP: subtrator8bits port map(

		 A_sub => ADD_JUMP_Out,
       B_sub => "00000001",
       En_sub => '1',
       S_sub => FULL_JUMP_Out
);

MUX_JUMP: mux8x3x8 port map(

		 IN0 => CALL_addr_SIG, 
		 IN1 => LIFO_out_RET_SIG, 
		 IN2 => FULL_JUMP_Out, 
		 SEL_8x3x8 => selec_PC_SIG,
		 OUT_8x3x8 => cont_func_SIG

);

INST_MEM: I_MEM port map(

		address => IMEM_addr_SIG,
		clock => CLK_pr,
		q => IMEM_data_SIG
);

DATA_MEMO: DATA_MEM port map(

		address => MEM_addr_SIG,
		clock => CLK_pr,
		data => Rp_data_SIG,
		wren => MEM_rd_SIG,
		q => MEM_data_SIG
);


end Processor_arc;