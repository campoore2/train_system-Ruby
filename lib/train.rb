class Train
  attr_reader(:id, :line, :city, :arriv, :depar)

  define_method(:initialize) do |attributes|
    @id = attributes[:id] || nil
    @line = attributes.fetch(:line)
    @city = attributes.fetch(:city)
    @arriv = attributes.fetch(:arriv)
    @depar = attributes.fetch(:depar)
  end

end
