entity flip_flop is
end flip_flop;

library ieee;
use ieee.std_logic_1164.all;

library std;
use std.textio.all;

-- ovo trebam radi stampe std_logic varijabli
use ieee.std_logic_textio.all;

architecture behav of flip_flop is
    -- koristimo nor_gate komponentu u nasem sklopu
    component nor_gate
        port (x, y : in std_logic; f : out std_logic);
    end component;

    for nor_gate_0: nor_gate use entity work.nor_gate;
    for nor_gate_1: nor_gate use entity work.nor_gate;
    signal r, s, y0, x1, q, q_invert: std_logic;

begin


    nor_gate_0: nor_gate port map (x => r, y => y0, f => q);
    nor_gate_1: nor_gate port map (x => x1, y => s, f => q_invert);
 
    -- spoji q i x1
    x1 <= q;
    
    -- spoji signale q_invert i x0
    y0 <= q_invert;



    process

    variable my_line: line;

    type pattern_type is record
        s, r : std_logic;
        q: std_logic;
    end record;

    type pattern_array is array (natural range <>) of pattern_type;

    constant patterns: pattern_array :=
      (('0', '0', '0'),
       ('0', '1', '0'),
       ('0', '0', '0'),
       ('1', '0', '1'),
       ('0', '0', '1'),
       ('0', '1', '0'));

    begin

        for i in patterns'range loop

            s <= patterns(i).s;
            r <= patterns(i).r;
            wait for 1 ns;

            write(my_line, string'("s="));
            write(my_line, s);

            write(my_line, string'(" r="));
            write(my_line, r);


            write(my_line, string'(" q="));
            write(my_line, q);

            writeline(output, my_line);



            assert q = patterns(i).q
               report "bad q value" severity error;

            assert q_invert = not patterns(i).q
               report "bad q_invert value" severity error;


        end loop;

    assert false report "end of flip_flop" severity note;
    wait;

  end process;

end behav;
