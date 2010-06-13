entity flip_flop is
end flip_flop;

library ieee;
use ieee.std_logic_1164.all;



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
 
    -- spoji signale q i x1
    q <= x1;
    
    -- spoji signale q_invert i x0
    q_invert <=  y0;



    process

    type pattern_type is record
        s, r : std_logic;
        q: std_logic;
    end record;

    type pattern_array is array (natural range <>) of pattern_type;

    constant patterns: pattern_array :=
      (('0', '0', '0'),
       ('0', '1', '0'),
       ('0', '0', '0'),
       ('1', '0', '0'),
       ('0', '0', '0'),
       ('1', '0', '1'));

    begin

        for i in patterns'range loop

            s <= patterns(i).s;
            r <= patterns(i).r;

            assert q = patterns(i).q
               report "bad q value" severity error;

            assert q_invert = not patterns(i).q
               report "bad q_inv value" severity error;

            wait for 1 ns;

        end loop;

    assert false report "end of flip_flop" severity note;
    wait;

  end process;

end behav;
