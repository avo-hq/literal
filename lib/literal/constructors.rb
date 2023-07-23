# frozen_string_literal: true

module Literal::Constructors
	# @return [Literal::Array]
	def Array(type)
		Literal::ArrayType.new(type)
	end

	# @return [Literal::LRU]
	def LRU(key_type, value_type)
		Literal::LRUType.new(key_type, value_type)
	end

	# @return [Literal::Variant]
	def Variant(*types)
		if block_given?
			Literal::Variant.new(yield, *types)
		else
			Literal::VariantType.new(*types)
		end
	end

	# @return [Literal::Decorator]
	def Decorator(object_type)
		Class.new(Literal::Decorator) do
			attribute :__object__, object_type, positional: true, reader: :public, writer: :private
		end
	end
end
