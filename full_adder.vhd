-- HW #1: full_adder (1-Bit Full Adder)
-- Dr. Daniel Loveless
-- ENEE 4710, Fall 2016
--
-- Adds 1-bit number a to 1-bit number b and bit cin, generating 1-bit sum s and carry-out bit cout.

library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
	port 
	(
		a	   : in std_logic;
		b	   : in std_logic;
		cin	: in std_logic;
		s 		: out std_logic;
		cout 	: out std_logic
	);
end entity;

architecture fa of full_adder is
	signal s1 : std_logic;
	signal c1 : std_logic;
	signal c2 : std_logic;

component half_adder
port 
	(
		a	   : in std_logic;
		b	   : in std_logic;
		s 	: out std_logic;
		cout 	: out std_logic
	);
end component;
	
begin
half_adder_1 : half_adder	port map(a => a, b => b, s => s1, cout => c1);
half_adder_2 : half_adder	port map(a => cin, b => s1, s => s, cout => c2);

cout <= c1 or c2;
end fa;