# frozen_string_literal: true

# @abstract
class Literal::Maybe < Literal::Monad
	abstract!

	# @!method empty?
	# 	@return [Boolean]
	abstract :empty?

	# @!method nothing?
	# 	@return [Boolean]
	abstract :nothing?

	# @!method something?
	# 	@return [Boolean]
	abstract :something?

	# @!method deconstruct
	abstract :deconstruct

	# @!method deconstruct_keys(_)
	abstract :deconstruct_keys

	# @!method maybe
	abstract :maybe

	# @return [void]
	def call(&)
		Literal::Case.new(Literal::Some, Literal::Nothing, &)[self].call(@value)
	end
end
