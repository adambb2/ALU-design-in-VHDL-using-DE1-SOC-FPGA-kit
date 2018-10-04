-- HW #2: full_adder_4bit (4-Bit Full Adder)
-- Dr. Daniel Loveless
-- ENEE 4710, Fall 2016
--
-- Adds 4-bit number a to 4-bit number b and bit cin, generating 4-bit sum s and carry-out bit cout.

library ieee;
use ieee.std_logic_1164.all;

entity full_adder_4bit is
	port 
	(
		a	   : in std_logic_vector(3 downto 0);
		b	   : in std_logic_vector(3 downto 0);
		cin	: in std_logic;
		s 		: out std_logic_vector(3 downto 0);
		cout 	: out std_logic
	);
end entity;

architecture fa4 of full_adder_4bit is
	signal c1 : std_logic;
	signal c2 : std_logic;
	signal c3 : std_logic;

component full_adder
port 
	(
		a	   : in std_logic;
		b	   : in std_logic;
		cin	: in std_logic;
		s 	: out std_logic;
		cout 	: out std_logic
	);
end component;
	
begin
full_adder_1 : full_adder	port map(a => a(0), b => b(0), cin => cin, s => s(0), cout => c1);
full_adder_2 : full_adder	port map(a => a(1), b => b(1), cin => c1, s => s(1), cout => c2);
full_adder_3 : full_adder	port map(a => a(2), b => b(2), cin => c2, s => s(2), cout => c3);
full_adder_4 : full_adder	port map(a => a(3), b => b(3), cin => c3, s => s(3), cout => cout);

end fa4;