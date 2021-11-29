library IEEE;
use IEEE.std_logic_1164.all;

entity add_sub_8bit is
	port (
		OP			: in std_logic; --Operacao
		A			: in std_logic_vector(7 downto 0);
		B			: in std_logic_vector(7 downto 0);
		RES		: out std_logic_vector(7 downto 0); --Resultado
		CARRY		: out std_logic;
		OVERFLOW	: out std_logic
	);
end add_sub_8bit;

architecture archi_op of add_sub_8bit is

component full_adder is
	port (
		X		: in std_logic;
		Y		: in std_logic;
		C_IN	: in std_logic;
		C_OUT	: out std_logic;
		SUM	: out std_logic
	);
end component;

signal C, TMP: std_logic_vector(7 downto 0);

begin

TMP(0) <= B(0) xor OP;
TMP(1) <= B(1) xor OP;
TMP(2) <= B(2) xor OP;
TMP(3) <= B(3) xor OP;
TMP(4) <= B(4) xor OP;
TMP(5) <= B(5) xor OP;
TMP(6) <= B(6) xor OP;
TMP(7) <= B(7) xor OP;

FA0: full_adder port map(A(0), TMP(0), OP, C(0), RES(0));
FA1: full_adder port map(A(1), TMP(1), C(0), C(1), RES(1));
FA2: full_adder port map(A(2), TMP(2), C(1), C(2), RES(2));
FA3: full_adder port map(A(3), TMP(3), C(2), C(3), RES(3));
FA4: full_adder port map(A(4), TMP(4), C(3), C(4), RES(4));
FA5: full_adder port map(A(5), TMP(5), C(4), C(5), RES(5));
FA6: full_adder port map(A(6), TMP(6), C(5), C(6), RES(6));
FA7: full_adder port map(A(7), TMP(7), C(6), C(7), RES(7));

CARRY <= C(7);

OVERFLOW <= C(6) xor C(7);

end archi_op;
