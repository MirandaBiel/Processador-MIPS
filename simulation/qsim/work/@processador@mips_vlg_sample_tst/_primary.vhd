library verilog;
use verilog.vl_types.all;
entity ProcessadorMips_vlg_sample_tst is
    port(
        Clock           : in     vl_logic;
        regA            : in     vl_logic_vector(4 downto 0);
        regB            : in     vl_logic_vector(4 downto 0);
        regC            : in     vl_logic_vector(4 downto 0);
        regD            : in     vl_logic_vector(4 downto 0);
        regE            : in     vl_logic_vector(4 downto 0);
        regF            : in     vl_logic_vector(4 downto 0);
        Reset           : in     vl_logic;
        sempre31        : in     vl_logic_vector(4 downto 0);
        sampler_tx      : out    vl_logic
    );
end ProcessadorMips_vlg_sample_tst;
