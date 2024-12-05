{ config, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    open = true;
    modesetting.enable = true;

    # Make suspension and hibernation work
    powerManagement.enable = true;
    nvidiaPersistenced = true;

    # Try uncommenting this if things don't work
    # prime = {
    #   offload = {
    #     enable = true;
    #     enableOffloadCmd = true;
    #   };
    #   intelBusId = "PCI:0:2:0";
    #   nvidiaBusId = "PCI:1:0:0";
    # };
  };

  programs.xwayland.enable = true;
}
