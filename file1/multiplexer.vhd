use work.MVL7_types.all;
use work. synthesis_types.all;


entity multiplexer is
port(

R_sel : in MVL7;
D_sel : in MVL7;
uPC_sel : in MVL7;
stack_sel : in MVL7;
OEbar : in MVL7;
sp :in integer range 0 to 5;
D : in MVL7_VECTOR(11 downto 0);
RE : in MVL7_VECTOR(11 downto 0);
uPC : in MVL7_VECTOR(11 downto 0);
Y : out MVL7_VECTOR(11 downto 0)

);
end multiplexer;

architecture mux of multiplexer is 
begin 
     muxr : block
	  signal Y_temp :MVL7_VECTOR(11 downto 0);
	  signal reg_file : MEMOTY_12_BIT(5 downto 0) :=(
	  ("000000000000"),
	  ("111111111111"),
	  ("000000001111"),
	  ("110011110000"),
	  ("101100000000")	  
	  );
	  begin 
	  Y_temp <=RE              when R_sel='1'
	         else D            when D_sel='1'
				else uPC          when uPC_sel='1'
				else reg_file(sp) when stack_sel='1' 
            else "000000000000";
				
	  Y<=Y_temp    when OEbar='0'
	  else "ZZZZZZZZZZZZ";
	 
	  end block muxr; 
end mux;







