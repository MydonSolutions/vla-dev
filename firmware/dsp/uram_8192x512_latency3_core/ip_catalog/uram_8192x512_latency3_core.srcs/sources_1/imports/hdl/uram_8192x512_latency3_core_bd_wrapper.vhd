--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.1.3 (lin64) Build 2644227 Wed Sep  4 09:44:18 MDT 2019
--Date        : Sat Feb  5 17:58:43 2022
--Host        : rtr-dev1 running 64-bit Ubuntu 18.04.4 LTS
--Command     : generate_target uram_8192x512_latency3_core_bd_wrapper.bd
--Design      : uram_8192x512_latency3_core_bd_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity uram_8192x512_latency3_core_bd_wrapper is
  port (
    addr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    clk : in STD_LOGIC;
    data : in STD_LOGIC_VECTOR ( 511 downto 0 );
    dout : out STD_LOGIC_VECTOR ( 511 downto 0 );
    we : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end uram_8192x512_latency3_core_bd_wrapper;

architecture STRUCTURE of uram_8192x512_latency3_core_bd_wrapper is
  component uram_8192x512_latency3_core_bd is
  port (
    addr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    clk : in STD_LOGIC;
    data : in STD_LOGIC_VECTOR ( 511 downto 0 );
    dout : out STD_LOGIC_VECTOR ( 511 downto 0 );
    we : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component uram_8192x512_latency3_core_bd;
begin
uram_8192x512_latency3_core_bd_i: component uram_8192x512_latency3_core_bd
     port map (
      addr(12 downto 0) => addr(12 downto 0),
      clk => clk,
      data(511 downto 0) => data(511 downto 0),
      dout(511 downto 0) => dout(511 downto 0),
      we(0) => we(0)
    );
end STRUCTURE;
