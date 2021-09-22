library ieee;
use ieee.std_logic_1164.all;

entity multiplicador is 
  port (A_M: in std_logic_vector(7 downto 0); 
        B_M: in std_logic_vector(7 downto 0);
        S_M: out std_logic_vector(15 downto 0));
        
end multiplicador;

  architecture funcionamento of multiplicador is 
    
      component somador16std_logics is 
        port(A:  in std_logic_vector(15 downto 0);
       B:  in std_logic_vector(15 downto 0 );
       Ci: in std_logic;
       Co: out std_logic;
       S:  out std_logic_vector(15 downto 0));
       
      end component;
    
    
     signal mul0, mul1,mul2, mul3,mul4,mul5,mul6, mul7: std_logic_vector(15 downto 0);
     signal sum0, sum1 ,sum2, sum3 , sum4, sum5 : std_logic_vector(15 downto 0);
      begin
      
      mul0(15 downto 8)<="00000000";
      mul0(7)<=B_M(0) and A_M(7);
      mul0(6)<=B_M(0) and A_M(6);
      mul0(5)<=B_M(0) and A_M(5);
      mul0(4)<=B_M(0) and A_M(4);
      mul0(3)<=B_M(0) and A_M(3);
      mul0(2)<=B_M(0) and A_M(2);
      mul0(1)<=B_M(0) and A_M(1);
      mul0(0)<=B_M(0) and A_M(0);
      
---------------------------------------
      mul1(15 downto 9)<="0000000";
      mul1(8)<=B_M(1) and A_M(7);
      mul1(7)<=B_M(1) and A_M(6);
      mul1(6)<=B_M(1) and A_M(5);
      mul1(5)<=B_M(1) and A_M(4);
      mul1(4)<=B_M(1) and A_M(3);
      mul1(3)<=B_M(1) and A_M(2);
      mul1(2)<=B_M(1) and A_M(1);
      mul1(1)<=B_M(1) and A_M(0);
      mul1(0)<='0';
    
---------------------------------------

      mul2(15 downto 10)<="000000";
      mul2(9)<=B_M(2) and A_M(7);
      mul2(8)<=B_M(2) and A_M(6);
      mul2(7)<=B_M(2) and A_M(5);
      mul2(6)<=B_M(2) and A_M(4);
      mul2(5)<=B_M(2) and A_M(3);
      mul2(4)<=B_M(2) and A_M(2);
      mul2(3)<=B_M(2) and A_M(1);
      mul2(2)<=B_M(2) and A_M(0);
      mul2(1 downto 0)<="00";
      
---------------------------------------
      
      mul3(15 downto 11)<="00000";
      mul3(10)<=B_M(3) and A_M(7);
      mul3(9)<=B_M(3) and A_M(6);
      mul3(8)<=B_M(3) and A_M(5);
      mul3(7)<=B_M(3) and A_M(4);
      mul3(6)<=B_M(3) and A_M(3);
      mul3(5)<=B_M(3) and A_M(2);
      mul3(4)<=B_M(3) and A_M(1);
      mul3(3)<=B_M(3) and A_M(0);
      mul3(2 downto 0)<="000";
  -----------------------------------------    
      mul4(15 downto 12)<="0000";
      mul4(11)<=B_M(4) and A_M(7);
      mul4(10)<=B_M(4) and A_M(6);
      mul4(9)<=B_M(4) and A_M(5);
      mul4(8)<=B_M(4) and A_M(4);
      mul4(7)<=B_M(4) and A_M(3);
      mul4(6)<=B_M(4) and A_M(2);
      mul4(5)<=B_M(4) and A_M(1);
      mul4(4)<=B_M(4) and A_M(0);
      mul4(3 downto 0)<="0000";
 -------------------------------------------             
      mul5(15 downto 13)<="000";
      mul5(12)<=B_M(5) and A_M(7);
      mul5(11)<=B_M(5) and A_M(6);
      mul5(10)<=B_M(5) and A_M(5);
      mul5(9)<=B_M(5) and A_M(4);
      mul5(8)<=B_M(5) and A_M(3);
      mul5(7)<=B_M(5) and A_M(2);
      mul5(6)<=B_M(5) and A_M(1);
      mul5(5)<=B_M(5) and A_M(0);
      mul5(4 downto 0)<="00000";
 -----------------------------------------     
      mul6(15 downto 14)<="00";
      mul6(13)<=B_M(6) and A_M(7);
      mul6(12)<=B_M(6) and A_M(6);
      mul6(11)<=B_M(6) and A_M(5);
      mul6(10)<=B_M(6) and A_M(4);
      mul6(9)<=B_M(6) and A_M(3);
      mul6(8)<=B_M(6) and A_M(2);
      mul6(7)<=B_M(6) and A_M(1);
      mul6(6)<=B_M(6) and A_M(0);
      mul6(5 downto 0)<="000000";
  ---------------------------------------    
      mul7(15)<='0';
      mul7(14)<=B_M(7) and A_M(7);
      mul7(13)<=B_M(7) and A_M(6);
      mul7(12)<=B_M(7) and A_M(5);
      mul7(11)<=B_M(7) and A_M(4);
      mul7(10)<=B_M(7) and A_M(3);
      mul7(9)<=B_M(7) and A_M(2);
      mul7(8)<=B_M(7) and A_M(1);
      mul7(7)<=B_M(7) and A_M(0);
      mul7(6 downto 0)<="0000000";
      
      
      SOMADOR0: somador16std_logics port map(
        
        A => mul0,
        B => mul1,
        Ci => '0',
        S => sum0);
        
        
      SOMADOR1: somador16std_logics port map(
        
        A => sum0,
        B => mul2,
        Ci => '0',
        S => sum1);
        
        
      SOMADOR2: somador16std_logics port map(
        
        A => sum1,
        B => mul3,
        Ci => '0',
        S => sum2);
        
        
      SOMADOR3: somador16std_logics port map(
        
        A => sum2,
        B => mul4,
        Ci => '0',
        S => sum3);
        
        
      SOMADOR4: somador16std_logics port map(
        
        A => sum3,
        B => mul5,
        Ci => '0',
        S => sum4);
        
        
      SOMADOR5: somador16std_logics port map(
        
        A => sum4,
        B => mul6,
        Ci => '0',
        S => sum5);
        
        
      SOMADOR6: somador16std_logics port map(
        
        A => sum5,
        B => mul7,
        Ci => '0',
        S => S_M);
        
      
           
    
    
  end funcionamento;
              
              