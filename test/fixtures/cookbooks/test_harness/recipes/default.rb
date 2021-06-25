# frozen_string_literal: true

require 'tmpdir'

temp_dir = Dir.tmpdir

file File.join(temp_dir, 'before') do
  owner 'root'
  group 'root'
  mode '644'
  not_if { idempotence_file?('the first') }
end

idempotence_file 'the first' do
  action :delete
end

file File.join(temp_dir, 'empty') do
  owner 'root'
  group 'root'
  mode '644'
  not_if { idempotence_file?('the first') }
end

idempotence_file 'the first'

file File.join(temp_dir, 'after') do
  owner 'root'
  group 'root'
  mode '644'
  not_if { idempotence_file?('the first') }
end

idempotence_file 'the first' do
  action :delete
end

file File.join(temp_dir, 'deleted') do
  owner 'root'
  group 'root'
  mode '644'
  not_if { idempotence_file?('the first') }
end

idempotence_file 'the first'

file File.join(temp_dir, 'phoenix') do
  owner 'root'
  group 'root'
  mode '644'
  not_if { idempotence_file?('the first') }
end
