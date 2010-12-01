Given /^a ([^"]*) with "([^"]*)" "([^"]*)"$/ do |klass, field, value|
  @model = Factory.create(klass.to_sym, field.to_sym => value)
end
