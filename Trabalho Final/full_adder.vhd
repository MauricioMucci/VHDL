library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder is
	port (
		X		: in std_logic;
		Y		: in std_logic;
		C_IN	: in std_logic;
		C_OUT	: out std_logic;
		SUM	: out std_logic
	);
end full_adder;

architecture archi_adder of full_adder is
begin

	SUM 	<=	(X xor Y) xor C_IN;
	C_OUT	<=	(X and (Y or C_IN)) or (C_IN and Y);
end archi_adder;