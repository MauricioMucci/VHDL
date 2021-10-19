library IEEE;
use IEEE.std_logic_1164.all;

entity latch_tipoD is
	port(
			dado, controle				: in std_logic;
			saida, saida_not			: out std_logic
	);
end latch_tipoD;

architecture archi_tipoD of latch_tipoD is
	signal Q: std_logic;
begin
	process(controle)
	begin
		if controle = '1' then
			Q <= dado;
		else
			Q <= Q;
		end if;
	end process;
	saida 	 <= Q;
	saida_not <= not Q;
end archi_tipoD;
				