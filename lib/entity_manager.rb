class EntityManager
  class << self
    attr_accessor :entities
  end

  def self.register(entity, type)
    entities[entity] << symbolize(type)
  end

  def self.entities_with(*components)
    entities.map { |entity, types| entity if includes_all?(types, components) }.compact
  end

  def self.includes_all?(collection, items)
    (collection & items).to_set == items.to_set
  end

  def self.symbolize(type)
    type.name.demodulize.underscore.to_sym
  end

  def self.entities
    @entities ||= Hash.new { |h,k| h[k] = [] }
  end
end
