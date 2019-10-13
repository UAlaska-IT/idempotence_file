# frozen_string_literal: true

resource_name :idempotence_file
provides :idempotence_file

default_action :create

action :create do
  create_i_file(@new_resource)
end

action :delete do
  delete_i_file(@new_resource)
end

action_class do
  include IdempotenceFile::Helper
end
