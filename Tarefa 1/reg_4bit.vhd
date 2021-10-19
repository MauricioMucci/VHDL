library IEEE;
use IEEE.std_logic_1164.all;

entity reg_4bit is
	port (
		D				: std_logic_vector(3 downto 0);
		L, CLK, C	: in std_logic;
		QR				: out std_logic_vector(3 downto 0)
	);
end reg_4bit;

architecture archi_reg of reg_4bit is
	
	component reg_1bit is
		port (
		dado, load, clock, clear	: in std_logic;
		q									: out std_logic
	);
	end component;
	
begin
	Reg3: reg_1bit 
			port map (dado => D(3), load => L , clock => CLK, clear => C, q => QR(3));
	Reg2: reg_1bit 
			port map (dado => D(2), load => L , clock => CLK, clear => C, q => QR(2));
	Reg1: reg_1bit 
			port map (dado => D(1), load => L , clock => CLK, clear => C, q => QR(1));
	Reg0: reg_1bit 
			port map (dado => D(0), load => L , clock => CLK, clear => C, q => QR(0));					
end archi_reg;		