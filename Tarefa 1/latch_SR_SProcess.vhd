library IEEE;
use IEEE.std_logic_1164.all;

entity latch_SR_SProcess is
	port(
			data					: in std_logic_vector(1 downto 0);
			saida, saida_not	: out std_logic
	);
end latch_SR_SProcess;

architecture archi_latch of latch_SR_SProcess is
	signal tmp: std_logic;
begin
	with data select tmp <=
			'0' when "01",
			'1' when "10",
			tmp when others;
	saida 	 <= tmp;
	saida_not <= not tmp;
end archi_latch;