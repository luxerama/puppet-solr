require 'nokogiri'

Puppet::Type.type(:searchindex).provide :solr do
  @doc = "Manage solr cores in config"

  def create
    Puppet.debug("Puppet::Provider::SearchIndex: creating search index for #{@resource.value :name}")
    f = File.open @resource.value(:configfile), "r"
    doc = Nokogiri::XML f
    f.close
    doc.at('cores') << "<core name='#{name}' instanceDir='#{@resource.value :name}' />\n"
    f = File.open @resource.value(:configfile), "w"
    f.write doc
    f.close
  end

  def destroy
    Puppet.debug("Puppet::Provider::SearchIndex: destroying search index for #{@resource.value :name}")
    f = File.open @resource.value(:configfile), "r"
    doc = Nokogiri::XML f
    f.close
    res = doc.xpath "//core[@name='#{@resource.value :name}']"
    res.first.remove
    f = File.open @resource.value(:configfile), "w"
    f.write doc
    f.close
  end

  def exists?
    Puppet.debug("Puppet::Provider::SearchIndex: checking existence of search index for #{@resource.value :name}")
    f = File.open @resource.value :configfile
    doc = Nokogiri::XML f
    f.close
    res = doc.xpath "//core[@name='#{@resource.value :name}']"
    res.length > 0 ? true : false
  end
end
