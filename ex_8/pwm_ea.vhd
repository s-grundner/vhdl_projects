library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- entity

entity pwm is
    generic (
        COUNTER_LEN : natural
    );
    port (
        clk_i 				 : in std_ulogic;
        rst_i 				 : in std_ulogic;
        Period_counter_val_i : in unsigned(COUNTER_LEN-1 downto 0);
        ON_counter_val_i 	 : in unsigned(COUNTER_LEN-1 downto 0);
        PWM_o 			     : out std_ulogic
    );
end entity pwm;

-- architecture

architecture behav of pwm is

    signal count : unsigned(COUNTER_LEN-1 downto 0);
    signal count_reset_flag : std_ulogic := '0';

begin
    -- counter for the PWM

    counter_ent : entity work.counter(behav)
        generic map (
            COUNTER_LEN => COUNTER_LEN
        )
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            counter_rst_strobe_i => count_reset_flag,
            counter_o => count
        );
    
    pwm_comb : process (count, ON_counter_val_i) is
    begin
        if count < ON_counter_val_i then
            PWM_o <= '1';
        else
            PWM_o <= '0';
        end if;
    end process pwm_comb;

    clr_comb : process (count, Period_counter_val_i) is
    begin
        if count = Period_counter_val_i-1 then
            count_reset_flag <= '1';
        else
            count_reset_flag <= '0';
        end if;
    end process clr_comb;

end behav;