class Train
  attr_reader(:id, :line, :city, :arriv, :depar)

  define_method(:initialize) do |attributes|
    @id = attributes[:id]
    @line = attributes.fetch(:line)
    @city = attributes.fetch(:city)
    @arriv = attributes.fetch(:arriv)
    @depar = attributes.fetch(:depar)
  end

  define_singleton_method(:all) do
    returned_train = DB.exec("SELECT id, line, city, arriv, depar FROM trains;")
    trains = []
    returned_train.each() do |train|
      id = train.fetch('id').to_i()
      line = train.fetch('line')
      city = train.fetch('city')
      depar = train.fetch('depar')
      arriv = train.fetch('arriv')
      trains << (Train.new({:id => id, :line => line, :city => city,:depar => depar, :arriv => arriv}))
    end
    trains
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO trains (line, city, arriv, depar) VALUES ('#{line}', '#{city}', '#{arriv}', '#{depar}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  define_singleton_method(:find) do |id|
    result = DB.exec("SELECT * FROM trains WHERE id = #{id};")
    id = result.first().fetch("id")
    Train.new({:line => line, :id => id})
  end

  define_singleton_method(:delete) do
    DB.exec("DELETE FROM trains WHERE id = #{self.id()};")
    Train.delete()
  end

  define_method(:select_by_city) do
    @loc = here
    result = DB.exec("SELECT * FROM trains WHERE city = '#{here}'")
  end

  define_method(:==) do |otherline|
    (self.line() == otherline.line()&&(self.city() == otherline.city()&&(self.arriv == otherline.arriv()&&(self.depar() == otherline.depar()))))
  end
end
