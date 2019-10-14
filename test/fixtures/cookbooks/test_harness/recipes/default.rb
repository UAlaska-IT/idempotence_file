# frozen_string_literal: true

file '/tmp/before' do
  owner 'root'
  group 'root'
  mode 0o644
  not_if { idempotence_file?('the first') }
end

idempotence_file 'the first' do
  action :delete
end

file '/tmp/empty' do
  owner 'root'
  group 'root'
  mode 0o644
  not_if { idempotence_file?('the first') }
end

idempotence_file 'the first'

file '/tmp/after' do
  owner 'root'
  group 'root'
  mode 0o644
  not_if { idempotence_file?('the first') }
end

idempotence_file 'the first' do
  action :delete
end

file '/tmp/deleted' do
  owner 'root'
  group 'root'
  mode 0o644
  not_if { idempotence_file?('the first') }
end

idempotence_file 'the first'

file '/tmp/phoenix' do
  owner 'root'
  group 'root'
  mode 0o644
  not_if { idempotence_file?('the first') }
end
