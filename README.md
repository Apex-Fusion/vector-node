# Vector Node

Node implementation for **Vector**, the Apex Fusion eUTXO L2. Derived from [cardano-node](https://github.com/IntersectMBO/cardano-node) (Ouroboros consensus, Conway era).

**Status: work in progress.** Building from this repository is not the supported way to run a Vector node yet. To run a node today, use the docker setups:

- [vector-mainnet-docker](https://github.com/Apex-Fusion/vector-mainnet-docker) - mainnet
- [vector-docker](https://github.com/Apex-Fusion/vector-docker) - public testnet

Building AI agents on Vector instead of running infrastructure? Start at the [Vector AI documentation](https://apex-fusion.github.io/vector-ai-documentation/).

## Instructions

To run the vector node:
```
  vector-node run  [--topology FILEPATH] [--database-path FILEPATH]
                   [--socket-path FILEPATH]
                   [--byron-delegation-certificate FILEPATH]
                   [--byron-signing-key FILEPATH]
                   [--shelley-kes-key FILEPATH]
                   [--shelley-vrf-key FILEPATH]
                   [--shelley-operational-certificate FILEPATH]
                   [--start-as-non-producing-node]
                   [--host-addr IPV4-ADDRESS]
                   [--host-ipv6-addr IPV6-ADDRESS]
                   [--port PORT]
                   [--config NODE-CONFIGURATION] [--validate-db]
```

## Links

- [Apex Fusion](https://apexfusion.org/) and the [organization overview](https://github.com/Apex-Fusion)
- Original Cardano Node [README](https://github.com/Apex-Fusion/vector-node/blob/initial-branch/cardano-README)

# A Note from the Apex Fusion Foundation

This repository is built on top of the work done by the Cardano project, originally developed and maintained by Input Output Global (IOG), the Cardano Foundation, and Intersect. We are deeply grateful for their commitment to open-source development and their significant contributions to the community. Our intention is to build upon their excellent foundation, extending and enhancing the project's capabilities while maintaining alignment with its core principles. Through this repository, we aim to contribute back to the ecosystem, fostering innovation and collaboration. We encourage users and developers to acknowledge the original work of those teams as we continue to evolve this project.
