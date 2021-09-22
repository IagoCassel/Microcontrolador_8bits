library ieee;
use ieee.std_logic_1164.all;

entity Control is

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

end Control;

architecture Control_arc of Control is

type state_c is (START_c, SEARCH_c, DECODE_c, HLT_c, MOVC1_c, MOVC2_c, MOVA_c,
ADD_c, SUB_c, CMP_c, MUL_c, INC_c, DEC_c, AND_c, OR_c, XOR_c, NOT_c, SHL_c, SHR_c, JMP_c,
PUSH_c, POP_c, CALL_c, RET_c, MOVCN_c, JMPEQ1_c, JMPLO1_c, JMPHI1_c, JMPEQ2_c, JMPLO2_c, JMPHI2_c, 
IN_p, OUT_p);
signal STATE: state_c;
signal IN_sec_sig: std_logic_vector(2 downto 0);

begin

controller_proc: process (CLKc, RESETc)
begin

	if RESETc = '1' then

		STATE <= START_c;
	
	elsif ((CLKc'event) and (CLKc = '1')) then

		case STATE is
	
			when START_c =>
				STATE <= SEARCH_c;
		
			when SEARCH_c =>
				STATE <= DECODE_c;

			when DECODE_c =>
				if     ((IR(16) = '0') and (IR(15) = '0') and (IR(14) = '0') and (IR(13) ='0') and (IR(12) = '0')) then STATE <= HLT_c;
				elsif ((IR(16) = '0') and (IR(15) = '0') and (IR(14) = '0') and (IR(13) ='0') and (IR(12) = '1')) then STATE <= MOVC1_c;
				elsif ((IR(16) = '0') and (IR(15) = '0') and (IR(14) = '0') and (IR(13) ='1') and (IR(12) = '0')) then STATE <= MOVA_c;
				elsif ((IR(16) = '0') and (IR(15) = '0') and (IR(14) = '0') and (IR(13) ='1') and (IR(12) = '1')) then STATE <= ADD_c;
				elsif ((IR(16) = '0') and (IR(15) = '0') and (IR(14) = '1') and (IR(13) ='0') and (IR(12) = '0')) then STATE <= SUB_c;
				elsif ((IR(16) = '0') and (IR(15) = '0') and (IR(14) = '1') and (IR(13) ='0') and (IR(12) = '1')) then STATE <= CMP_c;
				elsif ((IR(16) = '0') and (IR(15) = '0') and (IR(14) = '1') and (IR(13) ='1') and (IR(12) = '0')) then STATE <= MUL_c;
				elsif ((IR(16) = '0') and (IR(15) = '0') and (IR(14) = '1') and (IR(13) ='1') and (IR(12) = '1')) then STATE <= INC_c;
				elsif ((IR(16) = '0') and (IR(15) = '1') and (IR(14) = '0') and (IR(13) ='0') and (IR(12) = '0')) then STATE <= DEC_c;
		      elsif ((IR(16) = '0') and (IR(15) = '1') and (IR(14) = '0') and (IR(13) ='0') and (IR(12) = '1')) then STATE <= AND_c;
		      elsif ((IR(16) = '0') and (IR(15) = '1') and (IR(14) = '0') and (IR(13) ='1') and (IR(12) = '0')) then STATE <= OR_c;
		      elsif ((IR(16) = '0') and (IR(15) = '1') and (IR(14) = '0') and (IR(13) ='1') and (IR(12) = '1')) then STATE <= XOR_c;
		      elsif ((IR(16) = '0') and (IR(15) = '1') and (IR(14) = '1') and (IR(13) ='0') and (IR(12) = '0')) then STATE <= NOT_c;
		      elsif ((IR(16) = '0') and (IR(15) = '1') and (IR(14) = '1') and (IR(13) ='0') and (IR(12) = '1')) then STATE <= SHL_c;
		      elsif ((IR(16) = '0') and (IR(15) = '1') and (IR(14) = '1') and (IR(13) ='1') and (IR(12) = '0')) then STATE <= SHR_c;
		      elsif ((IR(16) = '0') and (IR(15) = '1') and (IR(14) = '1') and (IR(13) ='1') and (IR(12) = '1')) then STATE <= JMP_c;
				elsif ((IR(16) = '1') and (IR(15) = '0') and (IR(14) = '0') and (IR(13) ='0') and (IR(12) = '0')) then STATE <= PUSH_c;
				elsif ((IR(16) = '1') and (IR(15) = '0') and (IR(14) = '0') and (IR(13) ='0') and (IR(12) = '1')) then STATE <= POP_c;
				elsif ((IR(16) = '1') and (IR(15) = '0') and (IR(14) = '0') and (IR(13) ='1') and (IR(12) = '0')) then STATE <= CALL_c;
				elsif ((IR(16) = '1') and (IR(15) = '0') and (IR(14) = '0') and (IR(13) ='1') and (IR(12) = '1')) then STATE <= RET_c;
				elsif ((IR(16) = '1') and (IR(15) = '0') and (IR(14) = '1') and (IR(13) ='0') and (IR(12) = '0')) then STATE <= MOVCN_c;
				elsif ((IR(16) = '1') and (IR(15) = '0') and (IR(14) = '1') and (IR(13) ='0') and (IR(12) = '1')) then STATE <= JMPEQ1_c;
				elsif ((IR(16) = '1') and (IR(15) = '0') and (IR(14) = '1') and (IR(13) ='1') and (IR(12) = '0')) then STATE <= JMPLO1_c;
				elsif ((IR(16) = '1') and (IR(15) = '0') and (IR(14) = '1') and (IR(13) ='1') and (IR(12) = '1')) then STATE <= JMPHI1_c;
				elsif ((IR(16) = '1') and (IR(15) = '1') and (IR(14) = '0') and (IR(13) ='0') and (IR(12) = '0')) then STATE <= IN_p;
		      elsif ((IR(16) = '1') and (IR(15) = '1') and (IR(14) = '0') and (IR(13) ='0') and (IR(12) = '1')) then STATE <= OUT_p;
				else                                                                                                  STATE <= DECODE_c;
				end if;

			when HLT_c =>
				STATE <= HLT_c;
		
			when MOVC1_c =>
				STATE <= MOVC2_c;

			when MOVC2_c =>
				STATE <= SEARCH_c;

			when MOVA_c =>
				STATE <= SEARCH_c;

			when ADD_c =>
				STATE <= SEARCH_c;

			when SUB_c =>
				STATE <= SEARCH_c;

			when CMP_c =>
				STATE <= SEARCH_c;

			when MUL_c =>
				STATE <= SEARCH_c;

			when INC_c =>
				STATE <= SEARCH_c;

			when DEC_c =>
				STATE <= SEARCH_c;

			when AND_c =>
				STATE <= SEARCH_c;

			when OR_c =>
				STATE <= SEARCH_c;

			when XOR_c =>
				STATE <= SEARCH_c;

			when NOT_c =>
				STATE <= SEARCH_c;

			when SHL_c =>
				STATE <= SEARCH_c;

			when SHR_c =>
				STATE <= SEARCH_c;

			when JMP_c =>
				STATE <= SEARCH_c;

			when PUSH_c =>
				STATE <= SEARCH_c;

			when POP_c =>
				STATE <= SEARCH_c;

			when CALL_c =>
				STATE <= SEARCH_c;

			when RET_c =>
				STATE <= SEARCH_c;

			when MOVCN_c =>
				STATE <= SEARCH_c;

			when JMPEQ1_c =>
				if (JMP_eq = '1') then STATE <= JMPEQ2_c;
				else STATE <= SEARCH_c;
				end if;

			when JMPLO1_c =>
				if (JMP_lo = '1') then STATE <= JMPLO2_c;
				else STATE <= SEARCH_c;
				end if;

			when JMPHI1_c =>
				if (JMP_hi = '1') then STATE <= JMPHI2_c;
				else STATE <= SEARCH_c;
				end if;
				
			when JMPEQ2_c =>
				STATE <= SEARCH_c;

			when JMPLO2_c =>
				STATE <= SEARCH_c;

			when JMPHI2_c =>
				STATE <= SEARCH_c;
		
			when IN_p =>
				STATE <= SEARCH_c;

			when OUT_p =>
				STATE <= SEARCH_c;
				
		end case;
	end if;
end process;

with STATE select
	                 IR_ld <= '0' when START_c,
				  '1' when SEARCH_c,
				  '0' when DECODE_c,
				  '0' when HLT_c,
				  '0' when MOVC1_c,
				  '0' when MOVC2_c,
				  '0' when MOVA_c,
				  '0' when ADD_c,
				  '0' when SUB_c,
				  '0' when CMP_c,
				  '0' when MUL_c,
				  '0' when INC_c,
				  '0' when DEC_c,
				  '0' when AND_c,
				  '0' when OR_c,
				  '0' when XOR_c,
				  '0' when NOT_c,
				  '0' when SHL_c,
				  '0' when SHR_c,
				  '0' when JMP_c,
				  '0' when PUSH_c,
				  '0' when POP_c,
				  '0' when CALL_c,
				  '0' when RET_c,
				  '0' when MOVCN_c,
				  '0' when JMPEQ1_c,
				  '0' when JMPLO1_c,
				  '0' when JMPHI1_c,
				  '0' when JMPEQ2_c,
				  '0' when JMPLO2_c,
				  '0' when JMPHI2_c,
				  '0' when IN_p,
				  '0' when OUT_p;
	
with STATE select
	                  I_rd <= '0' when START_c,
				  '1' when SEARCH_c,
				  '0' when DECODE_c,
				  '0' when HLT_c,
				  '0' when MOVC1_c,
				  '0' when MOVC2_c,
				  '0' when MOVA_c,
				  '0' when ADD_c,
				  '0' when SUB_c,
				  '0' when CMP_c,
				  '0' when MUL_c,
				  '0' when INC_c,
				  '0' when DEC_c,
				  '0' when AND_c,
				  '0' when OR_c,
				  '0' when XOR_c,
				  '0' when NOT_c,
				  '0' when SHL_c,
				  '0' when SHR_c,
				  '0' when JMP_c,
				  '0' when PUSH_c,
				  '0' when POP_c,
				  '0' when CALL_c,
				  '0' when RET_c,
				  '0' when MOVCN_c,
				  '0' when JMPEQ1_c,
				  '0' when JMPLO1_c,
				  '0' when JMPHI1_c,
				  '0' when JMPEQ2_c,
				  '0' when JMPLO2_c,
				  '0' when JMPHI2_c,
				  '0' when IN_p,
				  '0' when OUT_p;

with STATE select
	                PC_inc <= '0' when START_c,
				  '1' when SEARCH_c,
				  '0' when DECODE_c,
				  '0' when HLT_c,
				  '0' when MOVC1_c,
				  '0' when MOVC2_c,
				  '0' when MOVA_c,
				  '0' when ADD_c,
				  '0' when SUB_c,
				  '0' when CMP_c,
				  '0' when MUL_c,
				  '0' when INC_c,
				  '0' when DEC_c,
				  '0' when AND_c,
				  '0' when OR_c,
				  '0' when XOR_c,
				  '0' when NOT_c,
				  '0' when SHL_c,
				  '0' when SHR_c,
				  '0' when JMP_c,
				  '0' when PUSH_c,
				  '0' when POP_c,
				  '0' when CALL_c,
				  '0' when RET_c,
				  '0' when MOVCN_c,
				  '0' when JMPEQ1_c,
				  '0' when JMPLO1_c,
				  '0' when JMPHI1_c,
				  '0' when JMPEQ2_c,
				  '0' when JMPLO2_c,
				  '0' when JMPHI2_c,
				  '0' when IN_p,
				  '0' when OUT_p;

with STATE select
	                PC_clr <= '0' when START_c,
				  '1' when SEARCH_c,
				  '1' when DECODE_c,
				  '1' when HLT_c,
				  '1' when MOVC1_c,
				  '1' when MOVC2_c,
				  '1' when MOVA_c,
				  '1' when ADD_c,
				  '1' when SUB_c,
				  '1' when CMP_c,
				  '1' when MUL_c,
				  '1' when INC_c,
				  '1' when DEC_c,
				  '1' when AND_c,
				  '1' when OR_c,
				  '1' when XOR_c,
				  '1' when NOT_c,
				  '1' when SHL_c,
				  '1' when SHR_c,
				  '1' when JMP_c,
				  '1' when PUSH_c,
				  '1' when POP_c,
				  '1' when CALL_c,
				  '1' when RET_c,
				  '1' when MOVCN_c,
				  '1' when JMPEQ1_c,
				  '1' when JMPLO1_c,
				  '1' when JMPHI1_c,
				  '1' when JMPEQ2_c,
				  '1' when JMPLO2_c,
				  '1' when JMPHI2_c,
				  '1' when IN_p,
				  '1' when OUT_p;

with STATE select
	                 PC_ld <= '0' when START_c,
				  '0' when SEARCH_c,
				  '0' when DECODE_c,
				  '0' when HLT_c,
				  '0' when MOVC1_c,
				  '0' when MOVC2_c,
				  '0' when MOVA_c,
				  '0' when ADD_c,
				  '0' when SUB_c,
				  '0' when CMP_c,
				  '0' when MUL_c,
				  '0' when INC_c,
				  '0' when DEC_c,
				  '0' when AND_c,
				  '0' when OR_c,
				  '0' when XOR_c,
				  '0' when NOT_c,
				  '0' when SHL_c,
				  '0' when SHR_c,
				  '1' when JMP_c,
				  '0' when PUSH_c,
				  '0' when POP_c,
				  '1' when CALL_c,
				  '1' when RET_c,
				  '0' when MOVCN_c,
				  '0' when JMPEQ1_c,
				  '0' when JMPLO1_c,
				  '0' when JMPHI1_c,
				  '1' when JMPEQ2_c,
				  '1' when JMPLO2_c,
				  '1' when JMPHI2_c,
				  '0' when IN_p,
				  '0' when OUT_p;

with STATE select
	           ld_push_RET <= '0' when START_c,
				  '0' when SEARCH_c,
				  '0' when DECODE_c,
				  '0' when HLT_c,
				  '0' when MOVC1_c,
				  '0' when MOVC2_c,
				  '0' when MOVA_c,
				  '0' when ADD_c,
				  '0' when SUB_c,
				  '0' when CMP_c,
				  '0' when MUL_c,
				  '0' when INC_c,
				  '0' when DEC_c,
				  '0' when AND_c,
				  '0' when OR_c,
				  '0' when XOR_c,
				  '0' when NOT_c,
				  '0' when SHL_c,
				  '0' when SHR_c,
				  '0' when JMP_c,
				  '0' when PUSH_c,
				  '0' when POP_c,
				  '1' when CALL_c,
				  '0' when RET_c,
				  '0' when MOVCN_c,
				  '0' when JMPEQ1_c,
				  '0' when JMPLO1_c,
				  '0' when JMPHI1_c,
				  '0' when JMPEQ2_c,
				  '0' when JMPLO2_c,
				  '0' when JMPHI2_c,
				  '0' when IN_p,
				  '0' when OUT_p;

with STATE select
	            ld_pop_RET <= '0' when START_c,
				  '0' when SEARCH_c,
				  '0' when DECODE_c,
				  '0' when HLT_c,
				  '0' when MOVC1_c,
				  '0' when MOVC2_c,
				  '0' when MOVA_c,
				  '0' when ADD_c,
				  '0' when SUB_c,
				  '0' when CMP_c,
				  '0' when MUL_c,
				  '0' when INC_c,
				  '0' when DEC_c,
				  '0' when AND_c,
				  '0' when OR_c,
				  '0' when XOR_c,
				  '0' when NOT_c,
				  '0' when SHL_c,
				  '0' when SHR_c,
				  '0' when JMP_c,
				  '0' when PUSH_c,
				  '0' when POP_c,
				  '0' when CALL_c,
				  '1' when RET_c,
				  '0' when MOVCN_c,
				  '0' when JMPEQ1_c,
				  '0' when JMPLO1_c,
				  '0' when JMPHI1_c,
				  '0' when JMPEQ2_c,
				  '0' when JMPLO2_c,
				  '0' when JMPHI2_c,
				  '0' when IN_p,
				  '0' when OUT_p;

with STATE select
	               RF_W_wr <= '0' when START_c,
				  '0' when SEARCH_c,
				  '0' when DECODE_c,
				  '0' when HLT_c,
				  '0' when MOVC1_c,
				  '1' when MOVC2_c,
				  '0' when MOVA_c,
				  '1' when ADD_c,
				  '1' when SUB_c,
				  '1' when CMP_c,
				  '1' when MUL_c,
				  '1' when INC_c,
				  '1' when DEC_c,
				  '1' when AND_c,
				  '1' when OR_c,
				  '1' when XOR_c,
				  '1' when NOT_c,
				  '1' when SHL_c,
				  '1' when SHR_c,
				  '0' when JMP_c,
				  '0' when PUSH_c,
				  '1' when POP_c,
				  '0' when CALL_c,
				  '0' when RET_c,
				  '1' when MOVCN_c,
				  '0' when JMPEQ1_c,
				  '0' when JMPLO1_c,
				  '0' when JMPHI1_c,
				  '0' when JMPEQ2_c,
				  '0' when JMPLO2_c,
				  '0' when JMPHI2_c,
				  '1' when IN_p,
				  '0' when OUT_p;

with STATE select
	              RF_Rp_rd <= '0' when START_c,
				  '0' when SEARCH_c,
				  '0' when DECODE_c,
				  '0' when HLT_c,
				  '0' when MOVC1_c,
				  '0' when MOVC2_c,
				  '1' when MOVA_c,
				  '1' when ADD_c,
				  '1' when SUB_c,
				  '1' when CMP_c,
				  '1' when MUL_c,
				  '1' when INC_c,
				  '1' when DEC_c,
				  '1' when AND_c,
				  '1' when OR_c,
				  '1' when XOR_c,
				  '1' when NOT_c,
				  '1' when SHL_c,
				  '1' when SHR_c,
				  '0' when JMP_c,
				  '1' when PUSH_c,
				  '0' when POP_c,
				  '0' when CALL_c,
				  '0' when RET_c,
				  '0' when MOVCN_c,
				  '1' when JMPEQ1_c,
				  '1' when JMPLO1_c,
				  '1' when JMPHI1_c,
				  '0' when JMPEQ2_c,
				  '0' when JMPLO2_c,
				  '0' when JMPHI2_c,
				  '0' when IN_p,
				  '1' when OUT_p;

with STATE select
	              RF_Rq_rd <= '0' when START_c,
				  '0' when SEARCH_c,
				  '0' when DECODE_c,
				  '0' when HLT_c,
				  '0' when MOVC1_c,
				  '0' when MOVC2_c,
				  '0' when MOVA_c,
				  '1' when ADD_c,
				  '1' when SUB_c,
				  '1' when CMP_c,
				  '1' when MUL_c,
				  '0' when INC_c,
				  '0' when DEC_c,
				  '1' when AND_c,
				  '1' when OR_c,
				  '1' when XOR_c,
				  '0' when NOT_c,
				  '0' when SHL_c,
				  '0' when SHR_c,
				  '0' when JMP_c,
				  '0' when PUSH_c,
				  '0' when POP_c,
				  '0' when CALL_c,
				  '0' when RET_c,
				  '0' when MOVCN_c,
				  '1' when JMPEQ1_c,
				  '1' when JMPLO1_c,
				  '1' when JMPHI1_c,
				  '0' when JMPEQ2_c,
				  '0' when JMPLO2_c,
				  '0' when JMPHI2_c,
				  '0' when IN_p,
				  '0' when OUT_p;

with STATE select
	                MEM_rd <= '0' when START_c,
				  '0' when SEARCH_c,
				  '0' when DECODE_c,
				  '0' when HLT_c,
				  '1' when MOVC1_c,
				  '0' when MOVC2_c,
				  '0' when MOVA_c,
				  '0' when ADD_c,
				  '0' when SUB_c,
				  '0' when CMP_c,
				  '0' when MUL_c,
				  '0' when INC_c,
				  '0' when DEC_c,
				  '0' when AND_c,
				  '0' when OR_c,
				  '0' when XOR_c,
				  '0' when NOT_c,
				  '0' when SHL_c,
				  '0' when SHR_c,
				  '0' when JMP_c,
				  '0' when PUSH_c,
				  '0' when POP_c,
				  '0' when CALL_c,
				  '0' when RET_c,
				  '0' when MOVCN_c,
				  '0' when JMPEQ1_c,
				  '0' when JMPLO1_c,
				  '0' when JMPHI1_c,
				  '0' when JMPEQ2_c,
				  '0' when JMPLO2_c,
				  '0' when JMPHI2_c,
				  '0' when IN_p,
				  '0' when OUT_p;

with STATE select
	                MEM_wr <= '0' when START_c,
				  '0' when SEARCH_c,
				  '0' when DECODE_c,
				  '0' when HLT_c,
				  '0' when MOVC1_c,
				  '0' when MOVC2_c,
				  '1' when MOVA_c,
				  '0' when ADD_c,
				  '0' when SUB_c,
				  '0' when CMP_c,
				  '0' when MUL_c,
				  '0' when INC_c,
				  '0' when DEC_c,
				  '0' when AND_c,
				  '0' when OR_c,
				  '0' when XOR_c,
				  '0' when NOT_c,
				  '0' when SHL_c,
				  '0' when SHR_c,
				  '0' when JMP_c,
				  '0' when PUSH_c,
				  '0' when POP_c,
				  '0' when CALL_c,
				  '0' when RET_c,
				  '0' when MOVCN_c,
				  '0' when JMPEQ1_c,
				  '0' when JMPLO1_c,
				  '0' when JMPHI1_c,
				  '0' when JMPEQ2_c,
				  '0' when JMPLO2_c,
				  '0' when JMPHI2_c,
				  '0' when IN_p,
				  '0' when OUT_p;

with STATE select
	               ld_push <= '0' when START_c,
				  '0' when SEARCH_c,
				  '0' when DECODE_c,
				  '0' when HLT_c,
				  '0' when MOVC1_c,
				  '0' when MOVC2_c,
				  '0' when MOVA_c,
				  '0' when ADD_c,
				  '0' when SUB_c,
				  '0' when CMP_c,
				  '0' when MUL_c,
				  '0' when INC_c,
				  '0' when DEC_c,
				  '0' when AND_c,
				  '0' when OR_c,
				  '0' when XOR_c,
				  '0' when NOT_c,
				  '0' when SHL_c,
				  '0' when SHR_c,
				  '0' when JMP_c,
				  '1' when PUSH_c,
				  '0' when POP_c,
				  '0' when CALL_c,
				  '0' when RET_c,
				  '0' when MOVCN_c,
				  '0' when JMPEQ1_c,
				  '0' when JMPLO1_c,
				  '0' when JMPHI1_c,
				  '0' when JMPEQ2_c,
				  '0' when JMPLO2_c,
				  '0' when JMPHI2_c,
				  '0' when IN_p,
				  '0' when OUT_p;

with STATE select
	                ld_pop <= '0' when START_c,
				  '0' when SEARCH_c,
				  '0' when DECODE_c,
				  '0' when HLT_c,
				  '0' when MOVC1_c,
				  '0' when MOVC2_c,
				  '0' when MOVA_c,
				  '0' when ADD_c,
				  '0' when SUB_c,
				  '0' when CMP_c,
				  '0' when MUL_c,
				  '0' when INC_c,
				  '0' when DEC_c,
				  '0' when AND_c,
				  '0' when OR_c,
				  '0' when XOR_c,
				  '0' when NOT_c,
				  '0' when SHL_c,
				  '0' when SHR_c,
				  '0' when JMP_c,
				  '0' when PUSH_c,
				  '1' when POP_c,
				  '0' when CALL_c,
				  '0' when RET_c,
				  '0' when MOVCN_c,
				  '0' when JMPEQ1_c,
				  '0' when JMPLO1_c,
				  '0' when JMPHI1_c,
				  '0' when JMPEQ2_c,
				  '0' when JMPLO2_c,
				  '0' when JMPHI2_c,
				  '0' when IN_p,
				  '0' when OUT_p;

with STATE select
	              selec_PC <= "00" when START_c,
				  "00" when SEARCH_c,
				  "00" when DECODE_c,
				  "00" when HLT_c,
				  "00" when MOVC1_c,
				  "00" when MOVC2_c,
				  "00" when MOVA_c,
				  "00" when ADD_c,
				  "00" when SUB_c,
				  "00" when CMP_c,
				  "00" when MUL_c,
				  "00" when INC_c,
				  "00" when DEC_c,
				  "00" when AND_c,
				  "00" when OR_c,
				  "00" when XOR_c,
				  "00" when NOT_c,
				  "00" when SHL_c,
				  "00" when SHR_c,
				  "10" when JMP_c,
				  "00" when PUSH_c,
				  "00" when POP_c,
				  "00" when CALL_c,
				  "01" when RET_c,
				  "00" when MOVCN_c,
				  "00" when JMPEQ1_c,
				  "00" when JMPLO1_c,
				  "00" when JMPHI1_c,
				  "10" when JMPEQ2_c,
				  "10" when JMPLO2_c,
				  "10" when JMPHI2_c,
				  "00" when IN_p,
				  "00" when OUT_p;
						
with STATE select
	                   F_s <= "00" when START_c,
				  "00" when SEARCH_c,
				  "00" when DECODE_c,
				  "00" when HLT_c,
				  "00" when MOVC1_c,
				  "00" when MOVC2_c,
				  "00" when MOVA_c,
				  "00" when ADD_c,
				  "00" when SUB_c,
				  "00" when CMP_c,
				  "00" when MUL_c,
				  "00" when INC_c,
				  "00" when DEC_c,
				  "00" when AND_c,
				  "00" when OR_c,
				  "00" when XOR_c,
				  "00" when NOT_c,
				  "00" when SHL_c,
				  "00" when SHR_c,
				  "00" when JMP_c,
				  "00" when PUSH_c,
				  "00" when POP_c,
				  "00" when CALL_c,
				  "00" when RET_c,
				  "00" when MOVCN_c,
				  "00" when JMPEQ1_c,
				  "00" when JMPLO1_c,
				  "00" when JMPHI1_c,
				  "00" when JMPEQ2_c,
				  "00" when JMPLO2_c,
				  "00" when JMPHI2_c,
				  "00" when IN_p,
				  IR(1 downto 0) when OUT_p;

with STATE select
	                  RF_s <= "000" when START_c,
				  "000" when SEARCH_c,
				  "000" when DECODE_c,
				  "000" when HLT_c,
				  "000" when MOVC1_c,
				  "100" when MOVC2_c,
				  "000" when MOVA_c,
				  "011" when ADD_c,
				  "011" when SUB_c,
				  "011" when CMP_c,
				  "011" when MUL_c,
				  "011" when INC_c,
				  "011" when DEC_c,
				  "011" when AND_c,
				  "011" when OR_c,
				  "011" when XOR_c,
				  "011" when NOT_c,
				  "011" when SHL_c,
				  "011" when SHR_c,
				  "000" when JMP_c,
				  "000" when PUSH_c,
				  "010" when POP_c,
				  "000" when CALL_c,
				  "000" when RET_c,
				  "101" when MOVCN_c,
				  "000" when JMPEQ1_c,
				  "000" when JMPLO1_c,
				  "000" when JMPHI1_c,
				  "000" when JMPEQ2_c,
				  "000" when JMPLO2_c,
				  "000" when JMPHI2_c,
				  IN_sec_sig when IN_p,
				  "000" when OUT_p;

with STATE select
	                 alu_s <= "0000" when START_c,
				  "0000" when SEARCH_c,
				  "0000" when DECODE_c,
				  "0000" when HLT_c,
				  "0000" when MOVC1_c,
				  "0000" when MOVC2_c,
				  "0000" when MOVA_c,
				  "0000" when ADD_c,
				  "0001" when SUB_c,
				  "0010" when CMP_c,
				  "0011" when MUL_c,
				  "0100" when INC_c,
				  "0101" when DEC_c,
				  "0110" when AND_c,
				  "0111" when OR_c,
				  "1000" when XOR_c,
				  "1001" when NOT_c,
				  "1010" when SHL_c,
				  "1011" when SHR_c,
				  "0000" when JMP_c,
				  "0000" when PUSH_c,
				  "0000" when POP_c,
				  "0000" when CALL_c,
				  "0000" when RET_c,
				  "0000" when MOVCN_c,
				  "0000" when JMPEQ1_c,
				  "0000" when JMPLO1_c,
				  "0000" when JMPHI1_c,
				  "0000" when JMPEQ2_c,
				  "0000" when JMPLO2_c,
				  "0000" when JMPHI2_c,
				  "0000" when IN_p,
				  "0000" when OUT_p;

with STATE select
	             RF_W_addr <= "0000" when START_c,
				  "0000" when SEARCH_c,
				  "0000" when DECODE_c,
				  "0000" when HLT_c,
				  "0000" when MOVC1_c,
				  IR(11 downto 8) when MOVC2_c,
				  "0000" when MOVA_c,
				  IR(11 downto 8) when ADD_c,
				  IR(11 downto 8) when SUB_c,
				  IR(11 downto 8) when CMP_c,
				  IR(11 downto 8) when MUL_c,
				  IR(11 downto 8) when INC_c,
				  IR(11 downto 8) when DEC_c,
				  IR(11 downto 8) when AND_c,
				  IR(11 downto 8) when OR_c,
				  IR(11 downto 8) when XOR_c,
				  IR(11 downto 8) when NOT_c,
				  IR(11 downto 8) when SHL_c,
				  IR(11 downto 8) when SHR_c,
				  "0000" when JMP_c,
				  "0000" when PUSH_c,
				  IR(11 downto 8) when POP_c,
				  "0000" when CALL_c,
				  "0000" when RET_c,
				  IR(11 downto 8) when MOVCN_c,
				  "0000" when JMPEQ1_c,
				  "0000" when JMPLO1_c,
				  "0000" when JMPHI1_c,
				  "0000" when JMPEQ2_c,
				  "0000" when JMPLO2_c,
				  "0000" when JMPHI2_c,
				  IR(11 downto 8) when IN_p,
				  "0000" when OUT_p;

with STATE select
	            RF_Rp_addr <= "0000" when START_c,
				  "0000" when SEARCH_c,
				  "0000" when DECODE_c,
				  "0000" when HLT_c,
				  "0000" when MOVC1_c,
				  "0000" when MOVC2_c,
				  IR(11 downto 8) when MOVA_c,
				  IR(7 downto 4) when ADD_c,
				  IR(7 downto 4) when SUB_c,
				  IR(7 downto 4) when CMP_c,
				  IR(7 downto 4) when MUL_c,
				  IR(11 downto 8) when INC_c,
				  IR(11 downto 8) when DEC_c,
				  IR(7 downto 4) when AND_c,
				  IR(7 downto 4) when OR_c,
				  IR(7 downto 4) when XOR_c,
				  IR(7 downto 4) when NOT_c,
				  IR(11 downto 8) when SHL_c,
				  IR(11 downto 8) when SHR_c,
				  "0000" when JMP_c,
				  IR(11 downto 8) when PUSH_c,
				  "0000" when POP_c,
				  "0000" when CALL_c,
				  "0000" when RET_c,
				  "0000" when MOVCN_c,
				  IR(11 downto 8) when JMPEQ1_c,
				  IR(11 downto 8) when JMPLO1_c,
				  IR(11 downto 8) when JMPHI1_c,
				  "0000" when JMPEQ2_c,
				  "0000" when JMPLO2_c,
				  "0000" when JMPHI2_c,
				  IR(11 downto 8) when IN_p,
				  IR(11 downto 8) when OUT_p;

with STATE select
	            RF_Rq_addr <= "0000" when START_c,
				  "0000" when SEARCH_c,
				  "0000" when DECODE_c,
				  "0000" when HLT_c,
				  "0000" when MOVC1_c,
				  "0000" when MOVC2_c,
				  "0000" when MOVA_c,
				  IR(3 downto 0) when ADD_c,
				  IR(3 downto 0) when SUB_c,
				  IR(3 downto 0) when CMP_c,
				  IR(3 downto 0) when MUL_c,
				  "0000" when INC_c,
				  "0000" when DEC_c,
				  IR(3 downto 0) when AND_c,
				  IR(3 downto 0) when OR_c,
				  IR(3 downto 0) when XOR_c,
				  "0000" when NOT_c,
				  "0000" when SHL_c,
				  "0000" when SHR_c,
				  "0000" when JMP_c,
				  "0000" when PUSH_c,
				  "0000" when POP_c,
				  "0000" when CALL_c,
				  "0000" when RET_c,
				  "0000" when MOVCN_c,
				  "1111" when JMPEQ1_c,
				  "1111" when JMPLO1_c,
				  "1111" when JMPHI1_c,
				  "0000" when JMPEQ2_c,
				  "0000" when JMPLO2_c,
				  "0000" when JMPHI2_c,
				  "0000" when IN_p,
				  "0000" when OUT_p;


with STATE select
	              MEM_addr <= "00000000" when START_c,
				  "00000000" when SEARCH_c,
				  "00000000" when DECODE_c,
				  "00000000" when HLT_c,
				  IR(7 downto 0) when MOVC1_c,
				  "00000000" when MOVC2_c,
				  IR(7 downto 0) when MOVA_c,
				  "00000000" when ADD_c,
				  "00000000" when SUB_c,
				  "00000000" when CMP_c,
				  "00000000" when MUL_c,
				  "00000000" when INC_c,
				  "00000000" when DEC_c,
				  "00000000" when AND_c,
				  "00000000" when OR_c,
				  "00000000" when XOR_c,
				  "00000000" when NOT_c,
				  "00000000" when SHL_c,
				  "00000000" when SHR_c,
				  "00000000" when JMP_c,
				  "00000000" when PUSH_c,
				  "00000000" when POP_c,
				  "00000000" when CALL_c,
				  "00000000" when RET_c,
				  "00000000" when MOVCN_c,
				  "00000000" when JMPEQ1_c,
				  "00000000" when JMPLO1_c,
				  "00000000" when JMPHI1_c,
				  "00000000" when JMPEQ2_c,
				  "00000000" when JMPLO2_c,
				  "00000000" when JMPHI2_c,
				  "00000000" when IN_p,
				  "00000000" when OUT_p;
				  
with STATE select
	              CALL_addr <= "00000000" when START_c,
				  "00000000" when SEARCH_c,
				  "00000000" when DECODE_c,
				  "00000000" when HLT_c,
				  "00000000" when MOVC1_c,
				  "00000000" when MOVC2_c,
				  "00000000" when MOVA_c,
				  "00000000" when ADD_c,
				  "00000000" when SUB_c,
				  "00000000" when CMP_c,
				  "00000000" when MUL_c,
				  "00000000" when INC_c,
				  "00000000" when DEC_c,
				  "00000000" when AND_c,
				  "00000000" when OR_c,
				  "00000000" when XOR_c,
				  "00000000" when NOT_c,
				  "00000000" when SHL_c,
				  "00000000" when SHR_c,
				  "00000000" when JMP_c,
				  "00000000" when PUSH_c,
				  "00000000" when POP_c,
				  IR(7 downto 0) when CALL_c,
				  "00000000" when RET_c,
				  "00000000" when MOVCN_c,
				  "00000000" when JMPEQ1_c,
				  "00000000" when JMPLO1_c,
				  "00000000" when JMPHI1_c,
				  "00000000" when JMPEQ2_c,
				  "00000000" when JMPLO2_c,
				  "00000000" when JMPHI2_c,
				  "00000000" when IN_p,
				  "00000000" when OUT_p;
				  
with STATE select
	              Port_Reg_data <= "00000000" when START_c,
				  "00000000" when SEARCH_c,
				  "00000000" when DECODE_c,
				  "00000000" when HLT_c,
				  "00000000" when MOVC1_c,
				  "00000000" when MOVC2_c,
				  "00000000" when MOVA_c,
				  "00000000" when ADD_c,
				  "00000000" when SUB_c,
				  "00000000" when CMP_c,
				  "00000000" when MUL_c,
				  "00000000" when INC_c,
				  "00000000" when DEC_c,
				  "00000000" when AND_c,
				  "00000000" when OR_c,
				  "00000000" when XOR_c,
				  "00000000" when NOT_c,
				  "00000000" when SHL_c,
				  "00000000" when SHR_c,
				  "00000000" when JMP_c,
				  "00000000" when PUSH_c,
				  "00000000" when POP_c,
				  "00000000" when CALL_c,
				  "00000000" when RET_c,
				  IR(7 downto 0) when MOVCN_c,
				  "00000000" when JMPEQ1_c,
				  "00000000" when JMPLO1_c,
				  "00000000" when JMPHI1_c,
				  "00000000" when JMPEQ2_c,
				  "00000000" when JMPLO2_c,
				  "00000000" when JMPHI2_c,
				  "00000000" when IN_p,
				  "00000000" when OUT_p;

with STATE select
	              JUMP_inc <= "00000000" when START_c,
				  "00000000" when SEARCH_c,
				  "00000000" when DECODE_c,
				  "00000000" when HLT_c,
				  "00000000" when MOVC1_c,
				  "00000000" when MOVC2_c,
				  "00000000" when MOVA_c,
				  "00000000" when ADD_c,
				  "00000000" when SUB_c,
				  "00000000" when CMP_c,
				  "00000000" when MUL_c,
				  "00000000" when INC_c,
				  "00000000" when DEC_c,
				  "00000000" when AND_c,
				  "00000000" when OR_c,
				  "00000000" when XOR_c,
				  "00000000" when NOT_c,
				  "00000000" when SHL_c,
				  "00000000" when SHR_c,
				  "00000000" when JMP_c,
				  "00000000" when PUSH_c,
				  "00000000" when POP_c,
				  "00000000" when CALL_c,
				  "00000000" when RET_c,
				  "00000000" when MOVCN_c,
				  "00000000" when JMPEQ1_c,
				  "00000000" when JMPLO1_c,
				  "00000000" when JMPHI1_c,
				  IR(7 downto 0) when JMPEQ2_c,
				  IR(7 downto 0) when JMPLO2_c,
				  IR(7 downto 0) when JMPHI2_c,
				  "00000000" when IN_p,
				  "00000000" when OUT_p;

IN_sec_sig(2) <= '0';
IN_sec_sig(1) <= '0';
IN_sec_sig(0) <= IR(0);

end Control_arc;