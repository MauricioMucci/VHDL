library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity gerador_de_sinal_duas is
	port(
			CLK, CLEAR		: in std_logic;
			SEL				: in bit;
			Q					: out std_logic;
			TESTE				: out std_logic_vector(4 downto 0)
	);
end gerador_de_sinal_duas;

architecture archi_gerador of gerador_de_sinal_duas is

signal interador: std_logic_vector(4 downto 0);
signal Q_FLIP: std_logic;


begin		
					
Contador:	process(CLK, CLEAR, interador)
				begin
					if CLEAR = '1' or (interador = "11110") then
						interador <= "00000";
					elsif CLK'event and CLK = '1' then
						interador <= interador + 1;
					else
						interador <= interador;
					end if;
				end process;

TESTE <= interador;
			
FlipFlop:	process(CLK, CLEAR, SEL, interador)
				begin
					if CLEAR = '1' then
						Q_FLIP <= '0';
					elsif CLK'event and CLK = '1' then
						if SEL = '0' then
							if interador = "00100" then
								Q_FLIP <= '1';
							elsif interador = "11101" then
								Q_FLIP <= '0';
							else
								Q_FLIP <= Q_FLIP;
							end if;
						else
							if interador = "10011" then
								Q_FLIP <= '1';
							elsif interador = "11101" then
								Q_FLIP <= '0';
							else
								Q_FLIP <= Q_FLIP;
							end if;	
						end if;
					else
						Q_FLIP <= Q_FLIP;
					end if;
				end process;
				
Q <= Q_FLIP;

end archi_gerador;


				
