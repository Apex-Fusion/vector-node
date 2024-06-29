{ pkgs
, customConfigs ? [ pkgs.customConfig ]
}:
with pkgs.commonLib;
let
  mkScript = envConfig: let
    service = evalService {
      inherit pkgs customConfigs;
      serviceName = "vector-node";
      modules = [
        ./nixos/vector-node-service.nix
        ({config, ...}: {
          services.vector-node = let cfg = config.services.vector-node; in {
            hostAddr = mkDefault "0.0.0.0";
            environment = mkDefault envConfig.name;
            nodeConfig = cfg.environments.${cfg.environment}.nodeConfig;
            stateDir = mkDefault "state-node-${cfg.environment}";
            runtimeDir = mkDefault null;
          } // optionalAttrs (envConfig ? topology) {
            topology = mkDefault envConfig.topology;
          };
        })
      ];
    };
  scriptBin = pkgs.writeScriptBin "vector-node-${service.environment}" ''
    #!${pkgs.runtimeShell}
    export PATH=$PATH:${makeBinPath [ pkgs.coreutils ]}
    set -euo pipefail
    mkdir -p "$(dirname "${service.socketPath 0}")"
    ${service.script} $@
  '';
  in scriptBin // {
    exePath = "${scriptBin}/bin/vector-node-${service.environment}";
  };

in forEnvironments (environment: recurseIntoAttrs rec {
  node = mkScript environment;
})
