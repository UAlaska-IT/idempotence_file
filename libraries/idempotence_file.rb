# frozen_string_literal: true

module IdempotenceFile
  # This module implements utility code
  I_DIRECTORY = '/var/chef/idempotence'

  # This module implements public interfaces that are included in client code
  module Public
    def idempotence_file?(name)
      path = File.join(I_DIRECTORY, name)
      return File.exist?(path)
    end
  end

  # This module implements utility code
  module Helper
    def create_directory
      directory I_DIRECTORY do
        owner 'root'
        group 'root'
        mode '755'
        recursive true
      end
    end

    def create_i_file(new_resource)
      create_directory
      file File.join(I_DIRECTORY, new_resource.name) do
        content 'Sentinel file'
        owner 'root'
        group 'root'
        mode '644'
      end
    end

    def delete_i_file(new_resource)
      file File.join(I_DIRECTORY, new_resource.name) do
        action :delete
      end
    end
  end
end

Chef::DSL::Recipe.include(IdempotenceFile::Public)
Chef::DSL::Recipe.include(IdempotenceFile::Public)
Chef::Resource.include(IdempotenceFile::Public)
