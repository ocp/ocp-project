# OCP Terraform Modules

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

## Higher-Order Modules

Another thing you might notice is that all modules other than the label module
itself expect a reference to a `label` resource to be passed in as a variable.

This is, again, due to our conventions: we think the
[`terraform-null-label`](https://github.com/cloudposse/terraform-null-label)
resource is by the far the best, easiest and least verbose way (that we've
found so far) to predictably manage resource naming and tagging, but also that
we don't ever just use these modules on their own, we always embed them in
another module that is (at least) one level upwards in abstraction. That
calling module can then pass its own label context into the resources it
creates and we can then capture that scope and **extend** those labels, which
then inherently reflects the overall call graph in an automated way.

It's hard won knowledge for us to organize our Terraform stacks topologically,
in the form of a DAG (where edges are dependencies) and **never** just
following the concrete resources as the organizing principle.

In this way, we would never have a `ecs` or a `lambda` module as a terminating
node on our DAG. While we might have a reusable `cloudfront` module, that
module will be always be instantiated as part of a `cdn` node on the dependency
tree. While we might have a `waf` module, that will then become part of a more
abstract `firewall` module, etc.

This also aids co-location. For example, we can just instantiate bucket
resources or secret resources directly next to the services that need to use
them. Everything a DAG node needs to function (that is not a dependency to be
passed in) can encapsulated together inside that node when seen from the
highest level.

A happy side-effect of this is that it often radically simplifies the
dependency tree. You don't need to pass so many values around and everything
keeps its own scope as far as possible.

These patterns are generally superior because it means we aren't just slaves to
the conventions of the cloud provider. We don't always have to think only in
terms of their services and, if we ever decide that another CDN resource might
actually be preferable for us, all we need to do is switch out the definitions
inside the `cdn` module. We never have to completely rename it which could
cause all kinds of annoying side-effects and regressions throughout the stack
and generally would be much more of a pain to do.

In effect, we have decoupled our own abstractions from those that we might
otherwise be forced to work with, that might possibly go against our own
thinking.

The modules in this repo, therefore, can already be considered as somewhat
higher-order, slightly less general in character than the normal, third-party
Terraform modules offered by some vendor. And that is because we are already
attempting to fit them into this kind of module hierarchy, from more specific
to more abstract, that eases our own domain thinking and ability to generate
clear and obvious design throughout our IaC stacks.

Feel free to use them, but YMMV in terms of how useful they are for you, and of
course, they might be altered in the future.

> Stay tuned, as we intend to write a full guide to the way we organize our
> Terraform code that will cover these patterns in detail.
