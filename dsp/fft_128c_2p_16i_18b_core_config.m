
function fft_128c_2p_16i_18b_core_config(this_block)

  % Revision History:
  %
  %   15-May-2012  (11:34 hours):
  %     Original code was machine generated by Xilinx's System Generator after parsing
  %     /scratch/zaki/workspace/roachfengine/fft_1024ch_core.vhd
  %
  %

  this_block.setTopLevelLanguage('VHDL');

  this_block.setEntityName('fft_128c_2p_16i_18b_core_ip_struct');

  % System Generator has to assume that your entity  has a combinational feed through; 
  %   if it  doesn't, then comment out the following line:
  %this_block.tagAsCombinational;

  
  this_block.addSimulinkInport('sync');
  this_block.addSimulinkInport('shift');
  this_block.addSimulinkInport('pol_in0');
  this_block.addSimulinkInport('pol_in1');

  this_block.addSimulinkOutport('sync_out');
  this_block.addSimulinkOutport('pol_out0');
  this_block.addSimulinkOutport('pol_out1');
  this_block.addSimulinkOutport('overflow');

  overflow_port = this_block.port('overflow');
  overflow_port.setType('UFix_4_0');
  pol_out0_port = this_block.port('pol_out0');
  pol_out0_port.setType('UFix_288_0');
  pol_out1_port = this_block.port('pol_out1');
  pol_out1_port.setType('UFix_288_0');
  sync_out_port = this_block.port('sync_out');
  sync_out_port.setType('Bool');

  % -----------------------------
  if (this_block.inputTypesKnown)
    % do input type checking, dynamic output type and generic setup in this code block.

    if (this_block.port('pol_in0').width ~= 16*18);
      this_block.setError('Input data type for port "pol_in0" must have width=18*32.');
    end
    if (this_block.port('pol_in1').width ~= 16*18);
      this_block.setError('Input data type for port "pol_in1" must have width=18*32.');
    end
    if (this_block.port('shift').width ~= 16);
      this_block.setError('Input data type for port "shift" must have width=16.');
    end

    if (this_block.port('sync').width ~= 32);
      this_block.setError('Input data type for port "sync" must have width=32.');
    end

    %this_block.port('sync').useHDLVector(false);

  end  % if(inputTypesKnown)
  % -----------------------------

  % -----------------------------
   if (this_block.inputRatesKnown)
     setup_as_single_rate(this_block,'clk_1','ce_1')
   end  % if(inputRatesKnown)
  % -----------------------------

    % (!) Set the inout port rate to be the same as the first input 
    %     rate. Change the following code if this is untrue.
    uniqueInputRates = unique(this_block.getInputRates);


  % Add addtional source files as needed.
  %  |-------------
  %  | Add files in the order in which they should be compiled.
  %  | If two files "a.vhd" and "b.vhd" contain the entities
  %  | entity_a and entity_b, and entity_a contains a
  %  | component of type entity_b, the correct sequence of
  %  | addFile() calls would be:
  %  |    this_block.addFile('b.vhd');
  %  |    this_block.addFile('a.vhd');
  %  |-------------

  %    this_block.addFile('');
  %    this_block.addFile('');
  %this_block.addFile('fft_2048ch_6a_core/sysgen/fft_2048ch_6a_core.vhd');
  this_block.addFile('dsp/fft_128c_2p_16i_18b_core_ip_struct.vhd');

return;


% ------------------------------------------------------------

function setup_as_single_rate(block,clkname,cename) 
  inputRates = block.inputRates; 
  uniqueInputRates = unique(inputRates); 
  if (length(uniqueInputRates)==1 & uniqueInputRates(1)==Inf) 
    block.addError('The inputs to this block cannot all be constant.'); 
    return; 
  end 
  if (uniqueInputRates(end) == Inf) 
     hasConstantInput = true; 
     uniqueInputRates = uniqueInputRates(1:end-1); 
  end 
  if (length(uniqueInputRates) ~= 1) 
    block.addError('The inputs to this block must run at a single rate.'); 
    return; 
  end 
  theInputRate = uniqueInputRates(1); 
  for i = 1:block.numSimulinkOutports 
     block.outport(i).setRate(theInputRate); 
  end 
  block.addClkCEPair(clkname,cename,theInputRate); 
  return; 

% ------------------------------------------------------------
