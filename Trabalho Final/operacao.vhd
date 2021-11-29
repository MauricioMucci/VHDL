library IEEE;
use IEEE.std_logic_1164.all;

entity operacao is
	port (
		X	: in std_logic_vector(7 downto 0);
		Y	: in std_logic_vector(7 downto 0);
		E	: in std_logic;
		S	: out std_logic_vector(7 downto 0)
	);
end operacao;

architecture archi_op of operacao is
begin

	with E select
		S 	<=	(X and Y) when '0',
				(X or Y) when others;
end archi_op;
