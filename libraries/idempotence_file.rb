# frozen_string_literal: true

module IdempotenceFile
  # This module implements shared utility code for consistency with dependent cookbooks
  module Public
  end
  module Helper
    TCB = 'idempotence_file'
  end
end

Chef::Provider.include(IdempotenceFile::Helper)
Chef::Recipe.include(IdempotenceFile::Helper)
Chef::Resource.include(IdempotenceFile::Helper)
