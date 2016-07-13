class Rider
  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @id = attributes[:id] || nil
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    returned_rider = DB.exec("SELECT * FROM riders;")
    riders =[]
    returned_rider.each() do |rider|
      id = rider.fetch("id").to_i
      name = rider.fetch("name")
      rider << rider.new({:name => name, :id => id})
    end
    riders
  end
end
