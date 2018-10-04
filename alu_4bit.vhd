-- HW #2: alu_4bit
-- Dr. Daniel Loveless
-- ENEE 4710, Fall 2016
--
-- 4-bit ALU: Accepts 4-bit inputs a and b and a carry-in bit, performs operation based on 4-bit opcode and generates 
-- 4-bit output g and carry-out bit.
-- 
-- Opcode 	/ Function
-- 0000		/	G = A
-- 0001		/  G = A + 1
-- 0010		/  G = A + B
-- 0011		/  G = A + B + 1
-- 0100		/  G = A + NOT(B))
-- 0101		/  G = A - B
-- 0110     /  G = A -1
-- 0111     /  G = A
-- 1000		/	G = A AND B
-- 1001     /  G = A NAND B
-- 1010		/  G = A OR B
-- 1011		/  G = A NOR B
-- 1100		/  G = A XOR B
-- 1101		/  G = A XNOR B
-- 1110		/  G = NOT(A)
-- 1111		/  G = NOT(B)

library ieee;
use ieee.std_logic_1164.all;

entity alu_4bit is
	port 
	(
		a	   	: in std_logic_vector(3 downto 0);          -- 4 bit input vector a
		b	   	: in std_logic_vector(3 downto 0);          -- 4 bit input vector b
		opcode	: in std_logic_vector(3 downto 0);          -- 4 bit input vector opcode arranged as (s2 s1 s0 cin)
		g 			: out std_logic_vector(3 downto 0);         -- 4 bit output vector g
		cout 		: out std_logic                             -- 1 bit output carry out (cout)
	);
end entity;

architecture alu4 of alu_4bit is
   signal b1 	: std_logic_vector(3 downto 0);             -- internal signal used at 4:1 mux output and b-input of full adder (FA)
   signal g1 	: std_logic_vector(3 downto 0);             -- internal signal: output of FA
   signal g2 	: std_logic_vector(3 downto 0);             -- internal signal: output of logical unit (LU)
   constant zeros : std_logic_vector:= "0000";             -- 4-bit sequence of 0s: "0000"
	constant ones : std_logic_vector:= "1111";              -- 4-bit sequence of 1s: "1111"
	alias s2 	: std_logic is opcode(3);                   -- aliases (for readability) for indivudal opcode bits
	alias s1 	: std_logic is opcode(2);
	alias s0 	: std_logic is opcode(1);
	alias cin 	: std_logic is opcode(0);

-- component definitions
component full_adder_4bit
port 
	(
		a	   : in std_logic_vector(3 downto 0);
		b	   : in std_logic_vector(3 downto 0);
		cin	: in std_logic;
		s 		: out std_logic_vector(3 downto 0);
		cout 	: out std_logic
	);
end component;

component mux4to1_4bit
port 
	(
		a	   : in std_logic_vector(3 downto 0);
		b	   : in std_logic_vector(3 downto 0);
		c	   : in std_logic_vector(3 downto 0);
		d	   : in std_logic_vector(3 downto 0);
		s	   : in std_logic_vector(1 downto 0);
		f 		: out std_logic_vector(3 downto 0)
	);
end component;

component logical_4bit
port 
	(
		a	   	: in std_logic_vector(3 downto 0);
		b	   	: in std_logic_vector(3 downto 0);
		opcode	: in std_logic_vector(3 downto 0);
		g 			: out std_logic_vector(3 downto 0)
	);
end component;

begin
-- map component ports to entity ports or signals port map (component port => signal/entity port)
-- example (FA: a-input connected to ALU input a, b-input connected to signal b1, cin-input connected to ALU input cin, etc.)
full_adder_4bit_1 : full_adder_4bit	port map(a => a, b => b1, cin => cin, s => g1, cout => cout);
logical_4bit_1 : logical_4bit	port map(a => a, b => b, opcode => opcode, g => g2);
mux4to1_4bit_1: mux4to1_4bit port map(a => zeros, b => b, c => not b, d => ones, s(1) => s1, s(0) => s0, f => b1);
-- implement a 2:1 mux selecting between output g1 (from FA) or g1 (from LU)
g <= 	g1 when (s2='0') else
		g2 when (s2='1') else
		"0000";
end alu4;