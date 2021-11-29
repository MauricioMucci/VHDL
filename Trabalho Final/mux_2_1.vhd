LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY mux_2_1 IS
	PORT ( 
		entrada0	: 	in std_logic_vector(7 downto 0);
		entrada1	: 	in std_logic_vector(7 downto 0);
		seletor	: 	in std_logic;
		saida		: 	out std_logic_vector(7 downto 0)
	);
END mux_2_1;

ARCHITECTURE arq_mux2 OF mux_2_1 IS
BEGIN
	WITH seletor SELECT
		saida <=  entrada0 WHEN '0',
					 entrada1 WHEN '1',
					"00000000" WHEN OTHERS;

END arq_mux2;