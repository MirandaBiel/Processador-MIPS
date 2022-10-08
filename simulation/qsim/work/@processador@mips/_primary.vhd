library verilog;
use verilog.vl_types.all;
entity ProcessadorMips is
    port(
        Overflow        : out    vl_logic;
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        sempre31        : in     vl_logic_vector(4 downto 0);
        regA            : in     vl_logic_vector(4 downto 0);
        regB            : in     vl_logic_vector(4 downto 0);
        regC            : in     vl_logic_vector(4 downto 0);
        regD            : in     vl_logic_vector(4 downto 0);
        regE            : in     vl_logic_vector(4 downto 0);
        regF            : in     vl_logic_vector(4 downto 0);
        zero            : out    vl_logic;
        Ch_select_pc    : out    vl_logic_vector(2 downto 0);
        Data_in_reg     : out    vl_logic_vector(31 downto 0);
        ent2            : out    vl_logic_vector(31 downto 0);
        instrucao       : out    vl_logic_vector(31 downto 0);
        n_intrucao      : out    vl_logic_vector(11 downto 0);
        Opalu           : out    vl_logic_vector(4 downto 0);
        Reg_1           : out    vl_logic_vector(31 downto 0);
        Reg_2           : out    vl_logic_vector(31 downto 0);
        Result          : out    vl_logic_vector(31 downto 0);
        VisualA         : out    vl_logic_vector(31 downto 0);
        VisualB         : out    vl_logic_vector(31 downto 0);
        VisualC         : out    vl_logic_vector(31 downto 0);
        VisualD         : out    vl_logic_vector(31 downto 0);
        VisualE         : out    vl_logic_vector(31 downto 0);
        VisualF         : out    vl_logic_vector(31 downto 0)
    );
end ProcessadorMips;
