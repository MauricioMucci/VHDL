library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity contador_comportamental_sincrono is
	port(
			CLK, CLEAR	: in std_logic;
			Q				: out std_logic_vector(3 downto 0)
	);
end contador_comportamental_sincrono;

architecture archi_contador of contador_comportamental_sincrono is
begin
	process(CLK, CLEAR)
	variable counter: std_logic_vector(3 downto 0);
	begin
		if CLEAR = '1' then 
			counter := "0000";
		else 
			if CLK'EVENT and CLK = '1' then
				counter := counter + 1;
			else
				counter := counter;
			end if;
		end if;
		Q <= counter;
	end process;
end archi_contador;