------------------------------------------------------------------------------
--  File: alu.vhd
------------------------------------------------------------------------------
--4 bit 4 Funtion ALU
--Control signal vector is C_IN;
--Two 4 bit inputs A and B.


--4:1 4-bit MUX Entity and architecture
library IEEE;
use IEEE.std_logic_1164.all;
entity Mux is
	port(
		F1_IN,F2_IN,F3_IN,F4_IN	:	in std_logic_vector(3 downto 0);
		C_IN					:	in std_logic_vector(1 downto 0);
		O_OUT					:	out std_logic_vector(3 downto 0));
end Mux;

architecture MUX of Mux is
begin
MUX: process(F1_IN,F2_IN,F3_IN,F4_IN, C_IN)
begin
	if C_IN="00" then
		O_OUT<= F1_IN;
	elsif C_IN="01" then
		O_OUT<= F2_IN;
	elsif C_IN="10" then
		O_OUT<= F3_IN;
	elsif C_IN="11" then
		O_OUT<= F4_IN;
	end if;
	
end process MUX;
end MUX;



--Function 1 Entity and architecture  Count 1  out <= std_logic_vector(to_unsigned(to_integer(unsigned( in )) + 1, 8));
library IEEE;
use IEEE.std_logic_1164.all;
entity Function1 is
	port(
		A_IN, B_IN	:	in std_logic_vector(3 downto 0);
		O_OUT		:	out std_logic_vector(3 downto 0));
end Function1;

architecture FUNCTION1 of Function1 is
begin

FUNCTION1: process(A_IN, B_IN)
begin
	--TODO
	O_OUT<="0000";
end process FUNCTION1;
end FUNCTION1;




--Function 2 Entity and architecture Ringnihe paremale
library IEEE;
use IEEE.std_logic_1164.all;
entity Function2 is
	port(
		A_IN, B_IN	:	in std_logic_vector(3 downto 0);
		O_OUT		:	out std_logic_vector(3 downto 0));
end Function2;

architecture FUNCTION2 of Function2 is
begin
FUNCTION2: process(A_IN, B_IN)
begin
	--TODO
	O_OUT<="0000";
end process FUNCTION2;
end FUNCTION2;



--Function 3 Entity and architecture Set a, b
library IEEE;
use IEEE.std_logic_1164.all;
entity Function3 is
	port(
		A_IN, B_IN	:	in std_logic_vector(3 downto 0);
		O_OUT		:	out std_logic_vector(3 downto 0));
end Function3;

architecture FUNCTION3 of Function3 is
begin
FUNCTION3: process(A_IN, B_IN)
begin
	--TODO
	O_OUT<="0000";
end process FUNCTION3;
end FUNCTION3;



--Function 4 Entity and architecture Kodune t��
library IEEE;
use IEEE.std_logic_1164.all;
entity Function4 is
	port(
		A_IN, B_IN	:	in std_logic_vector(3 downto 0);
		O_OUT		:	out std_logic_vector(3 downto 0));
end Function4;

architecture FUNCTION4 of Function4 is
begin
FUNCTION4: process(A_IN, B_IN)
begin
	--TODO
	O_OUT<="0000";
end process FUNCTION4;
end FUNCTION4;




--ALU Entity and architecture
library IEEE;
use IEEE.std_logic_1164.all;
entity Alu is
	port(
		A_IN, B_IN			:	in std_logic_vector(3 downto 0);
		C_IN				:	in std_logic_vector(1 downto 0);
		O_OUT				:	out std_logic_vector(3 downto 0));
end Alu;

architecture ALU of Alu is
--Function 1 Component
component Function1 is
	port(
		A_IN, B_IN	:	in std_logic_vector(3 downto 0);
		O_OUT		:	out std_logic_vector(3 downto 0));
end component;
--Function 2 Component
component Function2 is
	port(
		A_IN, B_IN	:	in std_logic_vector(3 downto 0);
		O_OUT		:	out std_logic_vector(3 downto 0));
end component;
--Function 3 Component
component Function3 is
	port(
		A_IN, B_IN	:	in std_logic_vector(3 downto 0);
		O_OUT		:	out std_logic_vector(3 downto 0));
end component;
--Function 4 Component
component Function4 is
	port(
		A_IN, B_IN	:	in std_logic_vector(3 downto 0);
		O_OUT		:	out std_logic_vector(3 downto 0));
end component;
--Mux component
component Mux is
	port(
		F1_IN,F2_IN,F3_IN,F4_IN	:	in std_logic_vector(3 downto 0);
		C_IN					:	in std_logic_vector(1 downto 0);
		O_OUT					:	out std_logic_vector(3 downto 0));
end component;

signal f1,f2,f3,f4	:	std_logic_vector(3 downto 0);

begin
--Structural description of ALU
F1	:	Function1 port map (A_IN, B_IN, f1);
F2	:	Function1 port map (A_IN, B_IN, f2);
F3	:	Function1 port map (A_IN, B_IN, f3);
F4	:	Function1 port map (A_IN, B_IN, f4);
MUX	:	Mux port map(f1, f2, f3 ,f4, C_IN, O_OUT);

end ALU;


