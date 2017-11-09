------------------------------------------------------------------------------
--  File: mux-home.vhd
------------------------------------------------------------------------------
--5 bit 4:1 Multiplexer
--Control signal vector is C_IN;
--The output is chosen from four 5 bit signals
--If control is '00' then input V is chosen. 
--If control is '01' then input X is chosen. 
--If control is '10' then input Y is chosen. 
--If control is '11' then input Z is chosen. 


--Multiplexer entity
library IEEE;
use IEEE.std_logic_1164.all;
entity Mux is
	port(
		V_IN, X_IN, Y_IN, Z_IN				:	in std_logic_vector(4 downto 0);
		C_IN								:	in std_logic_vector(1 downto 0);
		O_OUT_BEH, O_OUT_FLOW,O_OUT_STRUCT	:	out std_logic_vector(4 downto 0));			
end Mux;


--Two to one vector Mux entity
library IEEE;
use IEEE.std_logic_1164.all;
entity ttoMux is
	port(
		XT_IN,YT_IN	:	in std_logic_vector(4 downto 0);
		CT_IN		:	in std_logic;
		ZT_OUT		:	out std_logic_vector(4 downto 0));
end ttoMux;


--Two to one vector mux architecture
architecture TTOMUX of ttoMux is
begin
TTOMUX: process(XT_IN, YT_IN, CT_IN)
begin
	if CT_IN='0' then
		ZT_OUT <= XT_IN;
	elsif CT_IN='1' then
		ZT_OUT <= YT_IN;
	end if;
	
end process TTOMUX;
end TTOMUX;



--Architecture of the multiplexer
architecture RTL of Mux is
--TTO Mux component
component ttoMux is
	port(
		XT_IN,YT_IN	:	in std_logic_vector(4 downto 0);
		CT_IN		:	in std_logic;
		ZT_OUT		:	out std_logic_vector(4 downto 0));
end component;
--Signals for TTO Mux outputs
signal m1z, m2z		:	std_logic_vector(4 downto 0);

begin

--Structural Description
TtoOne:		ttoMux port map (V_IN, X_IN,C_IN(0),m1z);
TtoTwo:		ttoMux port map (Y_IN, Z_IN,C_IN(0),m2z);
TtoThree:	ttoMux port map (m1z, m2z, C_IN(1),O_OUT_STRUCT);



MUX: process ( V_IN, X_IN, Y_IN, Z_IN, C_IN)
begin
--Behavioral Description
	if C_IN="00" then
		O_OUT_BEH <= V_IN;
	elsif C_IN="01" then
		O_OUT_BEH <= X_IN;
	elsif C_IN="10" then
		O_OUT_BEH <= Y_IN;
	elsif C_IN="11" then
		O_OUT_BEH <= Z_IN;
	else
		O_OUT_BEH <="00000";
	end if;
--Dataflow Description
for I in 0 to 4 loop
	O_OUT_FLOW(I) <= (V_IN(I) and not(C_IN(1))and not(C_IN(0)))or(X_IN(I) and not(C_IN(1))and C_IN(0))or(Y_IN(I) and C_IN(1) and not(C_IN(0)))or(Z_IN(I) and C_IN(1) and C_IN(0));
end loop;


--Structural description TODO

--O_OUT_STRUCT<="00000";

end process MUX;
end RTL;




