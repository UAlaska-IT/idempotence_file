# Idempotence File Cookbook

[![License](https://img.shields.io/github/license/ualaska-it/idempotence_file.svg)](https://github.com/ualaska-it/idempotence_file)
[![GitHub Tag](https://img.shields.io/github/tag/ualaska-it/idempotence_file.svg)](https://github.com/ualaska-it/idempotence_file)
[![Build status](https://ci.appveyor.com/api/projects/status/fe27w2nc5inonxaw/branch/master?svg=true)](https://ci.appveyor.com/project/UAlaska/idempotence-file/branch/master)

__Maintainer: OIT Systems Engineering__ (<ua-oit-se@alaska.edu>)

## Purpose

Sentinel files are often used to cheaply detect if some code has run once.
A typical example is shown below.

```ruby
idempotence_file = File.join('some_dir', 'some_file')

apt_update 'Pre-Install Update' do
  action :update
  not_if { File.exist?(idempotence_file) }
end

# Do we remember the dir the first time?
directory 'some_dir' do
  owner 'root'
  group 'root'
  mode 0o755
end

file idempotence_file  do
  content 'Who cares?'
  owner 'root'
  group 'root'
  mode 0o644
end
```

Such code is conceptually simple, but verbose and unnecessarily error prone.
Across many cookbooks, such code is also not DRY.

The resource provided by this cookbook reduces the sentinel pattern to two lines of code.
See the example below.

## Requirements

### Chef

This cookbook requires Chef 14+

### Platforms

Supported Platform Families:

* Debian
  * Ubuntu, Mint
* Red Hat Enterprise Linux
  * Amazon, CentOS, Oracle
* Suse

Platforms validated via Test Kitchen:

* Ubuntu
* Debian
* CentOS
* Oracle
* Fedora
* Amazon
* Suse

Notes:

* This cookbook should support any recent Windows or Linux variant.

### Dependencies

This cookbook does not constrain its dependencies because it is intended as a utility library.
It should ultimately be used within a wrapper cookbook.

## Resources

This cookbook provides one resources for managing idempotence files.

Both the content and the location of the file are implementation-defined.
A helper is provided for querying the existence of the file.

```ruby
# Returns true iff the file exists
idempotence_file?('Argument must match the name of the idempotence_file')
```

### idempotence_file

An idempotence_file manages a single file.

__Actions__

Two action are provided.

* `create` - Post condition is that the file exists.
* `delete` - Post condition is that the file does not exist.

__Attributes__

This resource has no attributes.

## Recipes

This cookbook includes no recipes.

## Attributes

This cookbook references no attributes.

## Examples

The `idempotence_file` resource can be used as below.

```ruby
apt_update 'Pre-Install Update' do
  action :update
  not_if { idempotence_file?('Pre-Install Update') }
end

idempotence_file 'Pre-Install Update'
```

## Development

See CONTRIBUTING.md and TESTING.md.
