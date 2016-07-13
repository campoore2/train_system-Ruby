class Train
  attr_reader(:id, :line, :city, :arriv, :depar)

  define_method(:initialize) do |attributes|
    @id = attributes[:id]
    @line = attributes.fetch(:line)
    @city = attributes.fetch(:city)
    @arriv = attributes.fetch(:arriv)
    @depar = attributes.fetch(:depar)
  end

  # define_singleton_method(:all) do
  #   returned_train = DB.exec("SELECT id, line, city, arriv, depar FROM trains;")
  #   trains = []
  #   returned_train.each() do |train|
  #     @id = attributes[:id].to_i()
  #     @line = attributes.fetch(:line)
  #     @city = attributes.fetch(:city)
  #     @arriv = attributes.fetch(:arriv)
  #     @depar = attributes.fetch(:depar)
  #     trains << (Train.new({:line => 'line', :city => 'city', :arriv => 'arriv', :depar => 'depar'}))
  #   end
  #   trains
  # end

  define_method(:all) do
    result = DB.exec("INSERT INTO trains(line, city, arriv, depar) VALUES('#{line}', '#{city}', '#{arriv}', '#{depar}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  define_method(:==) do |otherline|
    (self.line() == otherline.line().&(self.city() == otherline.city().&(self.arriv == otherline.arriv().&(self.depar() == otherline.depar()))))
  end
end
