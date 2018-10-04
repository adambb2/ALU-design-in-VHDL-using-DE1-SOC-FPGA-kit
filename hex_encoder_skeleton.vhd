-- HW #3: 7-segment display HEX encoder skeleton (change file name to hex_encoder.vhd when complete).
-- Note the ordering of bits!!!!! 
-- ENEE 4710, Fall 2016

library ieee;
use ieee.std_logic_1164.all;

entity hex_encoder is
port 
	(
		vin	   : in std_logic_vector(3 downto 0);
		hout 		: out std_logic_vector(6 downto 0)
	);
end entity;

architecture hex_encoder_1 of hex_encoder is
begin
-- refer to page 25 of the DE1_SOC_Users_Manual for HEX pin assignments.  Note that the 7-segment LEDs are activated when logic '0' is applied
with vin in select
	hout <= "0000000" when "0000", --0
			  "0000001" when "0001", --1
			  "0000010" when "0010", --2
			  "0000100" when "0011", --3
			  "0001000" when "0100", --4
			  "0010000" when "0101", --5
			  "0100000" when "0110", --6
			  "1000000" when "0111", --7
			  "1100000" when "1000", --8
			  "1010000" when "1001", --9
			  "1001000" when "1010", --A
			  "1000100" when "1011", --B
			  "1000010" when "1100", --C
			  "1000001" when "1101", --D
			  "1000011" when "1110", --E
			  "1000111" when "1111", --F
			  "1111111" when others;
end hex_encoder_1;