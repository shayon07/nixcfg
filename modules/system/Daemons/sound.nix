# { config, pkgs, ... }:
# {
#   hardware.pulseaudio.enable = false;
#   # rtkit (optional, recommended) allows Pipewire to use the realtime scheduler for increased performance.
#   security.rtkit.enable = true;
#   #Audio (Pipewire)
# 	services.pipewire = {
# 		enable = true;
#     alsa.enable = true;
#     alsa.support32Bit = true;
# 		pulse.enable = true;
#     jack.enable = true;
#     wireplumber.enable = true;
# 	};
# }

{ config, pkgs, ... }:

{
  ##############################
  # Audio (SOF SoundWire) Setup
  ##############################

  # Keep SOF driver, disable AVS and HDA to avoid conflicts
  boot.kernelModules = [ "snd_sof_pci_intel_tgl" ];
  boot.blacklistedKernelModules = [
    "snd_soc_avs"
  ];
  boot.kernelParams = [ "snd_intel_dspcfg.dsp_driver=3" ];

  # Ensure firmware is available to SOF driver
  # hardware.enableRedistributableFirmware = true;
  hardware.enableAllFirmware = true;

  # Pipewire + ALSA setup
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # Install ALSA UCM configs so SOF knows mic/speaker routing
  environment.systemPackages = with pkgs; [
    sof-firmware
    alsa-ucm-conf
    alsa-utils
  ];
}
