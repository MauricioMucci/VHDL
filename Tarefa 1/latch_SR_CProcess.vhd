library IEEE;
use IEEE.std_logic_1164.all;

entity latch_SR_CProcess is
	port(
			set, reset					: in std_logic;
			saida, saida_not			: out std_logic
	);
end latch_SR_CProcess;

architecture archi_latch of latch_SR_CProcess is
	signal Q: std_logic;
begin
	process(set, reset)
	begin
		if reset = '1' then
			Q <= '0';
		elsif set = '1' then
			Q <= '1';
		else
			Q <= Q;
		end if;
	end process;
	saida 	 <= Q;
	saida_not <= not Q;
end archi_latch;