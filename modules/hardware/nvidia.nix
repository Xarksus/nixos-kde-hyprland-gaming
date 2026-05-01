{ config, pkgs, lib, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [
      "nvidia-drm.modeset=1"
    ];
  };

  services.xserver.xrandrHeads = [ ];
}
