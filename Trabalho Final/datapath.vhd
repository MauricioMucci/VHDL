library IEEE;
use IEEE.std_logic_1164.all;

entity datapath is
	port (
		C			: in std_logic_vector(10 downto 0);
		CLOCK		: in std_logic;
		RESET		: in std_logic;
		DATA_IN	: in std_logic_vector(7 downto 0);
		DATA_OUT	: out std_logic_vector(7 downto 0);
		OVER		: out std_logic;
		C_OUT		: out std_logic
	);
end datapath;

architecture archi_data of datapath is

component mux_2_1 is
	port ( 
		entrada0	: 	in std_logic_vector(7 downto 0);
		entrada1	: 	in std_logic_vector(7 downto 0);
		seletor	: 	in std_logic;
		saida		: 	out std_logic_vector(7 downto 0)
	);
end component;

component reg8bit is
	port (
		D		: in std_logic_vector(7 downto 0);
		CLK	: in std_logic;
		LOAD	: in std_logic;
		CLEAR	: in std_logic;
		Q		: out std_logic_vector(7 downto 0)
	);
end component;

component add_sub_8bit is
	port (
		OP			: in std_logic; --Operacao
		A			: in std_logic_vector(7 downto 0);
		B			: in std_logic_vector(7 downto 0);
		RES		: out std_logic_vector(7 downto 0); --Resultado
		CARRY		: out std_logic;
		OVERFLOW	: out std_logic
	);
end component;

component operacao is
	port (
		X	: in std_logic_vector(7 downto 0);
		Y	: in std_logic_vector(7 downto 0);
		E	: in std_logic;
		S	: out std_logic_vector(7 downto 0)
	);
end component;

signal DATA_TMP: std_logic_vector(7 downto 0);

signal SAIDA_MUX0: std_logic_vector(7 downto 0);
signal SAIDA_MUX1: std_logic_vector(7 downto 0);
signal SAIDA_MUX2: std_logic_vector(7 downto 0);
signal SAIDA_MUX3: std_logic_vector(7 downto 0);

signal SAIDA_REG0: std_logic_vector(7 downto 0);
signal SAIDA_REG1: std_logic_vector(7 downto 0);
signal SAIDA_REG2: std_logic_vector(7 downto 0);
signal SAIDA_REG3: std_logic_vector(7 downto 0);

SIGNAL SAIDA_SUM: std_logic_vector(7 downto 0);
SIGNAL SAIDA_OP: std_logic_vector(7 downto 0);

begin

	MX0: mux_2_1 port map(DATA_TMP, DATA_IN, C(0), SAIDA_MUX0);
	MX1: mux_2_1 port map(DATA_TMP, DATA_IN, C(1), SAIDA_MUX1);
	MX2: mux_2_1 port map(DATA_TMP, DATA_IN, C(2), SAIDA_MUX2);
	MX3: mux_2_1 port map(DATA_TMP, DATA_IN, C(3), SAIDA_MUX3);

	RG0: reg8bit port map(SAIDA_MUX0, CLOCK, C(4), RESET, SAIDA_REG0);
	RG1: reg8bit port map(SAIDA_MUX1, CLOCK, C(5), RESET, SAIDA_REG1);
	RG2: reg8bit port map(SAIDA_MUX2, CLOCK, C(6), RESET, SAIDA_REG2);
	RG3: reg8bit port map(SAIDA_MUX3, CLOCK, C(7), RESET, SAIDA_REG3);

	SUM: add_sub_8bit port map(C(9), SAIDA_REG2, SAIDA_REG3, SAIDA_SUM, C_OUT, OVER);

	OPE: operacao port map(SAIDA_REG0, SAIDA_REG1, C(8), SAIDA_OP);

	MX4: mux_2_1 port map(SAIDA_SUM, SAIDA_OP,C(10), DATA_TMP);

	DATA_OUT <= DATA_TMP;
	
end archi_data;