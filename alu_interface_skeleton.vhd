-- HW #3: 4-Bit ALU Interface (Rename this alu_interface.vhd).
-- Dr. Daniel Loveless
-- ENEE 4710, Fall 2016
--
-- This is a skeleton project for HW #3. The interface to your 4-bit ALU should be the top-level 
-- entity (alu_interface.vhd) with the following I/O:
--		SW	   	: Switches for vector inputs a and b and input cin
--		KEY 		: button KEY0 to adjust opcode
--		HEX0		: HEX0 7-seg. display for opcode
--		HEX2		: HEX2 7-seg. display for output LSB
--		HEX3		: HEX3 7-seg. display for output MSB
--		LEDR 		: Red LEDs for carry out cout and output vector g 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_interface is
port 
	(
-- Place ports here
	);
end entity;

architecture alu_interface_1 of alu_interface is

-- Place any signals you need here

-- Place any variables and constants you need here

-- Place an aliases you need here

-- Define the 4-bit ALU component. This skeleton refers to Dr. Loveless' ALU from HW #2
component alu_4bit											-- alu_4bit.vhd (4-bit ALU from HW #2)
	port 
	(
		a	   	: in std_logic_vector(3 downto 0);	-- 4 bit input vector a
		b	   	: in std_logic_vector(3 downto 0);	-- 4 bit input vector b
		opcode	: in std_logic_vector(3 downto 0);	-- 4 bit input vector opcode arranged as (s2 s1 s0 cin)
		g 			: out std_logic_vector(3 downto 0);	-- 4 bit output vector g
		cout 		: out std_logic                 		-- 1 bit output carry out (cout)
	);
end component;

-- You are going to need to create a counter to cycle through the 3 most-significant bits 
-- of the ALU's opcode. Here is the component definition. Name the file count_3bit.vhd.
component count_3bit											-- count_3bit.vhd (3-bit counter for cycling through 3 MSBs of opcode)
	port 
	(
		countin	   : in std_logic;          					-- 1 bit input
		q 				: out std_logic_vector(2 downto 0)     -- 3 bit output vector denoting binary count
	);
end component;

-- You are going to need to create an encoder that accepts a 4-bit input and converts to a 7-bit code for the 7-segments 
-- displays. Name the file hex_encoder.vhd.
-- HINT: Look up the 7-segment display in the DE1-SOC manual and note the order of the bits!
component hex_encoder is									-- hex_encoder.vhd (4:7 HEX encoder for 7-segment displays)
port 
	(
		vin	   : in std_logic_vector(3 downto 0);	-- 4-bit input vector (binary)
		hout 		: out std_logic_vector(6 downto 0)	-- 7-bit output vector (7-segment display, hexadecimal)
	);
end component;

begin

-- Describe architecture here. Place component connectivity/port maps and signal assignments.
-- Note: You should not require any other behavioral descriptions in this file, other than port mapping of the defined components.

end alu_interface_1;