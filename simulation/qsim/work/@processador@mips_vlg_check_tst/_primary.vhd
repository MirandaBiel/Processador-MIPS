library verilog;
use verilog.vl_types.all;
entity ProcessadorMips_vlg_check_tst is
    port(
        Ch_select_pc    : in     vl_logic_vector(2 downto 0);
        Data_in_reg     : in     vl_logic_vector(31 downto 0);
        ent2            : in     vl_logic_vector(31 downto 0);
        instrucao       : in     vl_logic_vector(31 downto 0);
        n_intrucao      : in     vl_logic_vector(11 downto 0);
        Opalu           : in     vl_logic_vector(4 downto 0);
        Overflow        : in     vl_logic;
        Reg_1           : in     vl_logic_vector(31 downto 0);
        Reg_2           : in     vl_logic_vector(31 downto 0);
        Result          : in     vl_logic_vector(31 downto 0);
        VisualA         : in     vl_logic_vector(31 downto 0);
        VisualB         : in     vl_logic_vector(31 downto 0);
        VisualC         : in     vl_logic_vector(31 downto 0);
        VisualD         : in     vl_logic_vector(31 downto 0);
        VisualE         : in     vl_logic_vector(31 downto 0);
        VisualF         : in     vl_logic_vector(31 downto 0);
        zero            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end ProcessadorMips_vlg_check_tst;
