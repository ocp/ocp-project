# ocp.project

A repository of reusable definitions, modules, templates, boilerplate and
utilities for software development projects.

Eventually this repo will contain:

- [`Dockerfile` definitions](src/docker) for CI/CD toolchains, IaC provisioning, application workloads, etc.
- [Boilerplate blueprints and templates](src/boilerplate) for provisioning new files, modules and projects.
- CI/CD patterns for scanning, integrating and deploying containerized workloads.
- Reusable and 'higher-order' [Terraform modules](src/tf/modules).
- Utilities for implementing local developer environments.
- Various handy [scripts](src/scripts).

And whatever additional bits and pieces we find useful throughout our various
toolchains.

> **WARNING**: This material is tailored to our own working preferences and
specifications and is in some sense 'opinionated'. It is **not** meant to be a
general open-source library and you should expect it change at our convenience,
possibly breaking interfaces and expectations. That said, if you find anything
useful or you'd like to use yourself, please go ahead! We probably can't accept
pull requests or solve any issues for you at this point in time, unless you've
got something really compelling to say.

---

<a href="https://opensource.org/licenses/Apache-2.0">
  <img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg?style=for-the-badge" alt="License">
</a>

This code is licensed under the Apache License 2.0.
See the [LICENSE](LICENSE) file for details.
