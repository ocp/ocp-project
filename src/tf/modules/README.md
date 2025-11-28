OCP Terraform Modules

A collection of reusable Terraform modules that OCP uses throughout its
projects.

Many of these modules wrap open-source, third-party modules in order to
abstract away and alter their boundaries or interfaces for our own convenience
and to enforce our own community standards.

For example, the `label` module guarantees our expected resource tagging
structure which reflects our common project and service namespacing patterns.
The `bucket` module streamlines our general s3 bucket usage and cleans up some
of that module's suboptimal naming patterns. Sometimes a module might abstract
a small cluster of resources alongside a central resource that we know we
will always require so they can be treated together as a single unit.

These modules might, therefore, be considered slighty higher-order, slightly
less general in character than the normal, third-party Terraform modules
offered by some vendor.

Feel free to use them, but due to the above YMMV in terms of how useful they
are for you.
