# frozen_string_literal: true

StubPerson   = Struct.new(:id, :first, :middle, :last, :house_id, :house)
StubPersonAd = Struct.new(:id, :addresses)
StubPersonEM = Struct.new(:id, :emails)
StubPersonPh = Struct.new(:id, :phones)
StubPersonPn = Struct.new(:id)

StubHouse    = Struct.new(:id, :number, :street, :lots)
StubLink     = Struct.new(:id, :house, :lot)
StubAddress  = Struct.new(:id, :number, :street, :city, :state, :zip, :person)
StubEmail    = Struct.new(:id, :addr, :person)
StubPhone    = Struct.new(:id, :area, :prefix, :number, :person)
StubPosition = Struct.new(:id, :person, :name, :date_range)
StubContribution = Struct.new(:id, :amount_cents, :house, :date_paid)
StubOwnership = Struct.new(:id, :owner, :property)

StubPerson1  = Struct.new(:id, :fullname, :sortable_name)
StubHouse1   = Struct.new(:id, :house_address, :lots)
StubAddress1 = Struct.new(:id, :address,   :person)
StubEmail1   = Struct.new(:id, :addr,      :person)
StubPhone1   = Struct.new(:id, :ph_number, :person)
