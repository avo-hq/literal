# frozen_string_literal: true

class Literal::Struct < Literal::DataStructure
	class << self
		def prop(name, type = nil, kind = :keyword, reader: :public, writer: :public, default: nil)
			super
		end
	end
end
