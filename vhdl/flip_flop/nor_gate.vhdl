library ieee;
use ieee.std_logic_1164.all;


entity nor_gate is
port(	x: in std_logic;
	y: in std_logic;
	f: out std_logic
);
end nor_gate;

architecture rtl of nor_gate is 
begin 

    f <= not (x or y); 

end rtl;

