{ config, pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Nvidia
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.beta;
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
  services.xserver.videoDrivers = [ "nvidia" ];

  # X11
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    excludePackages = with pkgs; [ xterm ];
  };
}
