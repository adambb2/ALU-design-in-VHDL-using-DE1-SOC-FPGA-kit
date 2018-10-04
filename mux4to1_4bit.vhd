-- HW #2: mux4to1_4bit (4-Bit 4:1 Multiplexor)
-- Dr. Daniel Loveless
-- ENEE 4710, Fall 2016
--
-- Selects (s) between 4-bit inputs a, b, c, or d, passing to 4-bit output f.

library ieee;
use ieee.std_logic_1164.all;

entity mux4to1_4bit is
	port 
	(
		a	   : in std_logic_vector(3 downto 0);
		b	   : in std_logic_vector(3 downto 0);
		c	   : in std_logic_vector(3 downto 0);
		d	   : in std_logic_vector(3 downto 0);
		s	   : in std_logic_vector(1 downto 0);
		f 		: out std_logic_vector(3 downto 0)
	);
end entity;

architecture mux4to1_1 of mux4to1_4bit is
begin
f <= 	a when (s="00") else
		b when (s="01") else
		c when (s="10") else
		d when (s="11") else
		"0000";
end mux4to1_1;