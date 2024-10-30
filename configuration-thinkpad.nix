# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 10;
  };
  # boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.grub = {
  #   enable = true;
  #   devices = [ "nodev" ];
  #   efiSupport = true;
  #   useOSProber = true;
  #   configurationLimit = 5;
  # };
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelParams = [
    "amdgpu.sg_display=0"
    "usbcore.autosuspend=-1"
  ];
  boot.kernelModules = [ "zenpower" "amd-pstate" ];
  boot.blacklistedKernelModules = [ "k10temp" "nouveau"];
  boot.extraModulePackages = [ 
    config.boot.kernelPackages.zenpower
  ];
  # boot.extraModprobeConfig = ''
  #   options usbcore autosuspend=-1
  # '';

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Nix configuration
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    gcc-arm-embedded
  ];
  programs.direnv.enable = true;

  # power management
  # powerManagement = {
  #   enable = true;
  #   powertop.enable = true;
  #   cpuFreqGovernor = "powersave";
  # };
  # services.thermald.enable = true;
  # services.power-profiles-daemon.enable = false;
  # services.auto-cpufreq = {
  #   enable = true;
  #   settings = {
  #     battery = {
  #       governor = "powersave";
  #       turbo = "never";
  #     };
  #     charger = {
  #       governor = "powersave";
  #       turbo = "auto";
  #     };
  #   };
  # };

  # Enable Flatpak
  services.flatpak.enable = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome = {
      enable = true;
      # extraGSettingsOverridePackages = [ pkgs.gnome.mutter ];
    };
  };

  # Syncthing
  services.syncthing = {
    enable = true;
    user = "mironov";
    dataDir = "/home/mironov/";
    configDir = "/home/mironov/.config/syncthing";
  };

  # fingerprint
  services.fprintd = {
    # disabled due to some bugs
    enable = false;
    tod = {
      enable = false;
      driver = pkgs.libfprint-2-tod1-vfs0090;
    };
  };


  # systemd.services.nvidia-control-devices = {
  #   wantedBy = [ "multi-user.target" ];
  #   serviceConfig.ExecStart = "${pkgs.linuxPackages.nvidia_x11.bin}/bin/nvidia-smi";
  # };




  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  hardware.pulseaudio.enable = false;
  # OR
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  security.sudo = {
    enable = true;
    extraConfig = ''
      Defaults pwfeedback
    '';
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mironov = {
    isNormalUser = true;
    extraGroups = [
      "wheel" # Enable 'sudo' for 'mironov'
      "plugdev"
      "uucp"
      "dialout"
      "lock"
      "cdrom"
      "audio"
      "networkmanager"
    ];
    packages = with pkgs; [
      firefox
      brave
      chromium
      google-chrome
      tree

      # development
      kitty
      obsidian
      syncthing
      blackbox-terminal

      # engineering
      kicad
      platformio
      platformio-core

      # entertainment
      discord
      spotify
      beeper

      # utility
      bitwarden-desktop
    ];
  };
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    wget
    curl
    git
    eza
    lshw
    pciutils
    xsel
    xclip
    wl-clipboard
    zoxide
    ripgrep
    udev
    openssl
    llvm
    geist-font
    usbutils

    # dev tools
    gcc-unwrapped
    gnupg
    procps
    util-linux
    m4
    autoconf
    gperf
    unzip
    zlib
    cmake
    ccache
    ninja
    libffi
    dfu-util
    dfu-programmer
    libusb1
    blackbox-terminal
    qt5.full
    openocd


    # IDEs
    jetbrains.clion
    jetbrains.rust-rover
    jetbrains.rider
    jetbrains.pycharm-community
    jetbrains.idea-community
    jetbrains.goland
    vscode


    ## CUDA
    # cudatoolkit
    # libGLU libGL
    xorg.libXi xorg.libXmu freeglut 
    xorg.libXext xorg.libX11 xorg.libXv xorg.libXrandr
    ncurses5
    stdenv.cc
    binutils
    nodejs
    zoxide
    ## Python 3
    python3Full
    (python311.withPackages(ps: with ps; [
      pip
      requests
      numpy
      pandas
      pynvim
      matplotlib
      scipy
      wheel
      tk
      ipykernel
      jupyter
      # tensorflowWithCuda
      keras
      notebook
      virtualenv
    ]))

    (python312.withPackages(ps: with ps; [
      pip
      requests
      numpy
      pandas
      pynvim
      matplotlib
      scipy
      wheel
      tk
    ]))
    pyright


    ## Rust
    cargo
    rustc
    rustup
    rust-analyzer	

    ## Go
    go
    gopls

    ## C/C++
    libgcc
    gcc
    libclang
    clang
    clang-tools
    ccls
    gnumake
    cmake

    ## Zig
    zig
    zls


    # ---


    # GNOME software/utils
    papers
    epiphany
    gnome.gnome-software
    gnome.gnome-tweaks
    gnome.cheese
    gnome-extension-manager
    gnome-podcasts
    papirus-icon-theme
    papirus-folders
    bibata-cursors
    easyeffects
    wike
    diebahn
    # Problem building
    # gaphor

    # gnome extensions
    gnomeExtensions.vitals
    gnomeExtensions.dash-to-dock
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.caffeine
    gnomeExtensions.removable-drive-menu
    gnomeExtensions.appindicator


    # fonts
    agave
    ubuntu_font_family
  ];

  # environment.sessionVariables = {
  #   LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
  # };

  environment.variables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };

  programs.fish.enable = true;
  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };


  hardware.cpu.amd.updateMicrocode = true;

  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    setLdLibraryPath = true;
  };

  # # Load amdgpu driver for Xorg and wayland
  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.amdgpu.initrd.enable = false;
  hardware.amdgpu.opencl.enable = false;
  # hardware.nvidia = {
  #     modesetting.enable = true;

  #     powerManagement.enable = true;
  #     powerManagement.finegrained = true;

  #     prime = {
  #     	offload = {
  #         enable = true;
  #         enableOffloadCmd = true;
  #       };
  #     	nvidiaBusId = "PCI:6:0:0";
  #     	amdgpuBusId = "PCI:1:0:0";
  #     };

  #     open = false;

  #     nvidiaSettings = true;

  #     package = config.boot.kernelPackages.nvidiaPackages.production;
  # };

  # GNOME setup


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?
}
