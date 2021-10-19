library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity contador_comportamental_load is
	port(
			CLK, CLEAR, LOAD	: in std_logic;
			D						: in std_logic_vector(3 downto 0);
			Q						: out std_logic_vector(3 downto 0)
	);
end contador_comportamental_load;

architecture archi_contador of contador_comportamental_load is
begin
	process(CLK, CLEAR)
	variable counter: std_logic_vector(3 downto 0);
	begin
		if CLEAR = '1' then 
			counter := "0000";
		else 
			if CLK'EVENT and CLK = '1' then
				if load = '1' then
					counter := D;
				else
					counter := counter + 1;
				end if;
			else
				counter := counter;
			end if;
		end if;
		Q <= counter;
	end process;
end archi_contador;