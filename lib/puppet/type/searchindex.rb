require 'pathname'

Puppet::Type.newtype(:searchindex) do
  @doc = "Adds a new search index to the search config"

  ensurable do
    desc ""

    defaultto(:present)

    newvalue(:present) do
      provider.create
    end

    newvalue(:absent) do
      provider.destroy
    end
  end

  newparam(:name) do
    desc "The name of the search index"
  end

  newparam :configfile do
    desc "The Path to the search config file"
    validate do |value|
      unless (Pathname.new value).absolute?
        raise ArgumentError, "Path to configuration has to be absolute, '#{value}' given."
      end
    end
  end
end
