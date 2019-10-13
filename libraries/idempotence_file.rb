# frozen_string_literal: true

module IdempotenceFile
  # This module implements public interfaces that are included in client code
  module Public
    def idempotence_file?(name)
      path = File.join(i_directory, name)
      return File.exist?(path)
    end
  end

  # This module implements utility code
  module Helper
    def i_directory
      return '/var/chef/idempotence'
    end

    def create_directory
      directory i_directory do
        owner 'root'
        group 'root'
        mode 0o755
        recursive true
      end
    end

    def create_i_file(new_resource)
      create_directory
      file File.join(i_directory, new_resource.name) do
        content 'Sentinel file'
        owner 'root'
        group 'root'
        mode 0o644
      end
    end

    def delete_i_file(new_resource)
      file File.join(i_directory, new_resource.name) do
        action :delete
      end
    end
  end
end

Chef::Provider.include(IdempotenceFile::Helper)
Chef::Recipe.include(IdempotenceFile::Helper)
Chef::Resource.include(IdempotenceFile::Helper)
