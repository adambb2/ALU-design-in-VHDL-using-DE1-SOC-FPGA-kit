-- HW #1: half_adder (1-Bit Half Adder)
-- Dr. Daniel Loveless
-- ENEE 4710, Fall 2016
--
-- Adds 1-bit number a to 1-bit number b, generating 1-bit sum s and carry-out bit cout.

library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
	port 
	(
		a	   : in std_logic;
		b	   : in std_logic;
		s 		: out std_logic;
		cout 	: out std_logic
	);
end entity;

architecture ha of half_adder is
begin
	s <= a xor b;
	cout <= a and b;
end ha;