-- HW #2: logical_4bit (4-Bit Logical Unit)
-- Dr. Daniel Loveless
-- ENEE 4710, Fall 2016
--
-- 4-bit Logical Unit: Accepts 4-bit inputs a and b, performs operation based on 4-bit opcode and generates 
-- 4-bit output g.
--
-- Opcode 	/ Function
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

entity logical_4bit is
	port 
	(
		a	   	: in std_logic_vector(3 downto 0);
		b	   	: in std_logic_vector(3 downto 0);
		opcode	: in std_logic_vector(3 downto 0);
		g 			: out std_logic_vector(3 downto 0)
	);
end entity;

architecture lu4 of logical_4bit is
begin
		g <= 	a and b when (opcode="1000") else
				a nand b when (opcode="1001") else
				a or b when (opcode="1010") else
				a nor b when (opcode="1011") else
				a xor b when (opcode="1100") else
				a xnor b when (opcode="1101") else
				not a when (opcode="1110") else
				not b when (opcode="1111") else
				"0000";
end lu4;