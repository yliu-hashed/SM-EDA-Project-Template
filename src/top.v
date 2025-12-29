`default_nettype none

// Top Level Module
// If you changed this name, you also need to change `resources/script.ys`
// Tip: Tt is almost always to name the top level module `top` for disambiguation
module top (
  // Top Level Ports
  // If you changed these ports, you also need to change `resources/config.json`
  input  wire [7:0] i_a,
  input  wire [7:0] i_b,
  output wire [7:0] o_v
  );

  // Dummy content. Put your code here...
  assign o_v = i_a * i_b;

  // Tip: instantiate a module from another file like this
  // module_name #(
  //   .parameter_name(parameter_value),
  //   .more_parameter(more_parameter_value)
  // ) instance_name (
  //   .port_name(port_value),
  //   .more_port_name(more_port_value)
  // );

endmodule
