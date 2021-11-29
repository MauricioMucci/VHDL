library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity gerador_de_sinal_quatro is
	port(
			CLK, CLEAR	: in std_logic;
			Q				: out std_logic;
			TESTE			: out std_logic_vector(5 downto 0)
	);
end gerador_de_sinal_quatro;

architecture archi_gerador of gerador_de_sinal_quatro is

signal interador: std_logic_vector(5 downto 0);
signal Q_FLIP: std_logic;

begin

Contador:	process(CLK, CLEAR)
				begin
					if CLEAR = '1' or (interador = "101000") then
						interador <= "000000";
					elsif CLK'event and CLK = '1' then
						interador <= interador + 1;
					else
						interador <= interador;
					end if;
				end process;
				
TESTE <= interador;
				
FlipFlop:	process(CLK, CLEAR, interador)
				begin
					if CLEAR = '1' then
						Q_FLIP <= '0';
					elsif CLK'event and CLK = '1' then
						if interador = "000101" or interador = "011000" then
							Q_FLIP <= '1';
						elsif interador = "001110" or interador = "100111" then
							Q_FLIP <= '0';
						else
							Q_FLIP <= Q_FLIP;
						end if;
					else
						Q_FLIP <= Q_FLIP;
					end if;
				end process;

Q <= Q_FLIP;

end archi_gerador;