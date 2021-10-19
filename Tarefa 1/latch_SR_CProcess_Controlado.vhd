library IEEE;
use IEEE.std_logic_1164.all;

entity latch_SR_CProcess_Controlado is
	port(
			set, reset, controle	: in std_logic;
			saida, saida_not		: out std_logic
	);
end latch_SR_CProcess_Controlado;

architecture archi_latch of latch_SR_CProcess_Controlado is
	signal Q: std_logic;
begin

	process(set, reset, controle,Q)
	begin
		if controle = '1' then
			if set = '0' and reset = '0' then
				Q <= Q;
			elsif set = '0' and reset = '1' then
				Q <= '0';
			elsif set = '1' and reset = '0' then
				Q <= '1';
			elsif set = '1' and reset = '1' then
				Q <= Q;
			end if;
		else
			Q <= Q;
		end if;
	end process;
	saida 	 <= Q;
	saida_not <= not Q;
end archi_latch;