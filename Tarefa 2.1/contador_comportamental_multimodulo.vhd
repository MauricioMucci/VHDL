library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity contador_comportamental_multimodulo is
	port(
			CLK, CLEAR	: in std_logic;
			ENABLER		: in std_logic_vector(1 downto 0);
			Q				: out std_logic_vector(3 downto 0)
	);
end contador_comportamental_multimodulo;

architecture archi_contador of contador_comportamental_multimodulo is
signal reset: std_logic_vector(3 downto 0);
begin
	with ENABLER select reset <= 	"1110" when "00",
											"1100" when "01",
											"1010" when "10",
											"0111" when "11";
	process(CLK, CLEAR)
	variable counter: std_logic_vector(3 downto 0);
	begin
		if CLEAR = '1' or counter = reset then 
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