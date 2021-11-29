library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity div_simetrico is
	port (
				CLK, CLEAR	: in std_logic;
				Q 				: out std_logic;
				TESTE			: out std_logic_vector(3 downto 0)				
	);
end div_simetrico;

architecture archi_div of div_simetrico is

signal interador: std_logic_vector(3 downto 0);
signal Q_FLIP_1, Q_FLIP_2: std_logic;

begin

Contador:	process(CLK, CLEAR)
				begin
					if CLEAR = '1' or (interador = "1101") then
						interador <= "0000";
					elsif CLK'event and CLK = '1' then
						interador <= interador + 1;
					else
						interador <= interador;
					end if;
				end process;
				
TESTE <= interador;
				
FlipFlop1:	process(CLK, CLEAR, interador)
				begin
					if CLEAR = '1' then
						Q_FLIP_1 <= '0';
					elsif CLK'event and CLK = '1' then
						if interador = "0101" then
							Q_FLIP_1 <= '1';
						elsif interador = "1100" then
							Q_FLIP_1 <= '0';
						else
							Q_FLIP_1 <= Q_FLIP_1;
						end if;
					else
						Q_FLIP_1 <= Q_FLIP_1;
					end if;
				end process;
				
FlipFlop2:	process(CLK, CLEAR, interador)
				begin
					if CLEAR = '1' then
						Q_FLIP_2 <= '0';
					elsif CLK'event and CLK = '0' then
						Q_FLIP_2 <= Q_FLIP_1;
					else
						Q_FLIP_2 <= Q_FLIP_2;
					end if;
				end process;
				
Q <= Q_FLIP_1 and Q_FLIP_2;

end archi_div;