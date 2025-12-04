# OCP Nix Templates

Boilerplate templates abstracting normal Nix patterns.

We are moving towards integrating the [Nix package
manager](https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://nixos.org/&ved=2ahUKEwiRqLfk7qORAxWzdUEAHW0uHXIQFnoECBUQAQ&usg=AOvVaw1McHC3BZCVO6MuuvLZJnA9)
to handle elements of our local development environment workflow.

While we always containerize our services and workloads, and while having a
100% containerized development environment is an effective solution that we
have relied on for some time, a hybrid approach that strikes a balance between
running the same images that will become deployment artefacts while installing
well-specified, predictable, reproducible, fully-isolated and immutable
environments locally, leads to a tighter development feedback loop overall.
Which is something (like writing fast tests) that we are always trying to
improve on.
