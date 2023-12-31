{ config, pkgs, lib, ... }: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ vim curl htop lsof wget nano neofetch subversion ];

  networking = {
    useDHCP = lib.mkDefault false;
    firewall.enable = true;
    domain = "morrislan.net";
    usePredictableInterfaceNames = false;
    defaultGateway = lib.mkDefault "10.1.240.1";
    nameservers = lib.mkDefault [ "10.1.240.3" ];
  };

  boot.growPartition = true;
  fileSystems."/".autoResize = true;

  services.openssh = {
      enable = true;
      ports = [ 4022 ];
      openFirewall = true;
      settings.PasswordAuthentication = false;
  };

  programs.zsh = {
      enable = true;
      ohMyZsh = {
          enable = true;
          theme = "agnoster";
          plugins = [ "git" ];
      };
  };

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  users.defaultUserShell = pkgs.zsh;
  users.mutableUsers = false;
  users.users = {
    admin = {
      uid = 1000;
      isNormalUser = true;
      home = "/home/admin";
      name = "admin";
      group = "admin";
      shell = pkgs.zsh;
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHjgkh0LyGVjWzYnCxrKC5dxQMHE3ky7s/vFpAyjfk5l"
      ];
    };
  };
  users.groups.admin = {};
  security.sudo.wheelNeedsPassword = false;
}
