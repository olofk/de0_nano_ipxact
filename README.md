de0_nano IP-Xact
================

This is a simple SoC created to showcase both the IP-Xact features of FuseSoC, as well as Kactus2, the tool which was used to create the IP-Xact files

[Kactus2](https://sourceforge.net/projects/kactus2/) is a great graphical open-source tool which can be used to edit
IP-Xact properties, maintain a library of IP-Xact components and put together systems.

Some notes:

- This repository doesn't contain all the IP-Xact models for the SoC. These are kept in a repo called
[or1k-ipxact](https://github.com/olofk/or1k-ipxact) for now, with the intention of gradually move them to their
respective IP core's repository. This means that if you want to open up the design in Kactus2, you need to add both
this repository and the or1k-ipxact repository to your library path.

- There are some verilog files in rtl/verilog that just seems to contain a simple instantiation of another core.
These are added to work around limitations in the current version of Kactus2 and/or IP-Xact. Most notably are the issues
that the name of the top-level module of an IP core must match the IP-Xact name. There is also a bug that prevents
setting parameters for cores. Bugs have beeen filed for both issues [1](http://kactus2.cs.tut.fi/issues/273) [2](http://kactus2.cs.tut.fi/issues/266)

- For those of you who haven't used FuseSoC before, you can find installation instructions in the [FuseSoC repo](https://github.com/olofk/fusesoc)
  
    After installation, either copy fusesoc.conf from ~/.config/fusesoc/ to your working directory and add the path to the de0_nano_ipxact directory, or add the parameter --cores-root=/path/to/de0_nano_ipxact at runtime

    Run `fusesoc build de0_nano_ipxact` to build a FPGA bitstream with Quartus2
    Run `fusesoc sim de0_nano_ipxact` to start a simulation in Icarus Verilog
    (`fusesoc sim --sim=modelsim de0_nano_ipxact` to run it under modelsim instead.
    `fusesoc sim de0_nano_ipxact --help` to list available simulation options for the system)


