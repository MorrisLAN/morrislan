{ config, pkgs, ... }:
{
  
  networking.extraHosts = "10.1.240.5 hc-ch-1.morrislan.net";

  environment.systemPackages = with pkgs; [
    kompose
    kubectl
    kubernetes
  ];

  services.kubernetes = {
    roles = ["master" "node"];
    masterAddress = "hc-ch-1.morrislan.net";
    apiserverAddress = "https://hc-ch-1.morrislan.net:6443";
    easyCerts = true;
    addons.dns.enable = true;
    kubelet.extraOpts = "--fail-swap-on=false";
    apiserver = {
      securePort = "6443";
      advertiseAddress = "10.1.240.5";
    };
  };
}