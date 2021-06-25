# frozen_string_literal: true

name 'idempotence_file'
maintainer 'OIT Systems Engineering'
maintainer_email 'ua-oit-se@alaska.edu'
license 'MIT'
description 'Provides a resource for managing a sentinel file'

git_url = 'https://github.com/ualaska-it/idempotence_file'
source_url git_url
issues_url "#{git_url}/issues"

version '1.1.0'

supports 'ubuntu', '>= 14.0'
supports 'debian', '>= 8.0'
supports 'redhat', '>= 6.0'
supports 'centos', '>= 6.0'
supports 'oracle', '>= 6.0'
supports 'fedora'
supports 'amazon'
supports 'suse'
# supports 'opensuse'
# supports 'windows', '>= 6.1' # Windows 2008R2 or 7, see https://en.wikipedia.org/wiki/List_of_Microsoft_Windows_versions

chef_version '>= 14.0'
